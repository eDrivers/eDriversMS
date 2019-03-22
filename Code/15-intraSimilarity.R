# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')


# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./data/k.RData')
load('./data/clMed.RData')


# ~~~~~~~~~~~~~~~~~~~ FUNCTION ~~~~~~~~~~~~~~~~~~~ #
source('./code/intraSimilarity.R')

# ~~~~~~~~~~~~~~~~~~~ INTRA-CLUSTER SIMILARITY ~~~~~~~~~~~~~~~~~~~ #
# As with the simper analysis, the dataset is mostly too large to use
# regular function in packages available in R. Also, while the software
# PRIMER automatically measures the intra-cluster similarity using the
# Bray-Curtis similarity, `vegan::simper` does not do it.
# I therefore create a custom function that allows me to extract the
# intra-cluster Bray-Curtis similarity and that does it using a bootstrap
# procedure when the cluster has too many observations.
#
sim <- vector('list', k)
for(i in 1:k) {
  cat("   k: ", i, "\r")
  id <- clMed == i
  sim[[i]] <- bootIntraSim(dr[id, ], iter = 50, samp = 1200)
  save(sim, file = './data/intraSimilarity.RData')
}

# Extract species, average and sd
# Summarize in array format
iter <- length(sim[[1]])
varNames <- c('average')
simSummary <- vector('list', k)
for(i in 1:k) simSummary[[i]] <- array(data = 0, dim = c(ncol(dr), 1, iter), dimnames = list(drNames$accr, varNames))

for(i in 1:k) {
  # Check if there are multiple iterations or not.
  # If length(sim[[i]]) == 2 it means that there were no iterations and the whole cluster was parsed through the simper2 function
  # If not, then sim[[i]] should be equal to the number of iterations
  if(length(sim[[i]]) == 2) {
    simSummary[[i]] <- matrix(ncol = 1,
                              data = sim[[i]]$similarityContribution$average,
                              dimnames = list(drNames$accr, 'average'))
  } else {
    for(j in 1:iter) {
      simSummary[[i]][,'average',j] <- sim[[i]][[j]]$similarityContribution$average
    }
  }
}

# Summarize the results over all iterations
similarityMean <- vector('list', k)
for(i in 1:k) similarityMean[[i]] <- apply(X = simSummary[[i]], MARGIN = c(1,2), FUN = mean, na.rm = T)

# Export
save(similarityMean, file = './data/similarityMean.RData')
