# source('./Code/Figures/S3-Marimekko.R')
# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/0-Param.R')
library(graphicsutils)


# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
Fd <- rowSums(dr)

# Create vector of bins
nBins <- 512 # Just because
binData <- seq(0,max(Fd), length.out = 513)
bins <- data.frame(lower = binData[1:512],
                   upper = binData[2:513])
bins$mid <- (bins$upper + bins$lower) / 2

# Sum of fd values within each bin
bins$fdTot <- numeric(nBins)
for(i in 1:nBins) {
  id <- Fd > bins$lower[i] & Fd <= bins$upper[i]
  bins$fdTot[i] <- sum(Fd[id])
}

# Fd values associated with each driver
binDr <- matrix(nrow = nrow(bins),
                ncol = ncol(dr),
                data = 0,
                dimnames = list(c(), colnames(dr)))

for(j in 1:ncol(binDr)) {
  for(i in 1:nBins) {
    id <- Fd > bins$lower[i] & Fd <= bins$upper[i]
    binDr[i, j] <- sum(dr[id, j])
  }
}

# Transform into a marimekko graph
# Begin by transforming the data into proportions of total Fd
binDrProp <- binDr / bins$fdTot

# Sort drivers by group
sortNames <- as.factor(drNames$group) %>%
             order() %>%
             drNames[., ]
sortNames$group <- as.factor(sortNames$group)

# Add colors
trans <- c('FF','DD','BB','99','77','55','33','11')
sortNames$col <- gg_color_hue(nGroup)[as.numeric(sortNames$group)]
for(i in levels(sortNames$group)) {
  id <- which(sortNames$group == i)
  nId <- length(id)
  for(j in 1:nId) {
    sortNames$col[id[j]] <- paste0(substr(sortNames$col[id[j]],1,7), trans[j])
  }
}

# Sort by group
binDrProp <- binDrProp[, sortNames$var]

# # Sort drivers according to extent
# extent <- colSums(dr)
# extent <- sort(extent, T)
# sortNames <- names(extent)
# binDrProp <- binDrProp[, sortNames]

# Identify which is NaN
# Transform NaN to 0
id <- is.na(binDrProp[, 1])

# Cumulative sum of rows to get driver coordinates
# will be the y values for the plot
bin <- apply(binDrProp, 1, cumsum)

# x values
x <- bins$mid

# Remove NaNs
bin <- bin[, !id]
x <- x[!id]

# Add row filled with 0 to build first polygon
bin <- rbind(numeric(length(x)), bin)

# ~~~~~~~~~~~~~~~~~~~ LAYOUT ~~~~~~~~~~~~~~~~~~~ #
jpeg('./figures/marimekko.jpg', width = 1800, height = 800, res = 200, pointsize = 8)
mat <- matrix(ncol = 20, nrow = 10, data = 1)
mat[, 10:17] <- 2
mat[, 18:20] <- 3
layout(mat)
# layout.show(3)


# ~~~~~~~~~~~~~~~~~~~ HISTOGRAM ~~~~~~~~~~~~~~~~~~~ #
# Fd histogram
par(mar = c(4,4,3,0))
hist(Fd,
     prob = T,
     col = focus,
     nclass = 250,
     border = '#00000033',
     cex = 1,
     main = '',
     ylab = '',
     xlab = '',
     axes = F)

axis(1, cex.axis = .75)
axis(2, cex.axis = .75)

mtext(text = 'Cumulative exposure', side = 1, line = 2.25, cex = .8)
mtext(text = 'Frequency', side = 2, line = 2.25, cex = .8)
mtext(text = 'Cumulative exposure frequency distribution', side = 3, line = 0, font = 2)


# ~~~~~~~~~~~~~~~~~~~ MARIMEKKO ~~~~~~~~~~~~~~~~~~~ #
par(mar = c(4,4,3,0))
plot0(xlim = c(floor(min(Fd))+1, ceiling(max(Fd))), ylim = c(0, 1))
axis(1, cex.axis = .75)
axis(2, cex.axis = .75)
mtext(text = 'Cumulative exposure', side = 1, line = 2.25, cex = .8)
mtext(text = 'Relative contribution', side = 2, line = 2.25, cex = .8)
mtext(text = 'Percent contribution', side = 3, line = 0, font = 2)
# Polygons
for(i in 1:(nrow(bin)-1)) {
  y1 <- bin[i, ]
  y2 <- bin[i+1, ]
  polygon(x = c(x, rev(x), x[1]),
          y = c(y1, rev(y2), y1[1]),
          col = sortNames$col[i],
          border = 'transparent')
}

# Legend
# Param
y <- seq(.1,.9, length.out = (ncol(dr)+1))
y <- data.frame(y1 = y[1:ncol(dr)],
                y2 = y[2:(ncol(dr)+1)])
x1 <- 0
x2 <- .2
y$mid <- (y$y1+y$y2)/2
ygap <- .005

# Plot
par(mar = c(4,0,1,0))
plot0(xlim = 0:1, ylim = 0:1)

# Polygons
for(i in 1:ncol(dr)) {
  y1 <- y$y1[i]+ygap
  y2 <- y$y2[i]-ygap
  polygon(x = c(x1, x2, x2, x1, x1),
          y = c(y1, y1, y2, y2, y1),
          col = sortNames$col[i],
          border = '#000000')
}

# Text
text(x = rep(.25, ncol(dr)), y = y$mid, labels = sortNames$accr, adj = c(0,.5))

# Groups
for(i in levels(sortNames$group)) {
  id <- sortNames$group == i
  Y <- sum(range(y$mid[id])) / 2
  text(x = .55, y = Y, labels = grNames$name[grNames$accr == i], adj = c(0,.5), font = 2)

}
dev.off()
