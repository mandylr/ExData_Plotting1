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
(png("plot2.png", width = 480, height = 480, units = "px")

#Set the plot
plot(data$datetime, data$Global_active_power, 
     type = "l", 
     xlab = '',
     ylab = "Global Active Power (kilowatts)"
    )

#Close device
dev.off()