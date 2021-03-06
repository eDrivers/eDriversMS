# ~~~~~~~~~~~~~~~~~~~ PARAM ~~~~~~~~~~~~~~~~~~~ #
source('./Code/0-Param.R')

# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./Data/Clustering/k.RData')
load('./Data/Clustering/Clusters.RData')

# ~~~~~~~~~~~~~~~~~~~ FUNCTION ~~~~~~~~~~~~~~~~~~~ #
source('./Code/Functions/bootstrapSimper.R')
source('./Code/Functions/simperMan.R')


# ~~~~~~~~~~~~~~~~~~~ SIMPER ~~~~~~~~~~~~~~~~~~~ #
# Run iterative simper analysis
iter <- 300
prop <- .05
system.time(bootSimper <- bootstrapSimper(dr, clMed, iter = iter, prop = prop))
save(bootSimper, file = './Data/Clustering/bootSimper.RData')

# # # This is to run it multiple times simultaneously
# # bootSimper <- bootstrapSimper(dr, clMed, iter = 100, prop = prop, accr = '1')
# # bootSimper <- bootstrapSimper(dr, clMed, iter = 100, prop = prop, accr = '2')
# # bootSimper <- bootstrapSimper(dr, clMed, iter = 100, prop = prop, accr = '3')
# load('./data/bootSimper1.RData')
# x1 <- bootSimper
# load('./data/bootSimper2.RData')
# x2 <- bootSimper
# load('./data/bootSimper3.RData')
# x3 <- bootSimper
# bootSimper <- c(x1,x2,x3)
# save(bootSimper, file = './Data/Clustering/bootSimper.RData')


# ~~~~~~~~~~~~~~~~~~~ SIMPER SUMMARY ~~~~~~~~~~~~~~~~~~~ #
# Summarize in array format
iter <- length(bootSimper) # To delete
nList <- length(bootSimper[[1]])

# Name of variables to extract from simper analyses
varNames <- c('contr','sd','ava','avb')

# Empty list to store summaries
simperSummary <- vector('list', nList)
names(simperSummary) <- names(bootSimper[[1]])

# Empty arrays to store inter-cluster dissimilarity results
for(i in 1:nList) {
  simperSummary[[i]] <- array(data = 0,
                              dim = c(ncol(dr), length(varNames), iter),
                              dimnames = list(drNames$accr, varNames))
}

# Extract summary for simper analyses interations
for(i in 1:iter) {
  temp <- bootSimper[[i]]
  for(j in 1:nList) {
    simperSummary[[j]][,,i] <- as.matrix(temp[[j]][, varNames])
  }
}

# Summarize the results over all iterations
simperMean <- vector('list', nList)
names(simperMean) <- names(simperSummary)
for(i in 1:nList) {
  simperMean[[i]] <- apply(X = simperSummary[[i]],
                           MARGIN = c(1,2),
                           FUN = mean,
                           na.rm = T)
}

# Export
save(simperMean, file = './Data/Clustering/simperMean.RData')
