# Load drivers data
load('./Data/Drivers.RData')

# Cumulative exposure
CE <- data.frame(ID = drivers$ID,
                 CumulativeExposure = rowSums(drivers[, -1]),
                 stringsAsFactors = F)

# Export
save(CE, file = './Data/CumulativeExposure.RData')




# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ RASTER CODE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #

# # Load drivers data
# library(raster)
# load('./Data/Drivers.RData')
#
# # Cumulative exposure
# CE <- sum(drivers, na.rm = T)
# names(CE) <- 'CumulativeExposure'
#
# # Export
# save(CE, file = './Data/CumulativeExposure.RData')
