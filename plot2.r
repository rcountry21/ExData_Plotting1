# Ryan Countryman
# Exploratory Data Analysis
# 6/7/2014

# Code to download the from the web
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header=T, sep=";")
unlink(temp)

# Isolate the data we want for this assignment Feb 1 - Feb 2, 2007
plotData <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time),format="%d/%m/%Y %H:%M:%S")

png("plot2.png");
# Show plot as assigned

plot( plotData$DateTime, as.numeric( as.character(plotData$Global_active_power) ), ylab = "Global Active Power (killowatts)", xlab = "", type="l" )

dev.off()