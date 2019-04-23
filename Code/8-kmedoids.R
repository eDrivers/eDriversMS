# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')

# ~~~~~~~~~~~~~~~~~~~ Data prep ~~~~~~~~~~~~~~~~~~~ #
# Data needs to be scaled for clustering
dr <- scale(dr)

# ~~~~~~~~~~~~~~~~~~~ k-medoids clustering ~~~~~~~~~~~~~~~~~~~ #
# Cluster analysis
nSample <- 100
sampleSize <- 10000
k <- 2:10
kmedoid <- vector('list', length(k)+1)
for(i in k) {
  cat("   k: ", i, "\r")
  kmedoid[[i]] <- clara(dr,
                        k = i,
                        sampsize = sampleSize,
                        samples = nSample,
                        metric="manhattan",
                        stand = TRUE,
                        keep.data = FALSE)
save(kmedoid, file = './data/kmedoid.RData')
}
kmedoid[[1]] <- NULL
save(kmedoid, file = './data/kmedoid.RData')

# ~~~~~~~~~~~~~~~~~~~ Average silhouette width ~~~~~~~~~~~~~~~~~~~ #
aswMedoid <- unlist(lapply(kmedoid, function(x) x$silinfo$avg.width))
save(aswMedoid, file = './data/aswMedoid.RData')

# ~~~~~~~~~~~~~~~~~~~ Elbow method ~~~~~~~~~~~~~~~~~~~ #
# Verify number of clusters by using the elbow method,
# i.e. the inflexion point in the sum of squared error (SSE) scree plot
# Extract within cluster sum of squared error (WSS) from each clustering run
# Wss function
wss <- function(x) (nrow(x)-1) * sum(apply(x,2,var))

# Measure for each k and each cluster
wssMedoid <- wss(dr)
for(i in 1:length(kmedoid)) { # For each k value tested
  wssTemp <- numeric()
  for(j in 1:k[i]) { # For each cluster
    id <- kmedoid[[i]]$clustering == j # Identify observations in cluster j
    wssTemp[j] <- wss(dr[id, ])
  }
  wssMedoid[k[i]] <- sum(wssTemp)
}
save(wssMedoid, file = './data/wssMedoid.RData')
