# source('./Code/Figures/S4-ValidateClusters.R')
# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
k <- 2:10

# ~~~~~~~~~~~~~~~~~~~ Data ~~~~~~~~~~~~~~~~~~~ #
load('./Data/Clustering/aswMedoid.RData')
load('./Data/Clustering/wssMedoid.RData')


# ~~~~~~~~~~~~~~~~~~~ Figure ~~~~~~~~~~~~~~~~~~~ #
jpeg('./figures/validation.jpg', width = 920, height = 920, res = 200, pointsize = 7)
layout(matrix(1:2, ncol = 1))
par(mar = c(5,5,2,1))
# k-medoid
  # Silhouette
  plot(aswMedoid ~ k,
       pch = 20,
       ylab = 'Average Silhouette Width',
       type = 'b',
       frame = F,
       xlab = '',
       xlim = c(0,10),
       cex = 1.5,
       cex.axis = .8)
  mtext(side = 3, 'k-medoids clustering', font = 2, line = .75)

  # WSS
  plot(x = c(1,k),
       y = wssMedoid,
       type="b",
       frame = F,
       xlab="Number of Clusters (k)",
       ylab="Total within-clusters sum of squares",
       pch = 20,
       xlim = c(0,10),
       cex = 1.5,
       cex.axis = .8)
dev.off()
