path <- "~/Documents/Coursera Data Science/04 Exploratory Data Analysis/ExData_Plotting1/"

# Read the data file.
data <- read.csv(file = paste(path, "data/household_power_consumption.txt", sep = ""), 
                 sep = ";",
                 na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Filter data to February 1-2, 2007.
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
datetime <- strptime(paste(data$Date, data$Time), 
                     format = "%d/%m/%Y %T")

# Construct a 2 x 2 grid of plots. Save to png.
png(filename = paste(path, "plot4.png", sep = ""),
    width = 480,
    height = 480,
    units = "px")
par(mfrow = c(2,2))

# Top left plot: Global active power over time.
plot(datetime,
     data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Top right plot: Voltage over time.
plot(datetime,
     data$Voltage,
     type = "l",
     ylab = "Voltage")

# Bottom left plot: Energy sub metering over time.
plot(datetime,
     data$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright",
       bty = "n",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom right plot: Global reactive power over time.
plot(datetime,
     data$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power")

dev.off()
