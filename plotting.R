# examine how household energy usage varies over a 2-day period in February, 2007
# Be sure to set working directory, e.g.:
#   setwd("~/dev/datasciencecoursera/ExData_Plotting1")

# Loads our data from file; formats and filters per requirements
# This will take some time to run
# Change fname as appropriate; data can be downloaded from
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
loadPowerData <- function (fname = "household_power_consumption.txt") {
    data <-read.csv(fname, sep=";", stringsAsFactors=FALSE)
    data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
    data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
    data
}

# Only load data if not already defined in environment
if (class(data) != "data.frame") {
    data <- loadPowerData()
}

# Return the output filepath for PNGs
pngName <- function (name) {
    paste(name, ".png", sep="")
}

# Save to a named png file and close the device
# Note! Copying to png creates problems with legend sizes
# which work fine when plotting directly to png; consider
# makePng(name, {...}) instead. (Seen on OS X, R v3.1.2)
savePng <- function (name, w=480, h=480) {
    dev.copy(png, file=pngName(name), width=w, height=h)
    dev.off()
}

# Wraps plotting code to output to png device
makePng <- function (name, plotting) {
    png(pngName(name), bg = "transparent")
    eval(substitute(plotting))
    dev.off()
}

# Default plotting options
par(mfrow = c(1,1), cex = 0.8, oma = c(1,1,1,1), bg = NA)

# This is reused with slight variation for plots 3 & 4
drawMeteringPlot <- function (smallLegend = FALSE) {
    plot(x = data$Time,
         y = data$Sub_metering_1,
         bg="transparent",
         type="n",
         xlab = "",
         ylab = "Energy sub metering")
    lines(data$Time, data$Sub_metering_1)
    lines(data$Time, data$Sub_metering_2, col="red")
    lines(data$Time, data$Sub_metering_3, col="blue")
    
    boxType  <- if (smallLegend) "n" else "o"
    legendSize <- if (smallLegend) 0.9 else 1.0
    # legendInset <- if (smallLegend) c(0.08, 0) else c(0.08,0)
    legend("topright",
           #inset = legendInset,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty = c(1,1),
           col = c("black","red","blue"),
           bty = boxType,
           cex = legendSize)
}


