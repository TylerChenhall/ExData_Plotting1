path <- "~/Documents/Coursera Data Science/04 Exploratory Data Analysis/ExData_Plotting1/"

# Read the data file.
data <- read.csv(file = paste(path, "data/household_power_consumption.txt", sep = ""), 
                 sep = ";",
                 na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Filter data to February 1-2, 2007.
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Construct a histogram of Global Active Power with red bars. Save to png.
png(filename = paste(path, "plot1.png", sep = ""),
    width = 480,
    height = 480,
    units = "px")
hist(data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
