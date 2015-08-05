plot3 <- function(selData, pngout="plot3.png",
                  legend.bty="o") {
  if(!is.na(pngout)) {
    png(filename=pngout,
        width=480, height=480)
  }
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
         lty=1,
         bty=legend.bty
  )
  
  if(!is.na(pngout)) {
    dev.off()
  }
}
