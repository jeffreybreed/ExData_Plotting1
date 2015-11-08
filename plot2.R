# ---------------------------------------------------------------------------------------------------------------------------------------
#   File:    plot2.R
#   Author:  Jeffrey Reed
#   Purpose: Generate plot2.png line graph for Global Active Power by day
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
#   open plot2.png (480px x 480px image), publish plot, close file
# ---------------------------------------------------------------------------------------------------------------------------------------

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(x=energy$Time, y=energy$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()