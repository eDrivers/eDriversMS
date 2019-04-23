# This script is simply to load a version of the drivers and spatial objects data that will not
# change through time, as will be the case with the data accessed through the
# package. This will ensure that all the analyses and figures can be replicated.
# Also, I transform the spatial objects to decimal degrees for the figures, as requested by co-authors
library(slmeta)
data(drivers, package = 'slmeta')
save(drivers, file = './data/drivers.RData')

data(driversRaw)
save(driversRaw, file = './data/driversRaw.RData')

data(egslGrid, package = 'slmeta')
egslGrid <- st_transform(egslGrid, crs = 4326)
save(egslGrid, file = './data/egslGrid.RData')

data(egslSimple, package = 'slmeta')
egslSimple <- st_transform(egslSimple, crs = 4326)
save(egslSimple, file = './data/egslSimple.RData')
