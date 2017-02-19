energy.data <- read.table("~/Documents/Data Course/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

energy.data[,1] <-as.Date(energy.data[,1], format = "%d / %m /%Y")
subset <- filter(energy.data, Date >= "2007-02-01" & Date < "2007-02-03")
subset$newdate <- with(subset, as.POSIXct(paste(Date, Time),format="%Y-%m-%d %H:%M:%S"))
subset$datetime <- strptime(subset$newdate, "%Y-%m-%d %H:%M:%S")

png(filename ="plot2.png", width = 480,  height = 480, units ="px")
plot(subset$datetime, subset$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab= "Day")
axis(side =1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()
