source("load_data.R")
source("plot2_core.R")
source("plot3_core.R")
source("plot4_core.R")
selData <- loadData()

png(filename="plot4.png",
    width=480, height=480)
par(mfcol=c(2,2))
plot2(selData,pngout=NA,ylab="Global Active Power")
plot3(selData,pngout=NA,legend.bty="n")
plot4a(selData,pngout=NA)
plot4b(selData,pngout=NA)
dev.off()

