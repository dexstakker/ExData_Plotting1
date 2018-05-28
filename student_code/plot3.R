download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="consume.zip", method="curl")
unzip ("consume.zip", exdir = "./")

alldata <- read.delim("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
mydata = alldata[alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007",]
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
dateTime <- paste(mydata$Date, mydata$Time)
mydata$Time <- as.POSIXct(dateTime)
mydata$Date <- format(mydata$Date, "%d")
png(file="plot3.png",
    width=480, height=480)

plot(mydata$Time, mydata$Sub_metering_1, type="l",ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
lines(mydata$Time, mydata$Sub_metering_2, col="red")
lines(mydata$Time, mydata$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
dev.off()