
library(dplyr)
library(tidyr)
#library(data.table)

#set working directory, creat directory, and record date
 setwd("~/R/UCI")
 downloadDate<-date()

 #read data file from R working directory
 if(!file.exists("./data1")) {
 data1<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
 }
 
#correct date, time formats, filter selected days for study out 
 data1$Date<-as.Date(data1$Date, "%d/%m/%Y")
 data1<-data1[(data1$Date>="2007-02-01" & data1$Date<="2007-02-02"),]
 datetime <- as.POSIXct(paste(data1$Date, data1$Time))
 
par(mfrow=c(2,2))

#plot 1
 GP<-as.numeric(data1$Global_active_power)
 plot(datetime, GP, type="l", xlab="", ylab= "Global Active Power (kilowatts)")

#plot2
 plot(datetime, data1$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
#plot 3
 plot(datetime, data1$Sub_metering_1, type="l", xlab="", ylab= "Energy sub metering") 
 lines(datetime, data1$Sub_metering_2, col ="red")
 lines(datetime, data1$Sub_metering_3, col="blue")
 legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", 
        "Sub_metering_3  "),lty=1, bty="n", cex=.5) 
 
#plot 4
 plot(datetime, data1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
 
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
