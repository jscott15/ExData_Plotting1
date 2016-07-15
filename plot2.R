rawPowerData <- read.csv("C:/Users/JohnSc/Google Drive/R_Data/household_power_consumption.txt", sep=";")
rawPowerData$Date <- as.Date(rawPowerData$Date, format = "%d/%m/%Y")
rawPowerData$Time <- strptime(rawPowerData$Time, format = "%H:%M:%S")
powerData <- rawPowerData[rawPowerData$Date >= "2007-02-01" & rawPowerData$Date <= "2007-02-02",]
powerData$Global_active_power <- as.numeric(levels(powerData$Global_active_power))[powerData$Global_active_power]
png(filename = "plot2.png", width = 480, height = 480)
plot(powerData$Global_active_power, type ="l",  xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
label <- c("Thu", "Fri", "Sat")
ticks <- c(0, 1450, 2900)
axis(side = 1, at = ticks, labels = label, tck = -.05)
dev.off()