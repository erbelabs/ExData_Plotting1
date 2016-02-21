# Exploratory Data Analysis
# Author : rudibahtiar@gmail.com
# Project 1
# Plot1
#################################

# run LoadData.R

source("LoadData.R");
require("graphics");

# Parameters used in PNG files
# the plot will be in 480 x 480 pixels and transparent background
png_filename <- "plot1.png"
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

# Create a Histogram of Global Active Power
hist(hpc_filtered$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Save PNG file
dev.off(which = dev.cur())
