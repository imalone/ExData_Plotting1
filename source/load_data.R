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

