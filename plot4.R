# Exploratory Data Analysis
# Author : rudibahtiar@gmail.com
# Project 1
# Plot4
#################################

# run LoadData.R

source("LoadData.R");
require("graphics");

# Parameters used in PNG files
# the plot will be in 480 x 480 pixels and transparent background
png_filename <- "plot4.png"
png_width <- 480
png_height <- 480
png_unit <- "px"
png_bg <- "transparent"

# Create a PNG file
png(filename = png_filename,
    width = png_width,
    height = png_height,
    units = png_unit,
    bg = png_bg)

# Set Graphic Parameter to show 4 plots
par(mfrow = c(2,2))

# Top-Left graphic
plot(hpc_filtered$DateTime,
     hpc_filtered$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Top-Right graphic
plot(hpc_filtered$DateTime,
     hpc_filtered$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Bottom-Left graphic
plot(hpc_filtered$DateTime,
     hpc_filtered$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy Sub metering")

lines(hpc_filtered$DateTime,
      hpc_filtered$Sub_metering_2,
      col = "red")

lines(hpc_filtered$DateTime,
      hpc_filtered$Sub_metering_3,
      col = "blue")

legend("topright",
       col = c("black","red","blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)


# Bottom-Right graphic
plot(hpc_filtered$DateTime,
     hpc_filtered$Global_reactive_power,
     type = "l",
     col = "black",
     xlab = "datetime",
     ylab = colnames(hpc_filtered)[4])


# Save PNG file
dev.off(which = dev.cur())

