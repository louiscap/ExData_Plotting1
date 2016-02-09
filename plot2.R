# get data from file
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# subset for two days and omit NA's
subData <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
compSubData <- na.omit(subData)

# make date and time easier to work with
datetime <- strptime(paste(compSubData$Date, compSubData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# make the desired plot
plot(datetime, compSubData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#copy the plot to a png file
dev.copy(png, "plot2.png")
dev.off()


