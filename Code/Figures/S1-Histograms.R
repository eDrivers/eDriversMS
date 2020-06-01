# source('./Code/Figures/S1-Histograms.R')
# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./Code/0-Param.R')
load('./Data/DriversRaw.RData')
drRaw <- driversRaw[, -1]

# ~~~~~~~~~~~~~~~~~~~ HISTOGRAMS ~~~~~~~~~~~~~~~~~~~ #
# Value for `par` parameters for figures
parVal <- c(ceiling(nDr / 4), 4)

# Let's take a look with 0 removed from raw data
# This is especially important for the coastal drivers, as including zeros
# would include offshore cells, which vastly outnumber coastal cells and
# to which coastal drivers to not extend
jpeg('./figures/histograms.jpg', width = 1280, height = 1500, res = 200)
par(mfrow = parVal, mar = c(4,4,1,1))
for(i in 1:nDr) {
  id <- drRaw[, i] > 0
  drID <- drNames$accr[drNames$var == colnames(drRaw)[i]]
  hist(drRaw[id, i], prob = T, main = '', xlab = drID, col = focus)
  lines(density(drRaw[id, i], from = 0, to = 1), col = uni, lwd=2)
}
dev.off()
