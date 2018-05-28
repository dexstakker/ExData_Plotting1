download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="consume.zip", method="curl")
unzip ("consume.zip", exdir = "./")

alldata <- read.delim("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
mydata = alldata[alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007",]
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
dateTime <- paste(mydata$Date, mydata$Time)
mydata$Time <- as.POSIXct(dateTime)
mydata$Date <- format(mydata$Date, "%d")

png(file="plot4.png",
    width=480, height=480)

par(mfrow=c(2,2))
plot(mydata$Time, mydata$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
plot(mydata$Time, mydata$Voltage, type="l", 
     ylab="Voltage (volt)", xlab="", cex=0.8)
plot(mydata$Time, mydata$Sub_metering_1, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
lines(mydata$Time, mydata$Sub_metering_2,col='red')
lines(mydata$Time, mydata$Sub_metering_3,col='blue')
legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
       legend=c("sub 1", "sub 2", "sub 3"), cex=0.5)
plot(mydata$Time, mydata$Global_reactive_power, type="l", 
     ylab="Global Rective Power (kilowatts)",xlab="", cex=0.8)
dev.off()