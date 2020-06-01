# source('./Code/Figures/S2-Drivers.R')
# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./Code/0-Param.R')
load('./Data/DriversRaw.RData')
drRaw <- driversRaw[, -1]

# Value for `par` parameters for figures
parVal <- c(ceiling(nDr / 4), 4)

# ~~~~~~~~~~~~~~~~~~~ FUNCTIONS ~~~~~~~~~~~~~~~~~~~ #
source('./Code/Functions/plotEGSL.R')

# ~~~~~~~~~~~~~~~~~~~ DRIVERS ~~~~~~~~~~~~~~~~~~~ #
jpeg('./figures/drivers.jpeg', width = 1280, height = 1500, res = 200)
par(mfrow = parVal, mar = c(4,4,1,1))
# Drivers
for(i in 1:nDr) {
  drData <- dr[, i]
  drID <- drNames$accr[drNames$var == colnames(dr)[i]]
  id <- drData > 0
  cols <- pal(101)[((drData[id]/max(drData[id]))*100)+1]
  plotEGSL('egslSimple', prj = world, extent = 'egslSimple')
  plot(st_geometry(egslGrid[id, ]), add = T, col = cols, border = cols, lwd = .1)
  text(x = mean(par('usr')[1:2]), y = par('usr')[4]-.5, labels = drID)
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
