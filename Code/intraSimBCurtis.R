# library(slmeta)
# data(drivers, package = 'slmeta')
# dr <- drivers[, !colnames(drivers) %in% c('UVpositive','UVnegative','ID')]
#
# x <- dr[1:500, ]
# system.time(sim <- simper2(x))
#

intraSim <- function(x, samp = NULL, iter = NULL) {
  # ~~~~~~~~~~~~~~~~~~ PARAMETERS & DATA SETUP ~~~~~~~~~~~~~~~~~~
  # Transform data as matrix
  x <- as.matrix(x)

  # Create empty list to store results
    sim <- vector('list', 2)
    names(sim) <- c('totalSimilarity', 'similarityContribution')
    class(sim) <- 'simper2'

  # ~~~~~~~~~~~~~~~~~~ MEASUREMENTS FOR SPECIES CONTRIBUTION ~~~~~~~~~~~~~~~~~~
  # Here is the function that we will be applying for each species i between pairs of observations j, k
    # Numerator: 2 * min(A_{i,j}, A_{i,k})
    # Denominator: sum(j, k)

  # Denominator: The species contribution will be divided by the sum of all abundances in all pairs of observations
    # Sum of rows of community matrix
    xs <- rowSums(x)

    # Sum of all pairs of observations
    denom <- combn(xs, m = 2, FUN = sum)

  # Numerator: 2 * min(id1, id2)
    # Minimum
    sp <- apply(x, 2, function(x) combn(x, m = 2, FUN = min))

    # Minimum value * 2
    sp <- 2 * sp

    # Divide by denominator
    sp <- apply(sp, 2, function(x) x/denom)

  # ~~~~~~~~~~~~~~~~~~ TOTAL CONTRIBUTION ~~~~~~~~~~~~~~~~~~
  # Now from the sp matrix, we can obtain the intra-cluster average similarity
  # by taking the mean of row sums
    # Sum of individual species contributions
    simTot <- rowSums(sp)

    # Average and standard deviation result for intra-cluster similarity
    sim$totalSimilarity <- c(mean(simTot), sd(simTot))
    names(sim$totalSimilarity) <- c('Mean','SD')

  # ~~~~~~~~~~~~~~~~~~ SPECIES CONTRIBUTION ~~~~~~~~~~~~~~~~~~
  # Data frame with summary results
  sim$similarityContribution <- data.frame(species = colnames(x),
                                           stringsAsFactors = F)

  # Average species similarity contribution
  sim$similarityContribution$average <- colMeans(sp)

  # Standard deviation of species similarity contribution
  sim$similarityContribution$sd <- apply(sp, 2, sd)

  # Proportion of species similarity contribution
  sim$similarityContribution$proportion <- sim$similarityContribution$average / sim$totalSimilarity[1]

  # ~~~~~~~~~~~~~~~~~~ RESULTS ~~~~~~~~~~~~~~~~~~
  sim
}

bootIntraSim <- function(x, iter = 250, samp = 4000, boot = 4000) {
  # If the dataset is too large, the analysis will be done through a bootstrap
  # List to store simper results for post-processing
  # Determine if the bootstrap procedure is necessary
  # I evaluated the minimum number of observations necessary to initiate the bootstrap
  # procedure to be 4000. That was chosen by running the analyses and opting for
  # a number of observations that I deemed could run fast enough.
  # It is however still a subjective choice and can definitely be changed.
  if(nrow(x) > boot) {
    sim <- vector('list', iter)

    # Repeat the process for the desired number of iterations
    for(i in 1:iter) {
      cat("   i: ", i, ' of ', iter, "\r")
      # Subsampled observation id
      id <- sample(1:nrow(x), size = samp)
      # Similarity analysis
      sim[[i]] <- intraSim(x[id, ])
    }
  } else {
    sim <- intraSim(x)
  }
  sim
}
