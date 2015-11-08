# ---------------------------------------------------------------------------------------------------------------------------------------
#   File:    plot1.R
#   Author:  Jeffrey Reed
#   Purpose: Generate plot1.png histogram for Global Active Power
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
#   open plot1.png (480px x 480px image), publish histogram, close file
# ---------------------------------------------------------------------------------------------------------------------------------------

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(
         energy$Global_active_power,
         breaks = 12,
         col = "red",
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)",
         ylab = "Frequency"
    )
dev.off()