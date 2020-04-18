# source('./Code/18-egsl.R')
# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')

# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
load('./data/bathy.RData') # Bathymetry
data(canada)
data(usa)
canada <- st_transform(canada, crs = 4326)
usa <- st_transform(usa, crs = 4326)
bathy <- st_transform(bathy, crs = 4326)
deph <- bathy$DEPH


library(raster)
r <- raster(ncol=180, nrow=180)
extent(r) <- extent(bathy)
r <- fasterize::fasterize(bathy, r, field = 'DEPH')
r <- mask(r, egslSimple)

# ~~~~~~~~~~~~~~~~~~~ EGSL ~~~~~~~~~~~~~~~~~~~ #
# Layout
pal <- colorRampPalette(c('#E2FCF6', '#1B7CAA'))
cols <- pal(101)[((deph/max(deph, na.rm = T))*100)+1]

cexMain <- 1
cexMain2 <- .75
# png('./figures/egsl.png', width = 1280, height = 920, res = 300, pointsize = 6)
jpeg('./figures/egsl.jpg', width = 1280, height = 920, res = 300, pointsize = 6)
par(bg = '#ffffff')
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

# plot(st_geometry(bathy), add = T, col = cols, border = cols, lwd = .1)
# plot(st_geometry(bathy), add = T, col = cols, border = 'transparent', lwd = .1)
image(r, col = pal(100), axes = F, ylab = '', xlab = '', add = T)
plot(st_geometry(egslSimple), col = 'transparent', border = focus, lwd = .75, add = T)
# plot(st_geometry(canada), col = off, border = focus, lwd = .75, add = T)
# plot(st_geometry(usa), col = off, border = focus, lwd = .75, add = T)
box2("1234", lwd = 3)
# Legend
legendEGSL(range = c(0, 525),
           pal = pal,
           mainTitle = 'Bathymetry',
           subTitle = 'meters',
           cexMain = .9,
           cexSub = .65,
           n = 6)

colText <- '#717171'

city <- data.frame(latitude = numeric(0),
                   longitude = numeric(0),
                   city = character(0),
                   yGap = numeric(0),
                   xGap = numeric(0),
                   adj1 = numeric(0),
                   adj2 = numeric(0),
                   stringsAsFactors = F)

#
city[1,] <- c(48.09, -69.9, 'Saguenay River', 0, -.0076, 1, 1)
city[2,] <- c(49.7, -65.7, 'Anticosti Gyre', .1151, .011, 0, 0)
city[3,] <- c(49.41, -67.48, 'Pointe-des-Monts', .018, -.0036, 1, 0)
city[4,] <- c(46.92953, -70.93119, 'Île d\'Orléans', 0, -.0076, 1, 0)
city[5,] <- c(46.28, -63.13107, '', .061, .167, 0, .5)
city[6,] <- c(45.25, -62.5, '', .04, .165, 0, .5)

# city[5,] <- c(47.38770, -61.90120, 'Magdalen Islands', -.01, .15, 0, 0)
# city[5,] <- c(48.75, -62.95553, '', 0, 0, 0, 0)

# City names
city$latitude <- as.numeric(city$latitude)
city$longitude <- as.numeric(city$longitude)
city$xGap <- as.numeric(city$xGap)
city$yGap <- as.numeric(city$yGap)
city$adj1 <- as.numeric(city$adj1)
city$adj2 <- as.numeric(city$adj2)

city <- st_as_sf(x = city, coords = c("longitude", "latitude"), crs = 4326, remove = F) %>%
        st_transform(crs = 4326) %>%
        cbind(st_coordinates(.))

plot(st_geometry(city), add = T, pch = 20, cex = 1.5)
# Add text
yR <- par('usr')[4] - par('usr')[3]
xR <- par('usr')[2] - par('usr')[1]
for(i in 1:nrow(city)) {
  text(x = city$X[i] + city$xGap[i]*xR,
       y = city$Y[i] + city$yGap[i]*yR,
       labels = city$city[i],
       cex = .8,
       col = colText,
       adj = c(city$adj1[i], city$adj2[i]))
}
# Lines for text
i <- which(city$city == 'Anticosti Gyre')
lines(x = c(city$X[i],city$X[i]+city$xGap[i]*xR-.0076*xR), y = c(city$Y[i], city$Y[i]+city$yGap[i]*yR))
j <- 5
lines(x = c(city$X[j],city$X[j]+city$xGap[j]*xR-.00076*xR), y = c(city$Y[j], city$Y[j]+city$yGap[j]*yR-.006*yR))
j <- 6
lines(x = c(city$X[j],city$X[j]+city$xGap[j]*xR-.00076*xR), y = c(city$Y[j], city$Y[j]+city$yGap[j]*yR-.006*yR))

# Text
text(y = 49.5, x = -62.95553, labels = 'Anticosti', srt = -28,col = colText, cex = .8)
text(y = 49.3, x = -64.25, labels = 'Laurentian\nChannel', srt = -28,col = colText, cex = .8)
text(y = 49.85, x = -62.25, labels = 'Anticosti Channel', srt = -15,col = colText, cex = .8)
text(y = 49.85, x = -59, labels = 'Esquiman Channel', srt = 45,col = colText, cex = .8)
text(y = 47.45, x = -63.25, labels = 'Magdalen\nShallows', srt = 0,col = colText, cex = .8, adj = c(.5,.5))
text(y = 47.55, x = -60.1 , labels = 'Cabot\nStrait', srt = 0,col = colText, cex = .8, adj = c(.5,.5))
text(y = 51.75, x = -56.25, labels = 'Belle-Isle\nStrait', srt = 0,col = colText, cex = .8, adj = c(.5,.5))
text(y = 51.75, x = -56.25, labels = 'Belle-Isle\nStrait', srt = 0,col = colText, cex = .8, adj = c(.5,.5))
text(y = 46.6, x = -59.8, 'Prince Edward\nIsland', srt = 0,col = colText, cex = 1, adj = c(0,.5), font = 2)
text(y = 48.6, x = -58, 'Newfoundland', srt = 0,col = colText, cex = 1, adj = c(0,.5), font = 2)
text(y = 46.4, x = -67.75, 'New-Brunswick', srt = 0,col = colText, cex = 1, adj = c(0,.5), font = 2)
text(y = 50.9, x = -68.5, 'Québec', srt = 0,col = colText, cex = 1, adj = c(0,.5), font = 2)
text(y = 45.6, x = -59.2, 'Nova-Scotia', srt = 0,col = colText, cex = 1, adj = c(0,.5), font = 2)
text(y = 52, x = mean(par('usr')[1:2]), 'St. Lawrence\nSystem', col = '#000000', cex = 1.3, adj = c(.5,.5), font = 4)
text(y = mean(par('usr')[3:4])-.25, x = mean(par('usr')[1:2])+1.5, 'Gulf of\nSt. Lawrence', col = '#000000', cex = 1, adj = c(.5,.5), font = 4)
text(y = 49.1, x = -67.5, labels = 'St. Lawrence Estuary', srt = 35, col = '#000000', cex = 1, font = 4)

dev.off()
