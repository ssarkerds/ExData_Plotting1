## read complete dataset
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


## subset data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Convert dates into POSIXct format
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## Plot 1
globalActivePower <- as.numeric(subdata$Global_active_power)
hist(globalActivePower, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
