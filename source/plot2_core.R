# Do plot 2, by default write to file, if pngout=NA
# then write to current device.
# ylab parameter can be set to alter y axis label
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

