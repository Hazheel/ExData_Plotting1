plot1 <- function() {



#read the Data
data <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, sep=";", dec=".", na.strings = "?")
#Subset the data on the wanted dates
data <- data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]

#open graphics device PNG
png(file="plot1.png")

#plot construction
hist(data$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")



#close graphics device, save png file
dev.off()


}