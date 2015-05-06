### PLOT 3

## 1. Read data
library(data.table)
aldat <- fread("household_power_consumption.txt", na.strings = "?")
fdat <- aldat[aldat[, Date %in% c("1/2/2007", "2/2/2007")]]         # filter dataset for two days 
rm(aldat)                                                           # remove large dataset from memory 


## 2. Transform data
Sys.setlocale("LC_TIME", "English")                                            # need this to have weekdays in English
fdat$DateTime <- paste(fdat$Date, fdat$Time, sep = " ")                        # create new date + time column
fdat$DateTime <- as.POSIXct(fdat$DateTime, format = "%d/%m/%Y %T", tz = "UTC") # transform string to POSIXct
#fdat$Weekday <- weekdays(fdat$DateTime)
fdat$Sub_metering_1 <- as.numeric(fdat$Sub_metering_1, digits = 3)
fdat$Sub_metering_2 <- as.numeric(fdat$Sub_metering_2, digits = 3)
fdat$Sub_metering_3 <- as.numeric(fdat$Sub_metering_3, digits = 3)


## 3. Plot
png("plot3.png", height = 480, width = 480)
plot(fdat$DateTime, fdat$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(fdat$DateTime, fdat$Sub_metering_2, col = "red")
lines(fdat$DateTime, fdat$Sub_metering_3, col = "blue")
legend ("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

