# Simple script to select the number of clusters in light of the
# clustering analyses and the validation, and export the simplified data
# Number of clusters
k <- 6

# Load full datasets
load('./data/kmedoid.RData')
load('./data/kmeans.RData')

# Object with only selected clustering results
clMed <- kmedoid[[k-1]]$clustering
clMean <- kMeans[[k-1]]$cluster

# Export simplified dataset
save(k, file = './data/k.RData')
save(clMed, file = './data/clMed.RData')
save(clMean, file = './data/clMean.RData')
