library(dplyr)
library(lubridate)

# Load the util script which downloads the data file, read the contents and 
# apply the filter.
source("util.R")

data <- mutate(data, DT = dmy_hms(paste(Date, Time)))
png("plot4.png")

# set the canvas layout by row
par(mfrow = c(2, 2))
# First graphic
with(data, plot(DT, Global_active_power,  type = "l", lwd = 0.3,
                ylab = "Global Active Power (killowatts)", xlab=""))

# Second graphic
with(data, plot(DT, Voltage,  type = "l", lwd = 0.3,
                ylab = "Voltage", xlab="datetime"))

# Third Graphic
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
       lty=1, cex=0.5, bty = "n")


# Fourth graphic
with(data, plot(DT, Global_reactive_power,  type = "l", lwd = 0.3,
                ylab = "Voltage", xlab="detetime"))

# close the device
dev.off()
