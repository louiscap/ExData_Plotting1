# here is the R file to produce the first plot
# download and unzip, then save the file in the same directory
# read the file into df
df <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# subset to only two days as specified, and remove rows with NA if any
sdf <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
cdf <- na.omit(sdf)
# make the plot as specified
hist(cdf$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
# copy current plot to png file
dev.copy(png, "plot1.png")
dev.off()

