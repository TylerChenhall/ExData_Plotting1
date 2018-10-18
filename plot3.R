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

# Construct overlaid line graphs of the 3 sub meters. Save to png.
png(filename = paste(path, "plot3.png", sep = ""),
    width = 480,
    height = 480,
    units = "px")

plot(datetime,
     data$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
