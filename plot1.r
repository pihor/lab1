
#PLOT 1

# Data reading
dataframe <- read.csv("E:/RStudio/lab5/household_power_consumption.txt", header=TRUE, dec=".",sep=";")

# Clear all fields with "?"
cleanframe <- dataframe[apply(dataframe, 1, function(row) {all(!('?' %in% row))}),]

# Convert factor to numeric, factor to Date
cleanframe$Global_active_power = as.numeric(levels(cleanframe$Global_active_power))[cleanframe$Global_active_power]
cleanframe$Date = as.Date(cleanframe$Date, format = "%d/%m/%Y")

plotdata <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Global_active_power"]

# Draw hist
hist(plotdata, col="red", xlab="Global Active Pover (kilowatts)", main="Global Active Pover")
# Save image
dev.copy(device = png, filename = 'E:/RStudio/lab5/first.png', width = 480, height = 480)
dev.off ()


