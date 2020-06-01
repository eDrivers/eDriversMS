# Data
load('./Data/drivers.RData')
load('./Data/Spatial/egslGrid.RData')
load('./Data/Spatial/egslSimple.RData')
dr <- drivers[, -1]

# Colors
colsPalette <- c("#c7cbce", "#96a3a3", "#687677", "#222d3d", "#25364a", "#c77f20","#e69831", "#e3af16", "#e4be29", "#f2ea8b")
pal <- colorRampPalette(colsPalette)
rbPal <- colorRampPalette(c('#f4f4f4',colsPalette))
focus  <- '#25364A'
off    <- '#f2f2f2'
uni <- colsPalette[7]
gg_color_hue <- function(n) {
  hues = seq(15, 375, length = n + 1)
  hcl(h = hues, l = 65, c = 100, alpha = .5)[1:n]
}

# Extent
library(sf)
extFig <- as.numeric(st_bbox(egslSimple)) + c(-1.5,-.5,.5,.5)

# Projections
world <- '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'

# Parameters
nDr <- ncol(dr) # Number of drivers

# Driver names data.frame
drNames <- data.frame(var = character(),
                      full = character(),
                      accr = character(),
                      group = character(),
                      stringsAsFactors = F)

drNames[1, ] <- c("Acidification","Acidification","ACID","Cl")
drNames[2, ] <- c("aquacultureInv","Aquaculture","AQUA","C")
drNames[3, ] <- c("coastDev","Coastal development","CD","C")
drNames[4, ] <- c("dirHumImpact","Direct human impact","DHI","C")
drNames[5, ] <- c("fisheriesDD","Demersal destructive fisheries","DD","F")
drNames[6, ] <- c("fisheriesDNH","Demersal, non-destructive, high-bycatch fisheries","DNH","F")
drNames[7, ] <- c("fisheriesDNL","Demersal, non-destructive, low-bycatch fisheries","DNL","F")
drNames[8, ] <- c("fisheriesPHB","Pelagic, high-bycatch fisheries","PHB","F")
drNames[9, ] <- c("fisheriesPLB","Pelagic, low-bycatch fisheries","PLB","F")
drNames[10, ] <- c("Hypoxia","Hypoxia","HYP","Cl")
drNames[11, ] <- c("inorgPol","Inorganic pollution","IP","C")
drNames[12, ] <- c("invasives", "Invasives species","INV","T")
drNames[13, ] <- c("marinePol","Marine pollution","MP","T")
drNames[14, ] <- c("nutrientInput","Nutrient input","NI","C")
drNames[15, ] <- c("orgPol","Organic pollution","OP","C")
drNames[16, ] <- c("negSBT","Negative sea bottom temperature anomalies","SBT-","Cl")
drNames[17, ] <- c("posSBT","Positive sea bottom temperature anomalies","SBT+","Cl")
drNames[18, ] <- c("seaLevel","Sea level rise","SLR","Cl")
drNames[19, ] <- c("shipping","Shipping","SHP","T")
drNames[20, ] <- c("negSST","Negative sea surface temperature anomalies","SST-","Cl")
drNames[21, ] <- c("posSST","Positive sea surface temperature anomalies","SST+","Cl")
drNames[22, ] <- c("toxicAlgae","Toxic algae","TA","C")

# Groups
nGroup <- length(unique(drNames$group))
grNames <- data.frame(accr = character(), name = character(), stringsAsFactors = F)
grNames[1, ] <- c('C','Coastal')
grNames[2, ] <- c('Cl','Climate')
grNames[3, ] <- c('F','Fisheries')
grNames[4, ] <- c('T','Marine traffic')
