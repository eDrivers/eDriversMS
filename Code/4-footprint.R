# ~~~~~~~~~~~~~~~~~~~ PARAMETERS ~~~~~~~~~~~~~~~~~~~ #
source('./code/2-param.R')

# ~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~ #
Fd <- rowSums(dr)


# ~~~~~~~~~~~~~~~~~~~ FOOTPRINT ~~~~~~~~~~~~~~~~~~~ #
# Layout
# Figure 2
cols <- pal(101)[((Fd/max(Fd, na.rm = T))*100)+1]
cexMain <- 1
cexMain2 <- .75
png('./figures/footprint.png', width = 1280, height = 920, res = 300, pointsize = 6)
# par(bg = colBack)
plotEGSL(layers     = c('egslSimple', 'canada','usa'),
         cols       = c('#00000000',off,off),
         borders    = c('#00000000',focus,focus),
         lwds       = c(.75,.75,.75),
         mar        = c(2,2,2,2),
         box        = T,
         axes       = 1:4,
         northArrow = F,
         prj        = slmetaPrj('world'),
         extent     = 'egslSimple')
plot(st_geometry(egslGrid), add = T, col = cols, border = cols, lwd = .1)
plot(st_geometry(egslSimple),
     col = 'transparent',
     border = focus,
     lwd = .75,
     add = T)

# Legend
legendEGSL(range = c(min(Fd), max(Fd)),
           mainTitle = 'Cumulative footprint',
           subTitle = '',
           cexMain = .9,
           cexSub = .65,
           n = 6)

# City names
cityEGSL()
dev.off()
