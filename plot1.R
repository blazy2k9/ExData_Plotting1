#Load Data and convert missing values to NA
data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE, na.strings="?")

#Filter out irrelevant rows
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', ]
head(data)

#Construct the DateTime Column
data$DateTime <- paste(data$Date, data$Time, sep = " ")

#Construct the Date/Time variables to Date/Time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.off()