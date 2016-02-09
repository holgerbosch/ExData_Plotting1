setwd("C:/3_BigData/01. Coursera/C4/W1")
edata=read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)
edata$Date=as.Date(edata$Date, "%d/%m/%Y")
edata=edata[edata$Date %in% as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d"),]
edata$Time2=strptime(paste(edata$Date, edata$Time), format="%Y-%m-%d %H:%M:%S")

windows(width=4.8, height=4.8, xpinch=100, ypinch=100)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

## top left plot
plot(edata$Time2, as.numeric(edata$Global_active_power), type="l", xlab="", ylab="Global Active Power")

## top right plot
plot(edata$Time2, as.numeric(edata$Voltage), type="l", xlab="datetime", ylab="Voltage")

## bottom left plot
plot(edata$Time2, as.numeric(edata$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(edata$Time2, as.numeric(edata$Sub_metering_2), col="red")
lines(edata$Time2, as.numeric(edata$Sub_metering_3), col="blue")
legend("topright", box.lwd="white", xjust = 0.05, yjust = 0.95, lwd = 1, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)

## bottom right plot
plot(edata$Time2, as.numeric(edata$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()
