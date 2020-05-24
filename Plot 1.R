
raw.data <- read.table("household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE,header=T,col.names=c("Date","Time","Gactive_power","Greactive_power", "Voltage", "Gintensity","metering1","metering2","metering3"))

raw.data$Date <- as.Date(raw.data$Date,"%d/%m/%Y")

library("dplyr") 
data <- raw.data %>% filter(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

 Plot 1

data$Gactive_power <- as.numeric(as.character(data$Gactive_power))

png("plot1.png", width=480, height=480)

hist(data$Gactive_power,col="red", xlab ="Global Active Power (Kilowatts)", main="Global Active Power")
 
