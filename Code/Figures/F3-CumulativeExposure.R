# source('./Code/Figures/F3-CumulativeExposure.R')
# ~~~~~~~~~~~~~~~~~~~ LIBRARIES ~~~~~~~~~~~~~~~~~~~ #
# Libraries
library(raster)
library(sf)

# ~~~~~~~~~~~~~~~~~~~ Default parameters ~~~~~~~~~~~~~~~~~~~ #
source('./Code/0-Param.R')

# ~~~~~~~~~~~~~~~~~~~ FUNCTIONS ~~~~~~~~~~~~~~~~~~~ #
source('./Code/Functions/plotEGSL.R')
source('./Code/Functions/legendEGSL.R')
source('./Code/Functions/colorBar.R')
source('./Code/Functions/cityEGSL.R')

# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./Data/Spatial/Canada.RData') # Canada
load('./Data/Spatial/US.RData') # US
load('./Data/Spatial/egslGrid.RData') # Vectorized grid
load('./Data/Spatial/egslSimple.RData') # Simple EGSL geometry
load('./Data/CumulativeExposure.RData')

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# Cumulative exposure figure
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
jpeg('./figures/CumulativeExposure.jpg', width = 1280, height = 920, res = 300, pointsize = 6)

# Main plot output
par(bg = '#ffffff')
plotEGSL(layers     = c('egslSimple', 'canada','usa'),
         cols       = c('#00000000',off,off),
         borders    = c('#00000000',focus,focus),
         lwds       = c(.75,.75,.75),
         mar        = c(2,2,2,2),
         box        = T,
         axes       = 1:4,
         northArrow = F,
         prj        = world,
         extent     = extFig)

# Cumulative exposure
cols <- pal(101)[((CE$CumulativeExposure/max(CE$CumulativeExposure, na.rm = T))*100)+1]
plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)

# Plot EGSL outline again
plot(st_geometry(egslSimple), col = 'transparent', border = focus, lwd = .75, add = T)

# Add box
box2("1234", lwd = 3)

# Add legend
legendEGSL(range = range(CE$CumulativeExposure),
           pal = pal,
           mainTitle = 'Cumulative exposure',
           subTitle = '',
           cexMain = .9,
           cexSub = .65,
           n = 6)

# City names
cityEGSL(prj = 4326)

dev.off()
