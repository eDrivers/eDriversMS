# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')

# -----
# Figure
png('./figures/kernel.png', width = 1920, height = 1280, res = 300, pointsize = 6)
# jpeg('./figures/footprint.jpg', width = 1920, height = 1280, res = 300, pointsize = 6)


# Layout
mat <- matrix(0, 28, 32)
mat[1:12, 1:16] <- 1 # traffic
mat[15:26, 1:16] <- 2 # demersal
mat[1:12, 17:32] <- 3 # traffic + demersal
mat[18:28, 17:29] <- 4 # kernel
mat[15:17, 17:29] <- 5 # dens traffic (x)
mat[18:28, 30:32] <- 6 # dens demersal (y)
mat[13:14, 6:11] <- 7 # scale traffic
mat[27:28, 6:11] <- 8 # scale demersal
mat[13:14, 22:27] <- 9 # scale combine
mat[1:2, 15:16] <- 10 # panel A
mat[15:16, 15:16] <- 11 # panel B
mat[1:2, 31:32] <- 12 # panel C
mat[15:16, 31:32] <- 13 # panel D
layout(mat)
# layout.show(13)

# Plot 1 - Hypoxia
  cols <- rbPal(101)[(drivers$Hypoxia * 100)+1]
  plotEGSL(layers = 'egslSimple', borders = '#C7CBCE66', prj = slmetaPrj('world'), extent = 'egslSimple')
  plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)
  plot(st_geometry(egslSimple), border = '#00000077', lwd = 0.25, add = T)

# Plot 2 - Demersal destructive
  cols <- rbPal(101)[(drivers$fisheriesDD * 100)+1]
  plotEGSL(layers = 'egslSimple', borders = '#C7CBCE66', prj = slmetaPrj('world'), extent = 'egslSimple')
  plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)
  plot(st_geometry(egslSimple), border = '#00000077', lwd = 0.25, add = T)

# Plot 3 - Added layers - hypoxia + demersal destructive
   drivers$combine <- drivers$Hypoxia + drivers$fisheriesDD
   drivers$combine <- drivers$combine / max(drivers$combine)# Normalize it x / max(x))
   cols <- rbPal(101)[(drivers$combine * 100)+1]
   plotEGSL(layers = 'egslSimple', borders = '#C7CBCE66', prj = slmetaPrj('world'), extent = 'egslSimple')
   plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)
   plot(st_geometry(egslSimple), border = '#00000077', lwd = 0.25, add = T)

# Plot 4 - 2D kernel density estimate
  # Select values that have a minimum relative intensity > .05 for both
  drivers$Hypoxia[drivers$Hypoxia < .05] <- 0
  drivers$fisheriesDD[drivers$fisheriesDD < .05] <- 0
  # Select only values that are not == 0
  notEmpty <- drivers$fisheriesDD != 0 & drivers$Hypoxia != 0

  # 2D kernel estimation
  f1 <- kde2d(x = drivers$Hypoxia[notEmpty],
              y = drivers$fisheriesDD[notEmpty],
              n = 500, # put 500 for final figure
              lims = c(0, 1, 0, 1))

    # plot
    par(mar = c(4,4,0,0))
    plot0(c(0,1))
    image(f1,
          zlim = c(0,max(f1$z)),
          col = c('#ffffff', pal(99)), # rbPal(100), # Change here to put 0 to white : c('#ffffff', rbPal(99))
          add = T)
    # polygon(x = c(-0.005,-0.005,1.005,1.005), y = c(-0.005,1.005,1.005,0.005), border = '#00000055')
    axis(1, seq(0,1,0.1), line = -.25, lwd = 0.5)
    axis(2, seq(0,1,0.1), las = 2, line = -0.5, lwd = 0.5)
    # axis(3, seq(0,1,0.1), line = -.25, lwd = 0.5)
    # axis(4, seq(0,1,0.1), las = 2, line = -0.5, lwd = 0.5)
    mtext('Hypoxia', 1, line = 2.5, font = 1, cex = 0.8)
    mtext('Demersal destructive fisheries', 2, line = 2.5, font = 1, cex = 0.8)

# Plot 5 - Density hypoxia
  dens <- density(drivers$Hypoxia[notEmpty], from = 0, to = 1)
  par(mar = c(0,4,0,0))
  plot0(c(0,1), c(0,ceiling(max(dens$y))))
  polygon(x = c(dens$x, dens$x[length(dens$x)], 0), y = c(dens$y,0,0), col = slmetaPal('platform')[5], border = slmetaPal('platform')[5], lwd=1)
  axis(2, c(0,ceiling(max(dens$y))), lwd = 0.5, line = -0.5, las = 2)
  mtext('Density', 2, line = 2.5, font = 1, cex = 0.8)

# Plot 6 - Density demersal destructive
  par(mar = c(4,0,0,0))
  dens <- density(drivers$fisheriesDD[notEmpty], from = 0, to = 1)
  plot0(c(0,ceiling(max(dens$y))), c(0,1))
  polygon(x = c(dens$y, 0, 0), y = c(dens$x,dens$x[length(dens$x)],0), col = slmetaPal('platform')[5], border = slmetaPal('platform')[5], lwd=1)
  axis(1, c(0,ceiling(max(dens$y))), line = -.25, lwd = 0.5)
  mtext('Density', 1, line = 2.5, font = 1, cex = 0.8)

# plot 7 - scale marine traffic
  par(mar = c(3,0,0,0))
  colorBar(rbPal(100),
           nticks = 6,
           min = 0,
           max = 1,
           lwd = 0.5)
  rect(xleft = 0, ybottom = 0, xright = 1, ytop = 1, lwd = 0.5)
  mtext('Hypoxia', 3, line = 0.5, font = 2, cex = 0.8)

# plot 8 - scale demersal destructive
  par(mar = c(3,0,0,0))
  colorBar(rbPal(100),
           nticks = 6,
           min = 0,
           max = 1,
           lwd = 0.5)
  rect(xleft = 0, ybottom = 0, xright = 1, ytop = 1, lwd = 0.5)
  mtext('Demersal destructive fisheries', 3, line = 0.5, font = 2, cex = 0.8)


# plot 9 - scale combine
  par(mar = c(3,0,0,0))
  colorBar(rbPal(100),
           nticks = 6,
           min = 0,
           max = 2,
           lwd = 0.5)
  rect(xleft = 0, ybottom = 0, xright = 2, ytop = 1, lwd = 0.5)
  mtext(expression(bold(sum('Hypoxia, Demersal destructive fisheries'))), 3, line = 0.5, font = 2, cex = 0.8)

# plot 10 - panel A
par(mar = c(0,0,0,0))
plot0(c(0,1))
text(x = 0.5, y = 0.5, labels = 'A', font = 2, cex = 1.35)

# plot 11 - panel A
par(mar = c(0,0,0,0))
plot0(c(0,1))
text(x = 0.5, y = 0.5, labels = 'B', font = 2, cex = 1.35)

# plot 12 - panel A
par(mar = c(0,0,0,0))
plot0(c(0,1))
text(x = 0.5, y = 0.5, labels = 'C', font = 2, cex = 1.35)

# plot 13 - panel A
par(mar = c(0,0,0,0))
plot0(c(0,1))
text(x = 0.5, y = 0.5, labels = 'D', font = 2, cex = 1.35)

dev.off()
