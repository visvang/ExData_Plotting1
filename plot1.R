### PLOT 1


## 1. Read data
library(data.table)
aldat <- fread("household_power_consumption.txt", na.strings = "?")
fdat <- aldat[aldat[, Date %in% c("1/2/2007", "2/2/2007")]]         # filter dataset for two days 
rm(aldat)                                                           # remove large dataset from memory 


## 2. Transform data
fdat$Global_active_power <- as.numeric(fdat$Global_active_power)


## 3. Plot
png("plot1.png", width = 480, height = 480)
hist(fdat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
