source("load_data.R")
selData <- loadData()

#Plot 4, do it all again, because we want to make a small
#change to the legend from plot 3
png(filename="plot4.png",
    width=480, height=480)
par(mar=c(2.1,4.1,2.1,1.1))
with(selData,plot(absTime,Sub_metering_1,
                  type="l",
                  xlab=NA,
                  ylab="Energy sub metering"))
with(selData,lines(absTime,Sub_metering_2, col="red"))
with(selData,lines(absTime,Sub_metering_3, col="blue"))
legend("topright",col=c("black","red","blue"),
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"),
       lty=1
       
)

dev.off()
