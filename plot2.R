
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
 GP<-as.numeric(data1$Global_active_power)
 plot(datetime, GP, type="l", xlab="", ylab= "Global Active Power (kilowatts)")
 
 dev.copy(png, file="plot2.png", width=480, height=480)
 dev.off()