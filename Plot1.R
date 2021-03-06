#Load data
datos=read.delim("household_power_consumption.txt",header=TRUE,sep=";")
str(datos)

#Format Date

datos$Date<-as.Date(datos$Date,format="%d/%m/%Y")


#Creating Subset 01Feb2007 & 02Feb2007
datos2=subset.data.frame(datos,datos$Date=="2007/02/01"|datos$Date=="2007/02/02")

#DateTime
datos2$DateTime = paste(datos2$Date,datos2$Time)

library(lubridate)

datos2$DateTime = ymd_hms(datos2$DateTime)

str(datos2)

#Format Variables
datos2$Global_active_power=as.numeric(as.character(datos2$Global_active_power))
datos2$Global_reactive_power = as.numeric(as.character(datos2$Global_reactive_power))
datos2$Voltage = as.numeric(as.character(datos2$Voltage))
datos2$Global_intensity = as.numeric(as.character(datos2$Global_intensity))
datos2$Sub_metering_1 = as.numeric(as.character(datos2$Sub_metering_1))
datos2$Sub_metering_2 = as.numeric(as.character(datos2$Sub_metering_2))
datos2$Sub_metering_3 = as.numeric(as.character(datos2$Sub_metering_3))




#Histogram
hist(datos2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.copy(png, file="Plot1.png", width=480, height=480)
dev.off()
