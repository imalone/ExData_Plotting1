library(lubridate)
# Lubridate used for date reading

# load household_power_consumption and add $absTime field
# to combine date and time information
loadData <- function() {
  dataFile <- "household_power_consumption.txt"
  allData <- read.table(dataFile,sep=";",header=TRUE,
                        na.strings = "?",
                        stringsAsFactors = F)
  #simplest way to pick the days, just look at date
  matchDates<-as.Date(c("2007-02-01", "2007-02-02"))
  selData=allData[as.Date(allData$Date, format("%d/%m/%Y"))
                  %in% matchDates,]
  selData$absTime=dmy_hms(paste(selData$Date,selData$Time))
  selData
}

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

# Do plot 3, by default write to file, if pngout=NA
# then write to current device.
# legend.bty sets the legend bty paramter, either "o" for
# legend box border (default) or "n" for no border.
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

# Do one of the plot4 subplots (first new plot),
# by default write to file, if pngout=NA
# then write to current device.
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

# Do one of the plot4 subplots (second new plot),
# by default write to file, if pngout=NA
# then write to current device.
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

selData <- loadData()

png(filename="plot4.png",
    width=480, height=480)
par(mfcol=c(2,2))
plot2(selData,pngout=NA,ylab="Global Active Power")
plot3(selData,pngout=NA,legend.bty="n")
plot4a(selData,pngout=NA)
plot4b(selData,pngout=NA)
dev.off()

