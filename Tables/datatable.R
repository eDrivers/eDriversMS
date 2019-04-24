library(knitr)
library(kableExtra)

# Table 1
df <- data.frame(Groups = character(0),
                 Drivers = character(0),
                 SpatRes = character(0),
                 TempRes = character(0),
                 Years = character(0),
                 Units = character(0),
                 Source = character(0),
                 Accronym = character(0),
                 stringsAsFactors = F)

df[1,] <- c("Climate", "Aragonite", 'Lat/long', 'August-September', '2018', '$\\Omega$ $Aragonite$', '[@starr2019]','ACID')
df[2,] <- c("Coastal", "Aquaculture", 'Lat/long', '-','Variable, between 1990-2016', '$presence-absence$','***TBD***','AQUA')
df[3,] <- c("Climate", "Sea bottom temperature", '~2 $km^2$', 'Monthly', '1981-2010 vs. 2013-2017', '$n$ negative anomalies', '[@galbraith2018]','SBT-')
df[4,] <- c("Climate", "Sea bottom temperature", '~2 $km^2$', 'Monthly', '1981-2010 vs. 2013-2017', '$n$ positie anomalies', '[@galbraith2018]','SBT+')
df[5,] <- c("Climate",  "Sea surface temperature", '~2 $km^2$', 'Monthly', '1981-2010 vs. 2013-2017', '$n$ negative anomalies', '[@galbraith2018]','SST-')
df[6,] <- c("Climate", "Sea surface temperature", '~2 $km^2$', 'Monthly', '1981-2010 vs. 2013-2017', '$n$ positive anomalies', '[@galbraith2018]','SST+')
df[7,] <- c("Climate", "Sea level rise", 'Modeled 0.25 degree', '10 days', '1992-2012', '$mm$','[@halpern2015]','SLR')
df[8,] <- c("Marine traffic", "Shipping", '0.1 degree', 'Event based', '2003-2011', '$n$ lanes', '[@halpern2015]','SHP')
df[9,] <- c("Fisheries", "Pelagic, low-bycatch", 'Lat/long', 'Event based', '2010-2015', '$kg$', '[@dfo2016]','PLB')
df[10,] <- c("Fisheries", "Pelagic, high-bycatch", 'Lat/long', 'Event based', '2010-2015', '$kg$', '[@dfo2016]','PHB')
df[11,] <- c("Fisheries", "Demersal, destructive", 'Lat/long', 'Event based', '2010-2015', '$kg$', '[@dfo2016]','DD')
df[12,] <- c("Fisheries", "Demersal, non-destructive, low-bycatch", 'Lat/long', 'Event based', '2010-2015', '$kg$', '[@dfo2016]','DNL')
df[13,] <- c("Fisheries", "Demersal, non-destructive, high-bycatch", 'Lat/long', 'Event based', '2010-2015', '$kg$', '[@dfo2016]','DNH')
df[14,] <- c("Coastal", "Coastal development", '15 arc-second', 'Annual', '2015-2016', '$nanoWatts$ $cm^{-2}$ $sr^{-1}$', '[@earthobservationgroup2019]','CD')
df[15,] <- c("Coastal", "Direct human impact", 'Dissemination areas', 'Annual', '2016', 'population', '[@statisticscanada2017]','DHI')
df[16,] <- c("Climate", "Hypoxia", 'Lat/long', 'August-September', '2018', '$ml$ $L^{-1}$', '[@blais2018]','HYP')
df[17,] <- c("Marine traffic", "Invasive species", 'Modeled 1 $km^2$', 'Annual', '2011', '$t$ port volume', '[@halpern2015]','INV')
df[18,] <- c("Coastal", "Inorganic pollution", 'Modeled 1 $km^2$', 'Annual', '2000-2001', '-', '[@halpern2015]','IP')
df[19,] <- c("Marine traffic", "Marine pollution", 'Modeled 1 $km^2$', 'Event based & annual', '2003-2011 & 2011', '$n$ lanes + $t$ port volume', '[@halpern2015]','MP')
df[20,] <- c("Coastal", "Nutrient import", 'Modeled 1 $km^2$', 'Annual', '2007-2010', '$t$ fertilizer', '[@halpern2015]','NI')
df[21,] <- c("Coastal", "Organic pollution", 'Modeled 1 $km^2$', 'Annual', '2007-2010', '$t$ pesticide', '[@halpern2015]','OP')
df[22,] <- c("Coastal", "Toxic algae", '-', '-', '-', 'Expert based', '[@bates2019]','TA')
# df[,] <- c("Climate change - Ultra-violet radiation", '0.25 degree', 'Daily', '2004-2018', '$mW/m^2$', '[@hovila2014]')
# df[,] <- c("Ice cover", '***TBD***', '***TBD***', '***TBD***', '***TBD***', '***TBD***')

# Sort table
df <- df[order(df$Groups, df$Drivers), ]

# Table 1
table1 <- kable(x = df[, c("Groups", "Drivers", 'SpatRes', "TempRes", 'Years', "Units", "Source")],
      col.names = c("Groups", "Drivers", 'Spatial resolution', "Temporal resolution", 'Years', "Units", "Source"),
      row.names = F,
      align = c('l','l','l','l','l','l','l'),
      format = 'markdown'
     )
table1[[2]] <- "|:--------|:---------------|:----------|:----------|:----------|:----------|:--------------------|"
save(table1, file = './tables/table1.RData')

# Table S1
tableS1 <- kable(x = df[, c("Groups", "Drivers", "Accronym","Source")],
      col.names = c("Groups", "Drivers", "Accronym","Source"),
      row.names = F,
      align = c('l','l','l','l'),
      format = 'markdown'
     )
tableS1[[2]] <- "|:--------|:---------------|:----------|:--------------------|"
save(tableS1, file = './tables/tableS1.RData')
