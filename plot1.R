# Load the util script which downloads the data file, read the contents and 
# apply the filter.
source("util.R")


png("plot1.png")
hist(data$Global_active_power, ylab = "Frequency", 
     xlab = "Global Active Power (killowatts)", col = "red",
     main = "Global Active Power")
dev.off()
