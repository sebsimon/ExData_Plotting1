raw.data <- read.table("household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE,header=T,col.names=c("Date","Time","Gactive_power","Greactive_power", "Voltage", "Gintensity","metering1","metering2","metering3"))

raw.data$Date <- as.Date(raw.data$Date,"%d/%m/%Y")

library("dplyr") 
data <- raw.data %>% filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

Plot 4 
 
data$Time <- strptime(data$Time,"%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
data$Gactive_power <- as.numeric(as.character(data$Gactive_power))
data$Voltage <- as.numeric(data$Voltage)
data$Greactive_power <- as.numeric(data$Greactive_power)
data$metering1 <- as.numeric(data$metering1)
data$metering2 <- as.numeric(data$metering2)
data$metering3 <- as.numeric(data$metering3)

png("Plot4.png", width=480, height=480) 	
par(mfcol=c(2,2), mar=c(2,2,1,1)) 
with(data, {
	plot(Time,Gactive_power, ylab ="Global Active Power (Kilowatts)",xlab="", type="l")
 	plot(Time,metering1, ylab=" Energy sub Metering",xlab="",type="l")
	points(Time,metering2,col="red",type="l")
	points(Time,metering3,col="blue",type="l")
 	legend("topright",lty=1, col=c("black", "red","blue"),legend=c("metering 1","metering 2","metering 3"))
 	plot(Time, Voltage, ylab ="Voltage",xlab="datetime",type="l")
 	plot(Time, Greactive_power, ylab ="Global_reactive_power",xlab="datetime",type="l")
 	})
 dev.off()	
 