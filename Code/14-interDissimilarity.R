# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')


# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./data/k.RData')
load('./data/clMed.RData')


# ~~~~~~~~~~~~~~~~~~~ FUNCTION ~~~~~~~~~~~~~~~~~~~ #
source('./code/bootstrapSimper.R')


# ~~~~~~~~~~~~~~~~~~~ SIMPER ~~~~~~~~~~~~~~~~~~~ #
# Run iterative simper analysis
iter <- 200
prop <- .05
bootSimper <- bootstrapSimper(dr, clMed, iter = iter, prop = prop)

# # This is to run it multiple times simultaneously
# bootSimper <- bootstrapSimper(dr, clMed, iter = 100, prop = prop, accr = '1')
# bootSimper <- bootstrapSimper(dr, clMed, iter = 100, prop = prop, accr = '2')
# load('./data/bootSimper1.RData')
# x1 <- bootSimper
# load('./data/bootSimper2.RData')
# x2 <- bootSimper
# bootSimper <- c(x1,x2)
# id <- which(unlist(lapply(bootSimper, is.null)))
# for(i in rev(id)) bootSimper[[i]] <- NULL
# save(bootSimper, file = './data/bootSimper.RData')


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
  temp <- summary(bootSimper[[i]], ordered = F)
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
save(simperMean, file = './data/simperMean.RData')
