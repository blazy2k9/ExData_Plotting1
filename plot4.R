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

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
points(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', 'red', 'blue'), lty = c(1, 1, 1), bty = "n", cex = 0.95)

plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()