download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="consume.zip", method="curl")
unzip ("consume.zip", exdir = "./")

alldata <- read.delim("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
mydata = alldata[alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007",]
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
dateTime <- paste(mydata$Date, mydata$Time)
mydata$Time <- as.POSIXct(dateTime)
mydata$Date <- format(mydata$Date, "%d")

png(file="plot1.png",
    width=480, height=480)
h <- hist(mydata$Global_active_power, breaks=12, col="red")
dev.off()