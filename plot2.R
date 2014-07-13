
plot2 <- function() {

Sys.setlocale("LC_TIME", "C")

#read the Data
data <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, sep=";", dec=".", na.strings = "?")
#Subset the data on the wanted dates
data <- data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
data$DT <- strptime(paste(data[,1], data[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")


#open graphics device PNG
png(file="plot2.png")

#plot construction
plot(data$DT, data$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")



#close graphics device, save png file
dev.off()


}