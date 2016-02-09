setwd("C:/3_BigData/01. Coursera/C4/W1")
edata=read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)
edata$Date=as.Date(edata$Date, "%d/%m/%Y")
edata=edata[edata$Date %in% as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d"),]
windows(width=4.8, height=4.8, xpinch=100, ypinch=100)
hist(as.numeric(edata$Global_active_power),col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
