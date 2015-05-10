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
png("plot3.png", width = 480, height = 480, units = "px")
 
 #Set the plot with 3 lines
 plot(data$datetime, data$Sub_metering_1, 
      type = "l", 
      xlab = "",
      ylab = "Energy sub metering",
      col = "black"
    )
 #add sub 2 and 3
 lines(data$datetime, data$Sub_metering_2, col = "red")
 lines(data$datetime, data$Sub_metering_3, col = "blue")
 
#add legend to topright corner
 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lty = c(1, 1, 1),
        col = c("black", "red", "blue"))
 
#Close device 
 dev.off()