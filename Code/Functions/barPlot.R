barPlot <- function(x2) {
  # Gap
  gap <- .25
  yG <- .15

  # Combine with drNames
  # This makes the function unusable for another setting, but simply removing it would make it ok
  x2$names = drNames$accr
  x2$group = as.factor(drNames$group)

  # Format data
  x2$x <- x2$x + gap
  x2 <- x2[order(x2$group), ]
  x2$col <- as.numeric(x2$group)
  x2 <- x2[nrow(x2):1, ]

  # Colors
  cols <- gg_color_hue(nGroup)
  x2$col <- cols[x2$col]

  # Plot
  library(graphicsutils)
  par(mar = c(4,0,2,0))
  plot0(xlim = c(-.125, 1.25), ylim = c(0,length(x2$x)+1))
  # axis(1, at = seq(-gap, -1-gap, by = -.25), labels = c('0','.25','.5','.75','1'), lwd = 1, font = 2, cex.axis = .7, tck = -.005, mgp = c(1, 0, 0))
  axis(1, at = seq(gap, 1+gap, by = .25), labels = c('0','.25','.5','.75','1'), lwd = 1, font = 2, cex.axis = .7, tck = -.005, mgp = c(1, 0, 0))
  # axis(1, at = seq(-gap, gap, by = 2*gap), labels = c('',''), lwd = 1, tck = -.005)
  text(x = rep(0, length(x2$x)), y = 1:(length(x2$x)), labels = x2$names, cex = .7)
  for(i in c(seq(-gap, -1-gap, by = -gap), seq(gap, 1+gap, by = gap))) {
    lines(x = c(i,i), y = c(.5,length(x2$x)+1.5), lty = 'dotted', col = '#00000066')
  }
  # Add bar plot
  for(i in 1:22) {
    rect(xleft = x2$x[i], ybottom = i-yG, xright = gap, ytop = i+yG, col = x2$col[i], border = x2$col[i])
  }
}
