#Load file from workding directory
#note that ';' delimiter is set, ?'s are converted to NA, and only data for Feb 1 2007 and Feb 2 2007 is selected
power <- subset(read.csv("household_power_consumption.txt", sep=";", na.strings="?"), Date == "1/2/2007" | Date == "2/2/2007")

#convert date and time to POSIX calendar
power$Date.Time <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

#set output
png(filename = "plot3.png",
    width = 480,
    height = 480)

plot(x = power$Date.Time, 
     y = power$Sub_metering_1, 
     type = "l", 
     xlab = "",
     ylab = "Energy Sub Metering")

lines(x = power$Date.Time, 
      y = power$Sub_metering_2, col = "red")

lines(x = power$Date.Time, 
      y = power$Sub_metering_3, col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty =1)

#cleanup
remove(power)
dev.off(dev.cur())