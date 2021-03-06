
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
par(cex = 0.8)
## Setting the PNG device graph
dev.copy(png, "plot3.png")
## Plotting the graph
plot(housetest$Date_Time, housetest$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(housetest$Date_Time, housetest$Sub_metering_2, col = "red")
lines(housetest$Date_Time, housetest$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Turning off the PNG device graph
dev.off()
## Resetting plot graph parameters
par(cex = 1)

