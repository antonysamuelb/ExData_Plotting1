# Wk1 - Project - Plot #3

# file has been downloaded and un-zipped using plot1.r script

# the unzipped text file was manually inspected to find the line number of the 
# required date. 

hpcDF <- read.table("household_power_consumption.txt", skip = 66637,
                    nrows = 2880, sep = ";", na.strings = "?")

hpcDF$dateTime <- strptime(paste(hpcDF$V1,hpcDF$V2),"%d/%m/%Y %H:%M:%S")
# plot 3: Energy Sub metering vs time period

png("plot3.png", width = 480, height = 480, units = "px")

plot(hpcDF$dateTime, hpcDF$V7, xlab = "", 
     ylab =  "Energy sub metering", type = "l", col = "black")
lines(hpcDF$dateTime, hpcDF$V8, col = "red")
lines(hpcDF$dateTime, hpcDF$V9, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
