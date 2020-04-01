library(dplyr)
library(lubridate)

# Load the util script which downloads the data file, read the contents and 
# apply the filter.
source("util.R")

data <- mutate(data, DT = dmy_hms(paste(Date, Time)))


# Create the png device
png("plot3.png")
# Create the plot with the first submetering
plot(data$DT, data$Sub_metering_1,  type = "l", lwd = 0.3, col = "black", 
        ylab = "Energy sub metering", xlab="")

# Add the line for the second metering
lines(data$DT, data$Sub_metering_2, col = "red")

# Add the line for the third metering
lines(data$DT, data$Sub_metering_3, col = "blue")

# Create the legend
legend("topright", pch = "-", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, cex=0.8)

dev.off()




