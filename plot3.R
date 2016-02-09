# get data from file
dataFile <- "./household_power_consumption.txt"
df <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# subset for two days and omit NA's
df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
df <- na.omit(df)

# make date and time easier to work with
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(df$Sub_metering_1)
sm2 <- as.numeric(df$Sub_metering_2)
sm3 <- as.numeric(df$Sub_metering_3)

# make the desired plot
plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

#copy the plot to a png file
dev.copy(png, "plot3.png")
dev.off()

