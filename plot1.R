#Read in Data
temp_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#Subset data to dates
data <- temp_data[temp_data$Date == "1/2/2007" | temp_data$Date == "2/2/2007", ]

# Remove unwated large data from memory
temp_data <- NULL

#initailiza png device 
png("plot1.png", width = 480, height = 480, units = "px")

#Make Historgram - no Axis lables
hist(data$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     axes = FALSE,
     breaks = 12, 
     )

#Add axis 
axis(1, seq(0,6, by = 2))
axis(2, seq(0, 1200, by = 200))

dev.off()