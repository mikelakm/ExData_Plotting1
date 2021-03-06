setwd("Exploratory Data Analysis/Course Projects/Course Project 1")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?", stringsAsFactors=FALSE)
data[10] <- paste(data$Date, data$Time, sep=" ")  # concatenate Date and Time into a new column
colnames(data)[10] <- "DateTime"	# Rename new column to DateTime
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")	# Convert DateTime from character to date (POSIXlt class)
seldata <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02", ]	# Select dates between 2007-02-01 and 2007-02-02

# create plot3.png
png(file="plot3.png", width=480, height=480)
par(bg="transparent")
plot(seldata$DateTime, seldata$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
points(seldata$DateTime, seldata$Sub_metering_2, type="l", col="red")
points(seldata$DateTime, seldata$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()