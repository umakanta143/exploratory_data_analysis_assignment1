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


#plot3
data$Datetime <- as.POSIXct(data$Datetime)

plot(data$Sub_metering_1 ~ data$Datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")

lines(data$Sub_metering_2 ~ data$Datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$Datetime, col = "Blue")
#add legends
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()