# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')

# ~~~~~~~~~~~~~~~~~~~ EXTRA LIBRARIES ~~~~~~~~~~~~~~~~~~~ #
library(gridExtra)
library(ggplot2)
library(ggplotify)
library(grid)


# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./data/k.RData')
load('./data/clMed.RData')
load('./data/similarityMean.RData')


# ~~~~~~~~~~~~~~~~~~~ FUNCTION ~~~~~~~~~~~~~~~~~~~ #
source('./code/circularPlot.R')


# ~~~~~~~~~~~~~~~~~~~ SIMILARITY CONTRIBUTION ~~~~~~~~~~~~~~~~~~~ #
# Driver percent contribution to dissimilarity
contSim <- lapply(similarityMean, function(x) x[,'average'] / sum(x[,'average'])) %>%
            as.data.frame()
colnames(contSim) <- names(similarityMean)

# Total similarity
totSim <- lapply(similarityMean, function(x) sum(x[,'average'])) %>%
          as.data.frame()

# Circulat plots
p1 <- vector('list', ncol(contSim))
for(i in 1:length(contSim)) {
  temp <- data.frame(individual = drNames$accr,
                     group = drNames$group,
                     value = round(contSim[, i]*100))
  rownames(temp) <- NULL
  temp2 <- round(totSim[i],2)
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

  p2[[i]] <- ggplot() +
             geom_sf(data = egslSimple, fill = NA) +
             geom_point(aes(x = X, y = Y), colour = '#187962', size = .01, data = temp) +
             coord_sf(crs = st_crs(egslSimple), datum = NA) +
             annotate("text", x = 100000, y = st_bbox(egsl)$ymax-10000, label = paste0('Cluster ', i), color="black",alpha=0.6, size=5) +
             theme(
                panel.ontop = TRUE,   ## Note: this is to make the panel grid visible in this example
                panel.grid = element_blank(),
                line = element_blank(),
                rect = element_blank(),
                text = element_blank(),
                plot.background = element_rect(fill = "transparent"))
}

# Group legend
grLegend <-function() {
  xDiff <- 1/nGroup
  xGap <- .075
  cols <- gg_color_hue(nGroup)[1:nGroup]
  plot0(xlim = c(0,1), ylim = c(0,1))
  for(i in 1:nGroup) {
    y1 <- (i*xDiff) - xGap - xDiff/2
    y2 <- (i*xDiff) + xGap - xDiff/2
    x1 <- 0
    x2 <- .3
    polygon(x = c(x1, x2, x2, x1, x1),
            y = c(y1, y1, y2, y2, y1),
            col = cols[i],
            border = '#000000')
    text(x = .375,
         y = (i*xDiff) - xDiff/2,
         labels = grNames$name[i],
         adj = c(0,.5),
         font = 2)
  }
}

p3 <- list(as.ggplot(~grLegend()))


# Layout view
# mat <- matrix(nrow = 4, data = c(1,3,5,NA,8,10,12,7,2,4,6,14,9,11,13,NA))
mat <- matrix(nrow = 4, data = c(1,3,5,7,8,10,12,14,2,4,6,15,9,11,13,NA))
# Figure
p <- c(p2,p1,p3)
png('./figures/intraSimilarity.png', width = 2000, height = 2000, res = 200, pointsize = 7)
grid.arrange(grobs = p,
             layout_matrix = mat,
             top = textGrob('Intra-cluster similarity', gp=gpar(fontsize=20,fontface='bold')),
             padding = unit(2.5, "line"))
dev.off()
