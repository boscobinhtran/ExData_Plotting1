## Get the classes of each field from the data by getting first 
first5Rows <- read.table('household_power_consumption.txt', 
                         header = TRUE, sep=';', nrows = 5 )
classes <- sapply(first5Rows, class)

## Read entire data
dat <- read.table('household_power_consumption.txt', sep =';', header = TRUE, 
                  colClasses = classes, na.strings=c('','.','NA', '?'))

## Subseting the data on date 2/2/2007 and 1/2/2007
data <- subset(dat, Date == '2/2/2007' | Date == '1/2/2007')

## Adding a DateTime field by combining Date and Time fields

data <- cbind(data, DateTime = strptime(paste(data[,1], data[,2]),'%d/%m/%Y %H:%M:%S'))

## Open the graphic device
png(filename = 'plot4.png', width = 480, height = 480)

## Divide area to 2 by 2
par(mfrow=c(2,2))

## Plot 1
plot(data$DateTime, data$Global_active_power, type='n', xlab = '', 
     ylab = 'Global Active Power (kilowatts)')
  ### add lines
  lines(data$DateTime, data$Global_active_power, type = 'l')

## Plot 2
plot(data$DateTime, data$Voltage, type='n', xlab = 'datetime', 
     ylab = 'Voltage')
  ### add lines
  lines(data$DateTime, data$Voltage, type = 'l')

## Plot 3
plot(data$DateTime, data$Sub_metering_1, type='n', xlab = '', 
     ylab = 'Energy sub metering')

  ### add lines
  lines(data$DateTime, data$Sub_metering_1, type = 'l')
  lines(data$DateTime, data$Sub_metering_2, type = 'l', col='red')
  lines(data$DateTime, data$Sub_metering_3, type = 'l', col='blue')
  ### add legend
  legend('topright', names(data)[7:9], lty = 1, col=c('black','red','blue'), bty='n')

## Plot 4
plot(data$DateTime, data$Global_reactive_power, type='n', xlab = 'datetime', 
     ylab = 'Global_reactive_power')
  ### add lines
  lines(data$DateTime, data$Global_reactive_power, type = 'l')

## Turn off device
dev.off()