# Read in data from file
powData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

# Convert Date column to Date class
powData$Date <- as.Date(powData$Date, "%d/%m/%Y")

# Strip to just 02-01-2007 : 02-02-2007
powDataInRange <- (powData$Date >= "2007-02-01" & powData$Date <= "2007-02-02")

# Subset to desired dates
powData <- powData[powDataInRange,]

# Open graphics devices, default size is already 480x480
png("plot3.png")

# Generate x-axis date/time data
xData <- as.POSIXlt(paste(powData$Date, powData$Time))

# Plot 3
plot(xData, powData$Sub_metering_1, type = "l", col="black", xlab="", ylab="Energy sub metering")
lines(xData, powData$Sub_metering_2, type = "l", col="red")
lines(xData, powData$Sub_metering_3, type = "l", col="blue")
legend("topright", names(powData)[7:9], lty=1, col=c('black','red','blue'))

# Close graphics device
dev.off()