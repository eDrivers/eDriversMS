# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Quantile
# 80th quantile
# These will be transformed as binary values
# Then sum the drivers
# Then look at distribution

# Empty matrix to store results
hot <- matrix(ncol = ncol(dr),
              nrow = nrow(dr),
              data = NA,
              dimnames = list(c(), drNames$var))

# Evaluate hotspots
for(i in 1:nDr) {
  # ID = 0
  id0 <- dr[, i] > 0
  # 80th quantile threshold
  th <- quantile(dr[id0, i], .8)
  # Values over hotspot threshold
  hot[, i] <- dr[, i] > th
}

# Cumulative hotspots
cumulHotspot <- rowSums(hot)
cumulHotspot[cumulHotspot == 0] <- NA
nOver <- max(cumulHotspot, na.rm = T)


# Graph
png('./figures/hotspot.png', width = 1280, height = 920, res = 300, pointsize = 6)
cols <- pal(nOver)[cumulHotspot]
plotEGSL(layers     = c('egslSimple', 'canada','usa'),
         cols       = c('#00000000',off,off),
         borders    = c('#00000000',focus,focus),
         lwds       = c(.75,.75,.75),
         mar        = c(2,2,2,2),
         box        = T,
         axes       = 1:4,
         northArrow = T)
plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)
plot(st_geometry(egslSimple),
     col = 'transparent',
     border = focus,
     lwd = .75,
     add = T)

# Legend
legendEGSL(range = c(1, nOver),
           mainTitle = 'Number of drivers',
           subTitle = expression(80^th~quantile),
           cexMain = .9,
           cexSub = .65,
           n = 6)

# City names
cityEGSL()
dev.off()
