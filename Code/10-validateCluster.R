# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')
k <- 2:10

# ~~~~~~~~~~~~~~~~~~~ Data ~~~~~~~~~~~~~~~~~~~ #
load('./data/aswMedoid.RData')
load('./data/wssMedoid.RData')
load('./data/aswMean2.RData')
load('./data/wssMean.RData')


# ~~~~~~~~~~~~~~~~~~~ Figure ~~~~~~~~~~~~~~~~~~~ #
png('./figures/validation.png', width = 1280, height = 920, res = 200, pointsize = 7)
layout(matrix(1:4, ncol = 2))
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

# k-means
  # Silhouette
  plot(aswMean2 ~ k,
       pch = 20,
       frame = F,
       xlim = c(0,10),
       xlab = '',
       ylab = 'Average Silhouette Width',
       type = 'b',
       cex = 1.5,
       cex.axis = .8)
  mtext(side = 3, 'k-means clustering', font = 2, line = .75)

  # WSS
  plot(x = c(1,k),
       y = wssMean,
       type="b",
       frame = F,
       xlim = c(0,10),
       xlab="Number of Clusters (k)",
       ylab="Total within-clusters sum of squares",
       pch = 20,
       cex = 1.5,
       cex.axis = .8)
dev.off()
