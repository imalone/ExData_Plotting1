source("load_data.R")
selData <- loadData()

png(filename="plot1.png",
    width=480, height=480)
with(selData,hist(Global_active_power,
                  col="red",
                  main="Global Active Power",
                  xlab="Global Active Power (kilowatts)",
                  yaxp=c(0, 1200, 6)
))
dev.off()
