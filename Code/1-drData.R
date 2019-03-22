# This script is simply to load a version of the drivers data that will not
# change through time, as will be the case with the data accessed through the
# package. This will ensure that all the analyses and figures can be replicated.
library(slmeta)
data(drivers)
save(drivers, file = './data/drivers.RData')

data(driversRaw)
save(driversRaw, file = './data/driversRaw.RData')
