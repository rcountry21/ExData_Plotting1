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

png("plot3.png");
# Show plot as assigned

plot(plotData$DateTime, as.numeric(as.character(plotData$Sub_metering_1)), 
     type = "l", col="black", xlab = '', ylab = 'Energy Sub Meetering')
lines(plotData$DateTime, as.numeric(as.character(plotData$Sub_metering_2)), type="l",col="red")
lines(plotData$DateTime, as.numeric(as.character(plotData$Sub_metering_3)), type="l",col="blue")
legend("topright", lty=c(1,1), 
        col=c("black","blue","red"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),)

dev.off()