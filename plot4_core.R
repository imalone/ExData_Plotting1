plot4a <- function(selData, pngout="plot4a.png") {
  if(!is.na(pngout)) {
    png(filename=pngout,
        width=480, height=480)
  }
  with(selData,plot(absTime,Voltage,
                    type="l",
                    xlab="datetime"))
  if(!is.na(pngout)) {
    dev.off()
  }
}

plot4b <- function(selData, pngout="plot4b.png") {
  if(!is.na(pngout)) {
    png(filename=pngout,
        width=480, height=480)
  }
  with(selData,plot(absTime,Global_reactive_power,
                    type="l",
                    xlab="datetime"))
  if(!is.na(pngout)) {
    dev.off()
  }
}
