source("load_data.R")
source("plot2_core.R")
selData <- loadData()
save.par <- par()
par(mar=c(2.1,4.1,2.1,1.1))
plot2(selData)
suppressWarnings(par(save.par))

