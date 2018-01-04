#Load file from workding directory
#note that ';' delimiter is set, ?'s are converted to NA, and only data for Feb 1 2007 and Feb 2 2007 is selected
power <- subset(read.csv("household_power_consumption.txt", sep=";", na.strings="?"), Date == "1/2/2007" | Date == "2/2/2007")

#set output
png("plot1.png")


hist(power$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power"
     )

#cleanup
remove(power)
dev.off(dev.cur())