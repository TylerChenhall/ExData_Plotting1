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

# Construct a line graph of Global Active Power over time. Save to png.
png(filename = paste(path, "plot2.png", sep = ""),
    width = 480,
    height = 480,
    units = "px")
plot(datetime,
     data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
