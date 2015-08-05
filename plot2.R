source("load_data.R")
selData <- loadData()

png(filename="plot2.png",
    width=480, height=480)
par(mar=c(2.1,4.1,2.1,1.1))
with(selData,plot(absTime,Global_active_power,
                  type="l",
                  xlab=NA,
                  ylab="Global Active Power (kilowatts)"))
dev.off()
