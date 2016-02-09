setwd("C:/3_BigData/01. Coursera/C4/W1")
edata=read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)
edata$Date=as.Date(edata$Date, "%d/%m/%Y")
edata=edata[edata$Date %in% as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d"),]
edata$Time2=strptime(paste(edata$Date, edata$Time), format="%Y-%m-%d %H:%M:%S")

windows(width=4.8, height=4.8, xpinch=100, ypinch=100)
plot(edata$Time2, as.numeric(edata$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(edata$Time2, as.numeric(edata$Sub_metering_2), col="red")
lines(edata$Time2, as.numeric(edata$Sub_metering_3), col="blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)
dev.copy(png, file = "plot3.png")
dev.off()
