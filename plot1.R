rawPowerData <- read.csv("C:/Users/JohnSc/Google Drive/R_Data/household_power_consumption.txt", sep=";")
rawPowerData$Date <- as.Date(rawPowerData$Date, format = "%d/%m/%Y")
rawPowerData$Time <- strptime(rawPowerData$Time, format = "%H:%M:%S")
powerData <- rawPowerData[rawPowerData$Date >= "2007-02-01" & rawPowerData$Date <= "2007-02-02",]
powerData$Global_active_power <- as.numeric(levels(powerData$Global_active_power))[powerData$Global_active_power]
png(filename = "plot1.png", width = 480, height = 480)
hist(powerData$Global_active_power, main ="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red3", ylim = c(0,1200))
dev.off()