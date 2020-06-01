# source('./Code/Figures/S5-Dissimilarity_Contribution.R')
# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./Code/0-Param.R')

# ~~~~~~~~~~~~~~~~~~~ EXTRA LIBRARIES ~~~~~~~~~~~~~~~~~~~ #
library(gridExtra)
library(ggplot2)
library(ggplotify)
library(grid)


# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./Data/Clustering/k.RData')
load('./Data/Clustering/Clusters.RData')
load('./Data/Clustering/simperMean.RData')


# ~~~~~~~~~~~~~~~~~~~ FUNCTION ~~~~~~~~~~~~~~~~~~~ #
source('./Code/Functions/circularPlot.R')
source('./Code/Functions/butterfly.R')


# ~~~~~~~~~~~~~~~~~~~ INDIVIDUAL CONTRIBUTION TO INTER-CLUSTER DISSIMILARITY ~~~~~~~~~~~~~~~~~~~ #
# Driver percent contribution to dissimilarity
contDiss <- lapply(simperMean, function(x) x[,'contr'] / sum(x[,'contr'])) %>%
            as.data.frame()
colnames(contDiss) <- names(simperMean)

# Total dissimilarity
totDiss <- unlist(lapply(simperMean, function(x) sum(x[, 'contr'])))

# Driver intensity in compared clusters
drInt1 <- lapply(simperMean, function(x) x[,'ava']) %>%
          as.data.frame()
drInt2 <- lapply(simperMean, function(x) x[,'avb']) %>%
          as.data.frame()

# Mean value in each cluster
totMean <- numeric(k)
for(i in 1:k) {
  id <- clMed == i
  totMean[i] <- mean(as.matrix(dr[id, ]))
}

# Fish
fish <- matrix(ncol = 5, nrow = 7, dimnames = list(c(), drNames$var[5:9]))
for(i in 1:k) {
  id <- clMed == i
  for(j in colnames(fish)) {
    fish[i, j]<- sum((dr[id, j]))
  }
}

fish <- apply(fish, 2, function(x) round(x / sum(x) * 100))

# Set figure layout view
mat <- matrix(0,k,k)
mat[lower.tri(mat)] <- (max(mat)+1):(sum(lower.tri(mat)) + max(mat))
diag(mat) <- (max(mat)+1):(max(mat)+k)
mat <- t(mat)
mat[lower.tri(mat)] <- (max(mat)+1):length(mat)
mat <- t(mat)
mat <- rbind(mat, c(100,rep(max(mat)+1, 4),100))

# Circulat plots
p1 <- vector('list', ncol(contDiss))
for(i in 1:length(contDiss)) {
  temp <- data.frame(individual = drNames$accr,
                     group = drNames$group,
                     value = round(contDiss[, i]*100))
  rownames(temp) <- NULL
  temp2 <- round(totDiss[i], 2)
  p1[[i]] <- circularPlot(temp, temp2)
}

# Individual clusters
egsl <- st_centroid(egslGrid)
p2 <- vector('list', k)
for(i in 1:length(p2)) {
  # Identify observations in cluster i
  id <- clMed == i

  # Select only grid cells in cluster i
  temp <- egsl %>%
          filter(clMed == i) %>%
          st_coordinates() %>%
          as.data.frame()

  ext <- st_bbox(egsl)

  p2[[i]] <- ggplot() +
             geom_sf(data = egslSimple, fill = NA) +
             geom_point(aes(x = X, y = Y), colour = '#187962', size = .01, data = temp) +
             coord_sf(crs = st_crs(egslSimple), datum = NA) +
             annotate("text",
                      x = ext$xmin + diff(c(ext$xmin, ext$xmax))*.2,
                      y = ext$ymax - diff(c(ext$ymin, ext$ymax))*.05,
                      label = paste0('Cluster ', i),
                      color="black",alpha=0.6, size=5) +
             theme(
                panel.ontop = TRUE,   ## Note: this is to make the panel grid visible in this example
                panel.grid = element_blank(),
                line = element_blank(),
                rect = element_blank(),
                text = element_blank(),
                plot.background = element_rect(fill = "transparent"))
}


# Driver intensity per cluster
p3 <- vector('list', ncol(drInt1))
for(i in 1:ncol(drInt1)) {
  p3[[i]] <- as.ggplot(~butterfly(drInt1[, i], drInt2[, i]))
}

# Group legend
grLegend <-function() {
  xDiff <- 1/nGroup
  xGap <- .075
  cols <- gg_color_hue(nGroup)[1:nGroup]
  plot0(xlim = c(0,1), ylim = c(0,1))
  for(i in 1:nGroup) {
    x1 <- (i*xDiff) - xGap - xDiff/2
    x2 <- (i*xDiff) + xGap - xDiff/2
    y1 <- .25
    y2 <- .75
    polygon(x = c(x1, x2, x2, x1, x1),
            y = c(y1, y1, y2, y2, y1),
            col = cols[i],
            border = '#000000')
    text(x = (i*xDiff) - xDiff/2,
         y = 0,
         labels = grNames$name[i],
         adj = c(.5,.5),
         font = 2)
  }
}

p4 <- list(as.ggplot(~grLegend()))

# List of all plots
p <- c(p1,p2,p3,p4)

# Full plot
jpeg('./figures/interDissimilarity.jpg', width = 2500, height = 2500, res = 200, pointsize = 7)
grid.arrange(grobs = p,
             layout_matrix = mat,
             heights = c(1,1,1,1,1,1,.5),
             right = textGrob('Driver intensity', gp=gpar(fontsize=20,fontface='bold'), rot = -90),
             left = textGrob('Cumulative dissimilarity contribution', gp=gpar(fontsize=20,fontface='bold'), rot = 90),
             padding = unit(2.5, "line"))
dev.off()
