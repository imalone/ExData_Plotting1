plot2 <- function(selData, pngout="plot2.png",
                  ylab="Global Active Power (kilowatts)") {
  if(!is.na(pngout)) {
    png(filename=pngout,
        width=480, height=480)
  }
  with(selData,plot(absTime,Global_active_power,
                    type="l",
                    xlab=NA,
                    ylab=ylab))
  if(!is.na(pngout)) {
    dev.off()
  }
}
