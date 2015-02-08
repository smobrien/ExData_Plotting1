# Read in data from file
powData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

# Convert Date column to Date class
powData$Date <- as.Date(powData$Date, "%d/%m/%Y")

# Strip to just 02-01-2007 : 02-02-2007
powDataInRange <- (powData$Date >= "2007-02-01" & powData$Date <= "2007-02-02")

# Subset to desired dates
powData <- powData[powDataInRange,]

# Open graphics devices, default size is already 480x480
png("plot1.png")

# Plot histogram
hist(powData$Global_active_power, col="red", main = paste("Global Active Power"),
     xlab = "Global Active Power (kilowatts)")

# Close graphics device
dev.off()