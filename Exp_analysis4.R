setwd("C:/Users/usahoo/Desktop/coursera/module 4/dataset")

## loading the data
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# convert the date variable to Date class
data$Date<-as.Date(data$Date,format="%d/ %m /%Y")

#Subsetting the data

data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Datetime field creation
data$Datetime<-strptime(paste(data$Date,data$Time),format = "%Y-%m-%d %H:%M:%S")


#plot4
data$Datetime <- as.POSIXct(data$Datetime)
par(mfrow = c(2, 2))

plot(data$Global_active_power ~ data$Datetime,type="l",ylab="Global_active_power",xlab="")


plot(data$Voltage ~ data$Datetime, type = "l",ylab = "Voltage")

plot(data$Sub_metering_1 ~ data$Datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")

lines(data$Sub_metering_2 ~ data$Datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$Datetime, col = "Blue")
#add legends
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.5)
plot(data$Global_reactive_power ~ data$Datetime, type = "l",ylab = "Global_reactive_power",xlab="")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()