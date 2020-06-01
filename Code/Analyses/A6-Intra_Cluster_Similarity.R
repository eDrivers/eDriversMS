# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./Code/0-Param.R')


# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./Data/Clustering/k.RData')
load('./Data/Clustering/Clusters.RData')


# ~~~~~~~~~~~~~~~~~~~ FUNCTION ~~~~~~~~~~~~~~~~~~~ #
source('./Code/Functions/intraSimManhattan.R')


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
  sim[[i]] <- bootIntraSim(dr[id, ], iter = 50, samp = .25)
  save(sim, file = './Data/Clustering/intraSimilarity.RData')
}

# Extract species, contribution and sd
# Summarize in array format
iter <- length(sim[[4]])
varNames <- c('contr')
simSummary <- vector('list', k)
for(i in 1:k) simSummary[[i]] <- array(data = 0, dim = c(ncol(dr), 1, iter), dimnames = list(drNames$accr, varNames))

for(i in 1:k) {
  # Check if there are multiple iterations or not.
  # If length(sim[[i]]) == 2 it means that there were no iterations and the whole cluster was parsed through the simper2 function
  # If not, then sim[[i]] should be equal to the number of iterations
  if(i %in% c(1,2,3)) {
    simSummary[[i]] <- matrix(ncol = 1,
                              data = sim[[i]]$contr,
                              dimnames = list(drNames$accr, 'contr'))
  } else {
    for(j in 1:iter) {
      simSummary[[i]][,'contr',j] <- sim[[i]][[j]]$contr
    }
  }
}

# Summarize the results over all iterations
similarityMean <- vector('list', k)
for(i in 1:k) similarityMean[[i]] <- apply(X = simSummary[[i]], MARGIN = c(1,2), FUN = mean, na.rm = T)

# Export
save(similarityMean, file = './Data/Clustering/similarityMean.RData')
