# get data from file
dataFile <- "./household_power_consumption.txt"
df <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# subset for two days and omit NA's
df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
df <- na.omit(df)

# make date and time easier to work with
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(df$Global_active_power)
grp <- as.numeric(df$Global_reactive_power)
voltage <- as.numeric(df$Voltage)
sm1 <- as.numeric(df$Sub_metering_1)
sm2 <- as.numeric(df$Sub_metering_2)
sm3 <- as.numeric(df$Sub_metering_3)

#set up the plot to contain 4 figures
par(mfrow = c(2, 2)) 

# make first plot
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power", cex = 0.25)
# make second plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# make third plot
plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")
# make fourth plot
plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

#copy the plot to a png file
dev.copy(png, "plot4.png", height = 480, width = 480)
dev.off()

