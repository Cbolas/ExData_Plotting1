
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
dev.copy(png, "plot1.png")
## Plotting the graph
hist(HPC$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## Turning off the PNG device graph
dev.off()
## Resetting plot graph parameters
par(cex = 1)
