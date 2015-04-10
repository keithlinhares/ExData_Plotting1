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

### All the plots

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(data$Global_active_power~data$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
plot(data$Voltage~data$Datetime, type="l", 
     ylab="Voltage (volt)", xlab="")
plot(data$Sub_metering_1~data$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Sub_metering_2~data$Datetime,col='Red')
lines(data$Sub_metering_3~data$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Global_reactive_power~data$Datetime, type="l", 
     ylab="Global Rective Power (kilowatts)",xlab="")
dev.off()