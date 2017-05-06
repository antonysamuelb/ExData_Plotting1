# Wk1 - Project - Plot #4

# file has been downloaded and un-zipped using plot1.r script

# the unzipped text file was manually inspected to find the line number of the 
# required date. 

hpcDF <- read.table("household_power_consumption.txt", skip = 66637,
                    nrows = 2880, sep = ";", na.strings = "?")

hpcDF$dateTime <- strptime(paste(hpcDF$V1,hpcDF$V2),"%d/%m/%Y %H:%M:%S")

# plot 4: 4- sub plots 
#           1) Global Active power vs time
#           2) Voltage vs time
#           3) Energy sub metering vs time
#           4) Global reactive power vs time.



png("plot4.png", width = 480, height = 480, units = "px")

# calling par after graphic device has been opened.
par(mfrow = c(2,2), mar = c(4,4,1,1))

# 1
plot(hpcDF$dateTime, hpcDF$V3, xlab = "", 
     ylab =  "Global Active Power, (Kilowatts)", type = "l")
# 2
plot(hpcDF$dateTime, hpcDF$V5, xlab = "datetime", 
     ylab =  "Voltage", type = "l")
#3
plot(hpcDF$dateTime, hpcDF$V7, xlab = "", 
     ylab =  "Energy sub metering", type = "l", col = "black")
lines(hpcDF$dateTime, hpcDF$V8, col = "red")
lines(hpcDF$dateTime, hpcDF$V9, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
plot(hpcDF$dateTime, hpcDF$V3, xlab = "datetime", 
     ylab =  "Global_reactive_power", type = "l")

dev.off()
