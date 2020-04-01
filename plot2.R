library(dplyr)
library(lubridate)

# Load the util script which downloads the data file, read the contents and 
# apply the filter.
source("util.R")

# Join the values from Date and Time and convert to a date object
data <- mutate(data, DT = dmy_hms(paste(Date, Time)))
png("plot2.png")
# Create the graphic
with(data, plot(DT, Global_active_power,  type = "l", lwd = 0.3,
                ylab = "Global Active Power (killowatts)", xlab=""))
dev.off()

