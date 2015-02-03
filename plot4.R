source("plotting.R")

makePng("plot4", {
    smallFontSize <- 0.8
    par(mfrow = c(2,2), cex = smallFontSize, oma = c(0,0,0,0))
    
    plot(x = data$Time,
         y = data$Global_active_power,
         type="l",
         xlab = "",
         ylab = "Global Active Power")
    plot(x = data$Time,
         y = data$Voltage,
         type="l",
         xlab = "datetime",
         ylab = "Voltage")
    drawMeteringPlot(smallLegend = TRUE)
    plot(x = data$Time,
         y = data$Global_reactive_power,
         type ="l",
         xlab = "datetime",
         ylab = "Global_reactive_power")    
})
