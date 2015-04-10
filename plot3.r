## Getting full dataset
data_full <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      stringsAsFactors=F)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3 - plot sub_metering_1
plot(data$Sub_metering_1~data$Datetime,type="l", ylab="Energy sub metering", 
     xlab="")
## plot sub_metering 2 and 3
lines(data$Sub_metering_2~data$Datetime, col = "Red")
lines(data$Sub_metering_3~data$Datetime, col = "Blue")

## add legend
legend("topright", col=c("black", "red", "blue"), lty=1,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()