# Read in data from file
powData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

# Convert Date column to Date class
powData$Date <- as.Date(powData$Date, "%d/%m/%Y")

# Strip to just 02-01-2007 : 02-02-2007
powDataInRange <- (powData$Date >= "2007-02-01" & powData$Date <= "2007-02-02")

# Subset to desired dates
powData <- powData[powDataInRange,]

# Open graphics devices, default size is already 480x480
png("plot2.png")

# Generate x-axis date/time data
xData <- as.POSIXlt(paste(powData$Date, powData$Time))

# Plot data as line plot
plot(xData, powData$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Close graphics device
dev.off()