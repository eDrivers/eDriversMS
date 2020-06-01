# Function to plot color bar
# Modified from http://stackoverflow.com/questions/9314658/colorbar-from-custom-colorramppalette
colorBar <- function(colRamp, min, max=-min, mar = NULL, nticks=11, ticks=seq(min, max, len=nticks), title='', align = 'horizontal', new = FALSE, ...) {
    scale = (length(colRamp)-1)/(max-min)

    if(align == 'vertical') {
        if(new == TRUE) {
            dev.new(width=1.75, height=5)
        }
        if(is.null(mar)) mar <- c(0,0,0,4)
        par(mar = mar)
        plot(c(0,10), c(min,max), type='n', bty='n', xaxt='n', xlab='', yaxt='n', ylab='', main=title, ...)
        axis(4, ticks, las=1, ...)
        for (i in 1:(length(colRamp)-1)) {
            y = (i-1)/scale + min
            rect(0,y,10,y+1/scale, col=colRamp[i], border=NA)
        }
    }

    if(align == 'horizontal') {
        if(new == TRUE) {
            dev.new(width=5, height=1.75)
        }
        if(is.null(mar)) mar <- c(4,0,0,0)
        par(mar = mar)
        plot(c(min,max), c(0,1), type='n', bty='n', xaxt='n', xlab='', yaxt='n', ylab='', main=title, ...)
        axis(1, ticks, las=1, ...)
        for (i in 1:(length(colRamp)-1)) {
            y = (i-1)/scale + min
            rect(y,0,y+1/scale,10, col=colRamp[i], border=NA)
        }
    }
}
