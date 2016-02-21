# Exploratory Data Analysis
# Author : rudibahtiar@gmail.com
# Project 1
# Load and preprocess data
#################################

# Set Current Working Directory
setwd("/Users/rudibahtiar/Documents/Rudi/COURSERA/Exploratory Data Analysis/workspace/project1")
require(utils);

# Create necessary folders
if(!file.exists("data")) dir.create("data")
if(!file.exists("graphic")) dir.create("graphic")

# Download the dataset into data folder
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists("./data/household_power_consumption.zip")) {
    download.file(URL, 
                  destfile = "./data/household_power_consumption.zip", 
                  method = "curl", 
                  mode = "wb", 
                  quiet = TRUE)
}

# Extract the dataset file
unzip("data/household_power_consumption.zip", list = FALSE, overwrite = TRUE, exdir = "data")

# Read the dataset file
hpc_file <- "./data/household_power_consumption.txt"
hpc <- read.table(hpc_file, 
                  header = TRUE, 
                  sep = ";", 
                  colClasses = c("character","character", rep("numeric", 7)), 
                  na.strings = "?")

# Show data dimension
#   [1] 2075259       9
dim(hpc)

# Format data for filter purpose

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# One alternative is to read the data from just those dates 
#   rather than reading in the entire dataset and subsetting to those dates.

# hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc_filtered <- subset(hpc, (hpc$Date=="1/2/2007") | (hpc$Date=="2/2/2007"))

# You may find it useful to convert the Date and Time variables 
#   to Date/Time classes in R using the 𝚜𝚝𝚛𝚙𝚝𝚒𝚖𝚎()  and 𝚊𝚜.𝙳𝚊𝚝𝚎() functions.
hpc_filtered$DateTime <- strptime(
    paste(hpc_filtered$Date, hpc_filtered$Time), 
    "%d/%m/%Y %H:%M:%S")
