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

selData <- loadData()
save.par <- par()
par(mar=c(2.1,4.1,2.1,1.1))
plot2(selData)
suppressWarnings(par(save.par))

