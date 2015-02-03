source("plotting.R")

makePng("plot2", {
    plot(x = data$Time,
         y = data$Global_active_power,
         type="l",
         xlab = "",
         ylab = "Global Active Power (kilowatts)")    
})
