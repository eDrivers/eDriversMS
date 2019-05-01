# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')


# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./data/k.RData')
load('./data/clMed.RData')
nCl <- length(unique(clMed))
load('./data/simperMean.RData')
source('./code/barPlot.R')


# Driver intensity in compared clusters
drInt1 <- lapply(simperMean, function(x) x[,'ava']) %>%
          as.data.frame()
drInt2 <- lapply(simperMean, function(x) x[,'avb']) %>%
          as.data.frame()

dat <- vector('list', nCl)
dat[[1]] = data.frame(x = drInt1$X1_2)
dat[[2]] = data.frame(x = drInt1$X2_3)
dat[[3]] = data.frame(x = drInt1$X3_4)
dat[[4]] = data.frame(x = drInt1$X4_5)
dat[[5]] = data.frame(x = drInt1$X5_6)
dat[[6]] = data.frame(x = drInt2$X5_6)


# ~~~~~~~~~~~~~~~~~~~ CLUSTER ~~~~~~~~~~~~~~~~~~~ #
png('./figures/cluster.png', width = 1280, height = 1280, res = 300, pointsize = 6)
# jpeg('./figures/cluster.jpg', width = 1280, height = 1280, res = 300, pointsize = 6)
mat <- matrix(c(1,1,1,1,1,1,2,3,4,5,6,7), nrow = 2, byrow = T)
layout(mat, heights = c(1, .4))
cols <- pal(nCl)[clMed]
plotEGSL(layers     = c('egslSimple', 'canada','usa'),
         cols       = c('#00000000',off,off),
         borders    = c('#00000000',focus,focus),
         lwds       = c(.75,.75,.75),
         mar        = c(2,2,2,2),
         box        = T,
         axes       = 1:4,
         northArrow = F,
         prj        = slmetaPrj('world'),
         extent     = extFig)
plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)

# Legend
cols <- pal(nCl)
x <- par('usr')[1:2]
y <- par('usr')[3:4]
xR <- diff(x)
yR <- diff(y)
yH <- .022*yR
xW <- .034*xR
gap <- .034*xR
gap2 <- .045*yR
text(x = x[1]+gap, y = y[2]-gap, 'Threat complexes', adj = c(0,.5), font = 2)
# Polygons
for(i in 1:k) {
  xmn <- x[1]+gap+.014*xR
  xmx <- x[1]+gap+.014*xR+xW
  ymn <- y[2]-gap-i*gap2-yH/2
  ymx <- y[2]-gap-i*gap2+yH/2
  polygon(x = c(xmn, xmx, xmx, xmn), y = c(ymn,ymn,ymx,ymx), col = cols[i], lwd = .5)
  text(x = xmx+.007*xR, y = mean(c(ymn,ymx)), labels = paste('Threat complex', i), cex = .6, adj = c(0, .5))
}

# Add citie
cityEGSL(prj = 4326)

# barplots
for(i in 1:6) {
  barPlot(dat[[i]])
  mtext(paste0('Threat complex ', i), font = 2, cex = .75)
  mtext('Mean intensity', side = 1, cex = .5, at = .5, adj = c(.5,.5), line = 1)
}
dev.off()
