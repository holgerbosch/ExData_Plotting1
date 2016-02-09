setwd("C:/3_BigData/01. Coursera/C4/W1")
edata=read.table("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)
edata$Date=as.Date(edata$Date, "%d/%m/%Y")
edata=edata[edata$Date %in% as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d"),]
edata$Time2=strptime(paste(edata$Date, edata$Time), format="%Y-%m-%d %H:%M:%S")

windows(width=4.8, height=4.8, xpinch=100, ypinch=100)
plot(edata$Time2, as.numeric(edata$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()
