
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
 
#plots
 plot(datetime, data1$Sub_metering_1, type="l", xlab="", ylab= "Energy sub metering") 
 lines(datetime, data1$Sub_metering_2, col ="red")
 lines(datetime, data1$Sub_metering_3, col="blue")
 legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", 
      "Sub_metering_3  "),lty=1, bty="n", cex=.5) 
 #bty removes the box, cex shrinks the text, spacing added after labels so it renders 
 #correctly 
 dev.copy(png, file="plot3.png", width=480, height=480)
 dev.off()