
raw.data <- read.table("household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE,header=T,col.names=c("Date","Time","Gactive_power","Greactive_power", "Voltage", "Gintensity","metering1","metering2","metering3"))

raw.data$Date <- as.Date(raw.data$Date,"%d/%m/%Y")

library("dplyr") 
data <- raw.data %>% filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

Plot 2
 
data$Time <- strptime(data$Time,"%H:%M:%S") 
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
data$Gactive_power <- as.numeric(as.character(data$Gactive_power))

png("plot2.png", width=480, height=480)

plot(data$Gactive_power,data$time,ylab ="Global Active Power (Kilowatts)",xlab="", main="Global Active Power Vs Time", type="l")
 
 dev.off()