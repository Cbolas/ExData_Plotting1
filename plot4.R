
## Download and unzip HPC Dataset file
if(!file.exists("exdata-data-household_power_consumption.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata-data-household_power_consumption.zip", mode = "wb")
  }
unzip("exdata-data-household_power_consumption.zip")
  
## Reading the raw Dataset file
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
HPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007"),]
## Adjusting and converting the Date and Time columns
HPC$Date <- paste(HPC$Date, HPC$Time, sep = " ")
HPC$Time <- NULL
colnames(HPC)[1] <- "Date_Time"
HPC$Date_Time <- strptime(HPC$Date_Time, format="%d/%m/%Y %H:%M:%S")
## Setting plot graph parameters
par(mfrow = c(2,2), cex.lab=0.75, cex.axis=0.75, cex.main=0.75, cex.sub=0.75)
## Setting the PNG device graph
dev.copy(png, "plot4.png")
## Plotting the graph 1
plot(housetest$Date_Time, housetest$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
## Plotting the graph 2
plot(housetest$Date_Time, housetest$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
## Plotting the graph 3
plot(housetest$Date_Time, housetest$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(housetest$Date_Time, housetest$Sub_metering_2, col = "red")
lines(housetest$Date_Time, housetest$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75, bty = "n")
## Plotting the graph 4
plot(housetest$Date_Time, housetest$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
## Turning off the PNG device graph
dev.off()
## Resetting plot graph parameters
par(mfrow = c(1,1), cex.lab=1, cex.axis=1, cex.main=1, cex.sub=1)
