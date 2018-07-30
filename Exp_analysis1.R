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


#Plot 1
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

