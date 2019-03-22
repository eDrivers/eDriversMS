# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')


# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./data/k.RData')
load('./data/clMed.RData')
nCl <- length(unique(clMed))


# ~~~~~~~~~~~~~~~~~~~ CLUSTER ~~~~~~~~~~~~~~~~~~~ #
png('./figures/cluster.png', width = 1280, height = 920, res = 300, pointsize = 6)
cols <- pal(nCl)[clMed]
plotEGSL(layers     = c('egslSimple', 'canada','usa'),
         cols       = c('#00000000',off,off),
         borders    = c('#00000000',focus,focus),
         lwds       = c(.75,.75,.75),
         mar        = c(2,2,2,2),
         box        = T,
         axes       = 1:4,
         northArrow = T)
plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)
plot(st_geometry(egslSimple),
     col = 'transparent',
     border = focus,
     lwd = .75,
     add = T)

# Legend
cols <- pal(nCl)
x <- par('usr')[1:2]
y <- par('usr')[3:4]
yH <- 20000
xW <- 50000
gap <- 50000
gap2 <- 40000
text(x = x[1]+gap, y = y[2]-gap, 'Threat complexes', adj = c(0,.5), font = 2)
# Polygons
for(i in 1:7) {
  xmn <- x[1]+gap+20000
  xmx <- x[1]+gap+20000+xW
  ymn <- y[2]-gap-i*gap2-yH/2
  ymx <- y[2]-gap-i*gap2+yH/2
  polygon(x = c(xmn, xmx, xmx, xmn), y = c(ymn,ymn,ymx,ymx), col = cols[i], lwd = .5)
  text(x = xmx+10000, y = mean(c(ymn,ymx)), labels = paste('Threat complex', i), cex = .6, adj = c(0, .5))
}

dev.off()
