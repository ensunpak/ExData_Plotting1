# Download the project data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power.zip", method = "curl")
unzip("household_power.zip")

# Assign the data set into a variable
#data <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", check.names = F, stringsAsFactors =  F, comment.char = "", quote = '\"')

# Subset data to range of 2007-02-01 and 2007-02-02 only
data_sub <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

# Change Date format from character to date and create new datetime variable in dataset
data_sub$Date <- as.Date(data_sub$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$datetime <- as.POSIXct(datetime)

# Plot histogram of global active power
windows()
with(data_sub, plot(Global_active_power ~ datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Print the plot into the png file with dimension 480H x 480W
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()