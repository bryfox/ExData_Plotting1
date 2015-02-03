source("plotting.R")

makePng("plot1", {
    hist(as.numeric(data$Global_active_power),
         col="red",
         bg="transparent",
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
})
