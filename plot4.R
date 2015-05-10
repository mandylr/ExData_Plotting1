#Read in Data
temp_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#Subset data to dates
data <- temp_data[temp_data$Date == "1/2/2007" | temp_data$Date == "2/2/2007", ]

# Remove unwated large data from memory
temp_data <- NULL

#Change date and time columns to POSIXct and add new combined column called datetime

datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$datetime <- datetime

#Open png device
png("plot4.png", width = 480, height = 480, units = "px")

#Make a 2x2 plot layout - fill columns first 
par(mfcol = c(2,2))

#Top left plot - Global Active Power vs datetime
plot(data$datetime, data$Global_active_power, 
     type = "l", 
     xlab = '',
     ylab = "Global Active Power (kilowatts)"
)

#Bottom Left Plot - energy sub metering vs datetime
plot(data$datetime, data$Sub_metering_1, 
     type = "l", 
     xlab = "",
     ylab = "Energy sub metering",
     col = "black"
)

lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       bty = "n")    ## No outline around legend 

#Top Right Plot - Voltage vs datetime
plot(data$datetime, data$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

#Bottom Right Plot - Global reactive power vs datetime
plot(data$datetime, data$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

#Close device
dev.off()