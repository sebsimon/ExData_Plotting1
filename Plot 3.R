
raw.data <- read.table("household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE,header=T,col.names=c("Date","Time","Gactive_power","Greactive_power", "Voltage", "Gintensity","metering1","metering2","metering3"))

raw.data$Date <- as.Date(raw.data$Date,"%d/%m/%Y")

library("dplyr") 
data <- raw.data %>% filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

Plot 3

data$Time <- strptime(data$Time,"%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
data$metering1 <- as.numeric(data$metering1)
data$metering2 <- as.numeric(data$metering2)
data$metering3 <- as.numeric(data$metering3)

png("Plot3.png", width=480, height=480)
 	
plot(data$Time, data$metering1, ylab=" Energy sub Metering",xlab="",type="l")
points(data$Time, data$metering2,col="red",type="l")
points(data$Time, data$metering3,col="blue",type="l")
 
legend("topright",lty=1, col=c("black", "red","blue"),legend=c("metering 1","metering 2","metering 3"))

dev.off()