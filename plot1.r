# read in the file
data <- read.table("./household_power.consumption.txt", header = TRUE, sep = ";")

# Subset the data to dates needed
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Create list of global active power
globalactivepower <- as.numeric(subdata$Global_active_power)

# Create histogram
hist(globalactivepower, main = "Global Active Power", xlab = "Global Active 
     Power (kilowatts)", col = "red")

# Save the image
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()