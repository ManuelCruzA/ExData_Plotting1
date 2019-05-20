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



par(mfrow=c(2,2))
#Plot1
plot(datos2$DateTime,datos2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#Plot2
plot(datos2$DateTime,datos2$Voltage, type="l", xlab="datetime", ylab="Voltage")
#Plot3
plot(datos2$DateTime,datos2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datos2$DateTime,datos2$Sub_metering_2,col="red")
lines(datos2$DateTime,datos2$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
#Plot4
plot(datos2$DateTime,datos2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#PNG
dev.copy(png, file="Plot4.png", width=480, height=480)
dev.off()
