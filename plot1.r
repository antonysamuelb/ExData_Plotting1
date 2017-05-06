# Wk1 - Project

# Download and Unzip files.

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "housePowerConsumpton.zip")
unzip("housePowerConsumpton.zip")

# the unzipped text file was manually inspected to find the line number of the 
# required date. If an alternative method is known to automatically detect it
# please share it in your feed back.

hpcDF <- read.table("household_power_consumption.txt", skip = 66637,
                    nrows = 2880, sep = ";", na.strings = "?")

# plot 1: Global Active Power's frequency

png("plot1.png", width = 480, height = 480, units = "px")
hist(hpcDF$V3, xlab = "Global Active Power, (Kilowatts)",
     ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()