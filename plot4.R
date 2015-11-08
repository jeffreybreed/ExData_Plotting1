# ---------------------------------------------------------------------------------------------------------------------------------------
#   File:    plot4.R
#   Author:  Jeffrey Reed
#   Purpose: Generate plot4.png containing a series of plots
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
#   open plot4.png (480px x 480px image), publish plots, close file
# ---------------------------------------------------------------------------------------------------------------------------------------

png(filename = "plot4.png", width = 480, height = 480, units = "px")

# create a 2-by-2 grid and fill columns top-to-bottom, left-to-right
par(mfcol = c(2, 2), mar = c(5, 5, 1, 1)) 

    # ----------------------------------------------------------
    # 1 (upper left): Global Active Power by Day
    # ----------------------------------------------------------
    plot(x=energy$Time, y=energy$Global_active_power, type="l", xlab="", ylab="Global Active Power")
    
    # ----------------------------------------------------------
    # 2 (lower left): Energy Sub Metering
    # ----------------------------------------------------------
    plot(x = energy$Time, y = energy$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
    lines(x = energy$Time, y = energy$Sub_metering_2, col = "red")
    lines(x = energy$Time, y = energy$Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(2.5, 2.5), col = c("black", "red", "blue"), bty="n")
    
    # ----------------------------------------------------------
    # 3 (upper right): Voltage by Day
    # ----------------------------------------------------------
    plot(x=energy$Time, y=energy$Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    # ----------------------------------------------------------
    # 4 (lower right): Global Reactive Power by Day
    # ----------------------------------------------------------
    plot(x=energy$Time, y=energy$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()