
plot4 <- function() {

Sys.setlocale("LC_TIME", "C")

#read the Data
data <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, sep=";", dec=".", na.strings = "?")
#Subset the data on the wanted dates
data <- data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
data$DT <- strptime(paste(data[,1], data[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")


#open graphics device PNG
png(file="plot4.png")

#plot construction
par(mfrow=c(2,2))

plot(data$DT, data$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")

plot(data$DT, data$Voltage, type='l', xlab="datetime", ylab="Voltage")

plot(data$DT, data$Sub_metering_1, type='n', xlab="", ylab="Energy sub metering")
lines(data$DT, data$Sub_metering_1, col='black')
lines(data$DT, data$Sub_metering_2, col='red')
lines(data$DT, data$Sub_metering_3, col='blue')
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=c(1,1,1), col=c('black','red', 'blue'), bty='n')

plot(data$DT, data$Global_reactive_power, type='l', xlab="datetime", ylab="Global_reactive_power")


#close graphics device, save png file
dev.off()


}