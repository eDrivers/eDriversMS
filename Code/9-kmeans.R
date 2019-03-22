# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')

# ~~~~~~~~~~~~~~~~~~~ Data prep ~~~~~~~~~~~~~~~~~~~ #
# Data needs to be scaled for clustering
dr <- scale(dr)

# ~~~~~~~~~~~~~~~~~~~ k-means clustering ~~~~~~~~~~~~~~~~~~~ #
# Cluster analysis
k <- 2:10
kMeans <- list('list', length(k))
for(i in k) {
  cat("   k: ", i, "\r")
  kMeans[[i]] <- kmeans(x = dr,
                      centers = i,
                      iter.max = 1000,
                      nstart = 25,
                      algorithm = 'Lloyd')
}
kMeans[[1]] <- NULL
save(kMeans, file = './data/kmeans.RData')


# ~~~~~~~~~~~~~~~~~~~ Average silhouette width ~~~~~~~~~~~~~~~~~~~ #
# Silhouette needs to be computed manually here, because the general function crashes
# This will make a very inefficient function, but one that will work
sil <- function(x, cl) {
  # Euclidian distance function between a single point and another point or a string of points
  euc <- function(x, y) {
    if(is.null(dim(y))) {
      sqrt(sum((x - y) ^ 2))
    } else {
      sqrt(colSums((x - t(y)) ^ 2))
    }
  }

  # Number of rows in dataset x
  nr <- length(cl)

  # Clusters in dataset
  k <- unique(cl)

  # Empty data.frame to store silhouette information
  df <- data.frame(cluster = numeric(nr),
                   neighbor = numeric(nr),
                   sil_width = numeric(nr),
                   stringsAsFactors = F)
  # Calculate silhouette for all data points in dataset x
  for(i in 1:nr) {
    # Cluster of data point i
    df$cluster[i] <- cl[i]

    # ID of points in cluster of point i
    id <- cl == df$cluster[i]

    # a = mean distance of point i to all points within its cluster
      a <- euc(x[i, ], x[id, ]) %>%
           mean()

    # b =  bi is the smallest average distance of i to all points in any other
    #      cluster of which i is not a member.
      # Clusters of which i is not a member
      kb <- k[k != df$cluster[i]]

      # Empty names string to store distances of i to objects in other clusters
      b <- numeric(length(kb))
      names(b) <- kb

      # Distance between i and objects in other clusters
      for(j in 1:length(kb)) {
        # ID of points in first kb cluster
        id <- cl == kb[j]
        b[j] <- euc(x[i, ], x[id, ]) %>%
                mean()
      }

      # Identify neighbour of i, which is the cluster of which i is not a member
      # and with minimum distance to i
      df$neighbor[i] <- as.numeric(names(which.min(b)))

      # b is the average distance of i to its neighbor cluster
      b <- min(b)

      # Evaluate silhouette width: si = (bi - ai) / (max(ai, bi))
      df$sil_width[i] <- (b - a) / max(c(a,b))
  }
  return(df)
}

# Now calculate the silhouette width for all observations
aswMean <- vector('list', length(k))
for(i in 1:length(k)) {
  cat("   i: ", i, ' of ', length(k), "\r")
  aswMean[[i]] <- sil(dr, kMeans[[i]]$cluster)
  save(aswMean, file = './data/aswMean.RData')
}

# Next get mean silhouette width for each k value
aswMean2 <- unlist(lapply(aswMean, function(x) mean(x$sil_width)))
save(aswMean2, file = './data/aswMean2.RData')


# ~~~~~~~~~~~~~~~~~~~ Elbow method ~~~~~~~~~~~~~~~~~~~ #
# Verify number of clusters by using the elbow method,
# i.e. the inflexion point in the sum of squared error (SSE) scree plot
# Extract within cluster sum of squared error (WSS) from each clustering run
# Wss function
load('./data/wssMedoid.RData')
wssMean <- wssMedoid[1]
for(i in k) wssMean[i] <- kMeans[[i-1]]$tot.withinss
save(wssMean, file = './data/wssMean.RData')
