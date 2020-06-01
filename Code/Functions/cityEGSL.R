cityEGSL <- function(prj = slmetaPrj('default')) {

  city <- data.frame(latitude = numeric(0),
                     longitude = numeric(0),
                     city = character(0),
                     yGap = numeric(0),
                     xGap = numeric(0),
                     adj1 = numeric(0),
                     adj2 = numeric(0),
                     stringsAsFactors = F)

  city[1,] <- c(48.41, -68.42, 'Rimouski', .0056, .0076, 0, 1)
  city[2,] <- c(47.79, -69.43, 'Rivière-du-Loup', 0, .0076, 0, 1)
  city[3,] <- c(48.78, -67.45, 'Matane', 0, .0076, 0, 1)
  city[4,] <- c(50.3, -66.6, 'Sept-Îles', .006, -.0076, 1, 0)
  city[5,] <- c(49.26, -68.32, 'Baie-Comeau', 0, -.015, 1, .5)
  city[6,] <- c(48.09, -69.9, 'Saguenay River', 0, -.0076, 1, 1)
  city[7,] <- c(48.83164, -64.68, 'Gaspé', 0, -.0076, 1, 1)
  city[8,] <- c(46.15, -64.53469, 'Shediac', 0, -.0076, 1, 1)
  city[9,] <- c(47.05, -65.65, 'Miramichi', 0, -.015, 1, 1)
  city[10,] <- c(45.53, -62.6, 'New Glasgow', 0, -.0076, 1, 1)
  city[11,] <- c(48.61, -58.51, 'Stephenville', .006, .0076, 0, 0)
  city[12,] <- c(48.94900, -57.86, 'Corner Brook', 0, .0076, 0, 0)
  city[13,] <- c(49.7, -65.7, 'Anticosti Gyre', .1151, .011, 0, 0)
  city[14,] <- c(49.41, -67.48, 'Pointe-des-Monts', .018, -.0036, 1, 0)
  city[15,] <- c(46.28, -63.13107, 'Charlottetown', .061, .167, 0, .5)
  city[16,] <- c(46.92953, -70.93119, 'Île d\'Orléans', 0, -.0076, 1, 0)

  # city[8,] <- c(46.81388, -71.20798, 'Québec city', 0, -.0076, 1, 0)
  # city[,] <- c(50.33, -63.59857, 'Havre-Saint-Pierre', 15000, -10000, 1, 0)
  # city[,] <- c(47.74393, -64.70569, '', -20000, -25000, 1, 1) # Shippagan
  # city[,] <- c(48.06578, -66.37311, 'Dalhousie', 0, -15000, 1, 0)
  # city[,] <- c(46.39338, -63.79023, '', 0, 0, 0, 0) # Summerside
  # city[,] <- c(46.35498, -62.25183, '', 0, 0, 0, 0) # Souris
  # city[,] <- c(47.38770, -61.90120, '', 0, 0, 0, 0) # Magdalen Islands
  # city[,] <- c(45.68091, -61.53902, 'Havre Boucher', -10000, 0, 0, 1)
  # city[,] <- c(49.54952, -62.95553, 'Anticosti', -18000, 35000, .5, 1)
  # city[,] <- c(, '')

  city$latitude <- as.numeric(city$latitude)
  city$longitude <- as.numeric(city$longitude)
  city$xGap <- as.numeric(city$xGap)
  city$yGap <- as.numeric(city$yGap)
  city$adj1 <- as.numeric(city$adj1)
  city$adj2 <- as.numeric(city$adj2)

  city <- st_as_sf(x = city, coords = c("longitude", "latitude"), crs = 4326, remove = F) %>%
          st_transform(crs = prj) %>%
          cbind(st_coordinates(.))


  # png('/users/davidbeauchesne/desktop/delete.png', width = 1280, height = 920, res = 300, pointsize = 6)
  # egslSimple <- st_transform(egslSimple, crs = 4326)
  # data(egslSimple)
  # plot(st_geometry(egslSimple))
  plot(st_geometry(city), add = T, pch = 20, cex = 1.5)
  # Add text
  yR <- par('usr')[4] - par('usr')[3]
  xR <- par('usr')[2] - par('usr')[1]
  for(i in 1:nrow(city)) {
    text(x = city$X[i] + city$xGap[i]*xR,
         y = city$Y[i] + city$yGap[i]*yR,
         labels = city$city[i],
         cex = .85,
         adj = c(city$adj1[i], city$adj2[i]))
  }
  # Lines for text
  i <- which(city$city == 'Anticosti Gyre')
  j <- which(city$city == 'Charlottetown')
  lines(x = c(city$X[i],city$X[i]+city$xGap[i]*xR-.0076*xR), y = c(city$Y[i], city$Y[i]+city$yGap[i]*yR))
  lines(x = c(city$X[j],city$X[j]+city$xGap[j]*xR-.00076*xR), y = c(city$Y[j], city$Y[j]+city$yGap[j]*yR-.006*yR))
  # dev.off()
}
