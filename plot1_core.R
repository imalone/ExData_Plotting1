plot1 <- function(selData, pngout="plot1.png") {
  if (!is.na(pngout)) {
    png(filename=pngout,
        width=480, height=480)
  }
  with(selData,hist(Global_active_power,
                    col="red",
                    main="Global Active Power",
                    xlab="Global Active Power (kilowatts)",
                    yaxp=c(0, 1200, 6)
  ))
  if (!is.na(pngout)) {
    dev.off()
  }
}