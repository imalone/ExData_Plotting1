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

selData <- loadData()
save.par=par()
par(mar=c(2.1,4.1,2.1,1.1))
plot3(selData)
suppressWarnings(par(save.par))

