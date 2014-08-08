## Get the classes of each field from the data by getting first 5 rows
first5Rows <- read.table('household_power_consumption.txt', 
                         header = TRUE, sep=';', nrows = 5 )
classes <- sapply(first5Rows, class)

## Read entire data
dat <- read.table('household_power_consumption.txt', sep =';', header = TRUE, 
                  colClasses = classes, na.strings=c('','.','NA', '?'))

## Subseting the data on date 2/2/2007 and 1/2/2007
data <- subset(dat, Date == "2/2/2007" | Date == "1/2/2007")

## Open the graphic device
png(filename = "plot1.png", width = 480, height = 480)

## Draw histogram with color red
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab= "Global Active Power (kilowatts)", ylab = "Frequency")
## Turn off the device
dev.off()