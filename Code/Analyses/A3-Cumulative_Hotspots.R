# Load drivers data
load('./Data/Drivers.RData')

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Quantile
# 80th quantile
# These will be transformed as binary values
# Then sum the drivers
# Then look at distribution
dr <- drivers[,-1]

# Empty matrix to store results
hot <- matrix(ncol = ncol(dr),
              nrow = nrow(dr),
              data = NA,
              dimnames = list(c(), colnames(dr)))

# Evaluate hotspots
for(i in 1:ncol(hot)) {
  # ID = 0
  id0 <- dr[, i] > 0
  # 80th quantile threshold
  th <- quantile(dr[id0, i], .8, na.rm = T)
  # Values over hotspot threshold
  hot[, i] <- dr[, i] > th
}

# Hotspots
cumulHotspot <- rowSums(hot)
cumulHotspot[cumulHotspot == 0] <- NA

# Cumulative hotspots
CH <- data.frame(ID = drivers$ID,
                 CumulativeHotspots = cumulHotspot,
                 stringsAsFactors = F)

# Export
save(CH, file = './Data/CumulativeHotspots.RData')



# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ RASTER CODE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
#
# # Load drivers data
# library(raster)
# load('./Data/Drivers.RData')
#
#
# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # Quantile
# # 80th quantile
# # These will be transformed as binary values
# # Then sum the drivers
# # Then look at distribution
#
# dr <- as.matrix(drivers)
#
# # Empty matrix to store results
# hot <- matrix(ncol = ncol(dr),
#               nrow = nrow(dr),
#               data = NA,
#               dimnames = list(c(), colnames(dr)))
#
# # Evaluate hotspots
# for(i in 1:ncol(hot)) {
#   # ID = 0
#   id0 <- dr[, i] > 0
#   # 80th quantile threshold
#   th <- quantile(dr[id0, i], .8, na.rm = T)
#   # Values over hotspot threshold
#   hot[, i] <- dr[, i] > th
# }
#
# # Cumulative hotspots
# CH <- rowSums(hot, na.rm = T)
# CH[CH == 0] <- NA
#
# # Raster object
# r <- drivers[[1]]
# names(r) <- 'CumulativeHotspots'
# values(r) <- CH
# CH <- r
#
# # Export
# save(CH, file = './Data/CumulativeHotspots.RData')
