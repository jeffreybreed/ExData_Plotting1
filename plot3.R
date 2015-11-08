# ---------------------------------------------------------------------------------------------------------------------------------------
#   File:    plot3.R
#   Author:  Jeffrey Reed
#   Purpose: Generate plot3.png line graph for Energy sub metering by day
# ---------------------------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------------------------------------------
#   file parameters
# ---------------------------------------------------------------------------------------------------------------------------------------

filename <- "data\\household_power_consumption.txt"
from <- as.Date("2007-02-01")
to <- as.Date("2007-02-02")

# ---------------------------------------------------------------------------------------------------------------------------------------
#   load Energy Data
# ---------------------------------------------------------------------------------------------------------------------------------------

# load the energy data
energy <- read.delim(filename, sep = ";", na.strings="?")
    
# convert Date & Time columns from strings to Date & Time objects
energy$Time = strptime(paste(energy$Date, energy$Time), "%d/%m/%Y %H:%M:%S")
energy$Date = as.Date(energy$Date, "%d/%m/%Y")
    
# filter data to specified date range
energy <- subset(energy, (energy$Date >= from) & (energy$Date <= to))

# ---------------------------------------------------------------------------------------------------------------------------------------
#   open plot3.png (480px x 480px image), publish plot, close file
# ---------------------------------------------------------------------------------------------------------------------------------------

png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(x = energy$Time, y = energy$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(x = energy$Time, y = energy$Sub_metering_2, col = "red")
lines(x = energy$Time, y = energy$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(2.5, 2.5), col = c("black", "red", "blue"))

dev.off()

