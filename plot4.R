energy.data <- read.table("~/Documents/Data Course/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

energy.data[,1] <-as.Date(energy.data[,1], format = "%d / %m /%Y")
subset <- filter(energy.data, Date >= "2007-02-01" & Date < "2007-02-03")
subset$newdate <- with(subset, as.POSIXct(paste(Date, Time),format="%Y-%m-%d %H:%M:%S"))
subset$datetime <- strptime(subset$newdate, "%Y-%m-%d %H:%M:%S")


png(filename ="plot4.png", width = 480,  height = 480, units ="px")
par(mfrow=c(2,2))
plot(subset$datetime, subset$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab= "Day")
axis(side =1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

plot(subset$datetime, subset$Voltage, type="l", ylab="Voltage", xlab= "Day")
axis(side =1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

plot(subset$datetime, subset$Sub_metering_1, type="l", col= "black", ylab="Energy submetering", xlab="Day")
axis(side =1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
lines(subset$datetime, subset$Sub_metering_2, col = "red")     
lines(subset$datetime, subset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red","blue"))

plot(subset$datetime, subset$Global_reactive_power, type="l", ylab="Global reactive power", xlab= "Day")
axis(side =1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))


dev.off()
