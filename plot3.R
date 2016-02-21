# Exploratory Data Analysis
# Author : rudibahtiar@gmail.com
# Project 1
# Plot3
#################################

# run LoadData.R

source("LoadData.R");
require("graphics");

# Parameters used in PNG files
# the plot will be in 480 x 480 pixels and transparent background
png_filename <- "plot3.png"
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

# Create a Plot of Energy Sub metering
plot(hpc_filtered$DateTime,
     hpc_filtered$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy Sub metering")

# Create a line of Energy sub metering 2
lines(hpc_filtered$DateTime,
      hpc_filtered$Sub_metering_2,
      col = "red")

# Create a line of Energy sub metering 3
lines(hpc_filtered$DateTime,
      hpc_filtered$Sub_metering_3,
      col = "blue")

# Create a plot legend
legend("topright",
       col = c("black","red","blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)


# Save PNG file
dev.off(which = dev.cur())

