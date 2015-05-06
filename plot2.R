### PLOT 2

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
fdat$Global_active_power <- as.numeric(fdat$Global_active_power)

## 3. Plot data
png("plot2.png", width = 480, height = 480)
plot(fdat$DateTime, fdat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()