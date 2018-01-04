#Load file from workding directory
#note that ';' delimiter is set, ?'s are converted to NA, and only data for Feb 1 2007 and Feb 2 2007 is selected
power <- subset(read.csv("household_power_consumption.txt", sep=";", na.strings="?"), Date == "1/2/2007" | Date == "2/2/2007")

#convert date and time to POSIX calendar
power$Date.Time <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

#set output
png(filename = "plot2.png", 
    width = 480, 
    height = 480
    )

plot(x = power$Date.Time, 
     y = power$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
     
     )

#cleanup
remove(power)
dev.off(dev.cur())