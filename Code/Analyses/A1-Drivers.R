# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #
# The initial version of these analyses and the paper were done with vectorized
# data in `sf` format. The package has since transitioned to provide rasterized
# data layers for their size and efficiency. Here, we provide the original code
# using `sf` objects and the original vectorized data are provided in the `data`
# folder as:
# - './Data/Drivers.RData'
# - './Data/DriversRaw.RData'
#
# We nonetheless provide the code, as comments, to load and transform the
# rasterized data layers from the `eDrivers` package as a starting point.
# We provide, also as comments, the code to reproduce the analyses with the
# rasterized objects. However, the results and figures presented were obtained
# with the vectorized objects.
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #

# Load raw data
load('./Data/DriversRaw.RData')
drivers <- driversRaw

# Log-transform drivers that should be transformed
# Name of drivers to transform
drNames <- colnames(drivers)
drTrans <- c('coastDev','dirHumImpact','fisheriesDD',
             'fisheriesDNH','fisheriesDNL','fisheriesPHB','fisheriesPLB',
             'Hypoxia','inorgPol','invasives','nutrientInput',
             'orgPol','negSBT','posSBT','shipping')

# Log transform
id <- which(colnames(drivers) %in% drTrans)
for(i in id) drivers[,i] <- log(drivers[,i] + 1)

# Scale drivers between 0 and 1 using the 99th quantile
# Function
quantNorm <- function(x) {
  id <- x != 0
  x <- x / quantile(x[id], probs = .99, na.rm = T)
  x[x > 1] <- 1
  x[x < 0] <- 0
  x
}

# Scaling
for(i in 2:ncol(drivers)) drivers[, i] <- quantNorm(drivers[, i])

# Export
save(drivers, file = './Data/Drivers.RData')


# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ RASTER CODE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #

# # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# # Load data from eDrivers package
# # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# # Get drivers list from eDrivers package
# library(eDrivers)
# drList <- fetchList()
#
# # Fetch drivers data
# drivers <- fetchDrivers(drivers = drList$Key,
#                         output = './Data/Drivers/',
#                         import = T, brick = T)
#
# # Export stack of raw drivers data
# driversRaw <- drivers[[1]]
# save(driversRaw, file = './Data/DriversRaw.RData')
# # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# # Transform data
# # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# # Log-transform drivers that should be transformed
# # Name of drivers to transform
# drNames <- names(drivers[[1]])
# drTrans <- c('CoastalDevelopment','DirectHumanImpact','FisheriesDD',
#              'FisheriesDNH','FisheriesDNL','FisheriesPHB','FisheriesPLB',
#              'Hypoxia','InorganicPollution','InvasiveSpecies','NutrientInput',
#              'OrganicPollution','NegativeSBT','PositiveSBT','Shipping')
#
#
# # Log transform
# id <- which(names(drivers[[1]]) %in% drTrans)
# for(i in id) drivers[[1]][[i]] <- log(drivers[[1]][[i]] + 1)
#
# # Scale drivers between 0 and 1 using the 99th quantile
# # Function
# quantNorm <- function(x) {
#   id <- x != 0
#   x <- x / quantile(x[id], probs = .99, na.rm = T)
#   x[x > 1] <- 1
#   x[x < 0] <- 0
#   x
# }
#
# # Scaling
# for(i in 1:nlayers(drivers[[1]])) drivers[[1]][[i]] <- quantNorm(drivers[[1]][[i]])
#
# # Driver names
# names(drivers[[1]]) <- drNames
#
# # Replace NAs with 0 where the value should be 0
# driversMatrix <- as.matrix(drivers[[1]])
#
# # Identify only cells with values
# uid <- apply(driversMatrix, 1, function(x) !all(is.na(x)))
# dr <- driversMatrix[uid, ]
#
# # Replace NA with 0
# dr[is.na(dr)] <- 0
#
# # Replace in data matrix
# driversMatrix[uid, ] <- dr
#
# # Change raster values
# values(drivers[[1]]) <- driversMatrix
#
# # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# # Export transformed drivers data
# # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# # Keep only raster stack
# drivers <- drivers[[1]]
#
# # Export
# save(drivers, file = './Data/Drivers.RData')
