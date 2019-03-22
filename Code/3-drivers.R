# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')
load('./data/driversRaw.RData')
drRaw <- driversRaw[, -1]

# ~~~~~~~~~~~~~~~~~~~ HISTOGRAMS ~~~~~~~~~~~~~~~~~~~ #
# Value for `par` parameters for figures
parVal <- c(ceiling(nDr / 4), 4)

# Let's take a look with 0 removed from raw data
# This is especially important for the coastal drivers, as including zeros
# would include offshore cells, which vastly outnumber coastal cells and
# to which coastal drivers to not extend
png('./figures/drHist.png', width = 1280, height = 1500, res = 200)
par(mfrow = parVal, mar = c(4,4,1,1))
for(i in 1:nDr) {
  id <- drRaw[, i] > 0
  drID <- drNames$accr[drNames$var == colnames(drRaw)[i]]
  hist(drRaw[id, i], prob = T, main = '', xlab = drID, col = focus)
  lines(density(drRaw[id, i], from = 0, to = 1), col = uni, lwd=2)
}
dev.off()


# ~~~~~~~~~~~~~~~~~~~ DRIVERS ~~~~~~~~~~~~~~~~~~~ #
png('./figures/drivers.png', width = 1280, height = 1500, res = 200)
par(mfrow = parVal, mar = c(4,4,1,1))
# Drivers
for(i in 1:nDr) {
  drData <- dr[, i]
  drID <- drNames$accr[drNames$var == colnames(dr)[i]]
  id <- drData > 0
  cols <- pal(101)[((drData[id]/max(drData[id]))*100)+1]
  plotEGSL('egslSimple')
  plot(st_geometry(egslGrid[id, ]), add = T, col = cols, border = cols, lwd = .1)
  text(x = mean(par('usr')[1:2]), y = par('usr')[4] - 70000, labels = drID)
}

# Scale
colRamp <- pal(100)
scale = (length(colRamp) - 1)/(1 - 0)
ticks <- seq(0, 1, len = 11)
par(mar = c(.75,0,.75,11))
plot(c(0, 10), c(0, 1), type = "n", bty = "n", xaxt = "n",
    xlab = "", yaxt = "n", ylab = "")
axis(4, ticks, las = 1)
for (i in 1:(length(colRamp) - 1)) {
    y = (i - 1)/scale + 0
    rect(0, y, 10, y + 1/scale, col = colRamp[i], border = NA)
}
rect(xleft = 0, ybottom = 0, xright = 10, ytop = 1, lwd = 0.5)
mtext('Relative\nintensity', 4, line = 4, cex = .8, adj = c(.5,.5))
dev.off()
