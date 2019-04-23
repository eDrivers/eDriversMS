# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')


# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./data/k.RData')
load('./data/clMed.RData')
load('./data/clMean.RData')


# ~~~~~~~~~~~~~~~~~~~ METHOD COMPARISON ~~~~~~~~~~~~~~~~~~~ #
# Make clusters similar
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# may need to be redone depending on the analyses results
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
id1 <- clMean == 1
id2 <- clMean == 2
id3 <- clMean == 3
id4 <- clMean == 4
id5 <- clMean == 5
id6 <- clMean == 6
clMean[id1] <- 1
clMean[id2] <- 6
clMean[id3] <- 5
clMean[id4] <- 3
clMean[id5] <- 2
clMean[id6] <- 4

# Differences
cl12 <- as.numeric(clMed == clMean) + 1
corr <- round((sum(clMed == clMean)/length(clMed)*100))

png('./figures/clusterComp.png', width = 2560, height = 1840, res = 300, pointsize = 6)
par(mfrow = c(2,2))

# K-medoids clustering
cols <- pal(k)[clMed]
plotEGSL('egslSimple', prj = slmetaPrj('world'), extent = 'egslSimple')
plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)
# plot(st_geometry(egslSimple), col = 'transparent', border = '#25364A', lwd = .75, add = T)
text(x = mean(par('usr')[1:2]), y = par('usr')[4] - diff(par('usr')[3:4])*.1, 'k-medoids clustering', cex = 2, font = 2)

# K-means clustering
cols <- pal(k)[clMean]
plotEGSL('egslSimple', prj = slmetaPrj('world'), extent = 'egslSimple')
plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)
# plot(st_geometry(egslSimple), col = 'transparent', border = '#25364A', lwd = .75, add = T)
text(x = mean(par('usr')[1:2]), y = par('usr')[4] - diff(par('usr')[3:4])*.1, 'k-means clustering', cex = 2, font = 2)

# Difference
pal2 <- colorRampPalette(c('#00000000', pal(1)))
cols <- pal2(2)[cl12]
plotEGSL('egslSimple', prj = slmetaPrj('world'), extent = 'egslSimple')
plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)
# plot(st_geometry(egslSimple), col = 'transparent', border = '#25364A', lwd = .75, add = T)
text(x = mean(par('usr')[1:2]), y = par('usr')[4] - diff(par('usr')[3:4])*.1, 'Correspondance', cex = 2, font = 2)
text(x = mean(par('usr')[1:2]), y = par('usr')[4] - diff(par('usr')[3:4])*.15, paste0('Cell correspondance: ', corr, '%'), cex = 1.5)

# Legend
cols <- pal(k)
y <- seq(.85, .15, length.out = k)
yG <- .035
plot0(xlim = c(0,1), ylim = c(0,1))
for(i in 1:k) polygon(x = c(.1,.2,.2,.1), y = c(y[i]-yG, y[i]-yG, y[i]+yG, y[i]+yG), col = cols[i])
text(x = .21, y = y, labels = paste('Cluster', 1:k), cex = 1.5, adj = c(0, .5))
dev.off()
