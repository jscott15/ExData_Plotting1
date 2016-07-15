rawPowerData <- read.csv("C:/Users/JohnSc/Google Drive/R_Data/household_power_consumption.txt", sep=";")
rawPowerData$Date <- as.Date(rawPowerData$Date, format = "%d/%m/%Y")
rawPowerData$Time <- strptime(rawPowerData$Time, format = "%H:%M:%S")
powerData <- rawPowerData[rawPowerData$Date >= "2007-02-01" & rawPowerData$Date <= "2007-02-02",]
powerData$Global_active_power <- as.numeric(levels(powerData$Global_active_power))[powerData$Global_active_power]
powerData$Sub_metering_1 <- as.numeric(levels(powerData$Sub_metering_1))[powerData$Sub_metering_1]
powerData$Sub_metering_2 <- as.numeric(levels(powerData$Sub_metering_2))[powerData$Sub_metering_2]

png(filename = "plot3.png", width = 480, height = 480)

# draw blank plot, then add lines
plot(1, type="n", xlab="", ylab="Energy sub metering", xlim=c(0, 2900), ylim=c(0, 37), xaxt = "n")
lines(powerData$Sub_metering_1)
lines(powerData$Sub_metering_2, col = "red")
lines(powerData$Sub_metering_3, col = "blue")

# add annotation and legend
label <- c("Thu", "Fri", "Sat")
ticks <- c(0, 1450, 2900)
axis(side = 1, at = ticks, labels = label, tck = -.05)
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = leg.txt, lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()