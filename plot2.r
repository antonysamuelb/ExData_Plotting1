# Wk1 - Project - Plot #2

# file has been downloaded and un-zipped using plot1.r script

# the unzipped text file was manually inspected to find the line number of the 
# required date. 

hpcDF <- read.table("household_power_consumption.txt", skip = 66637,
                    nrows = 2880, sep = ";", na.strings = "?")

hpcDF$dateTime <- strptime(paste(hpcDF$V1,hpcDF$V2),"%d/%m/%Y %H:%M:%S")

# plot 2: Global Active Power vs Time period

png("plot2.png", width = 480, height = 480, units = "px")
plot(hpcDF$dateTime, hpcDF$V3, xlab = "", 
     ylab =  "Global Active Power, (Kilowatts)", type = "l")
dev.off()
