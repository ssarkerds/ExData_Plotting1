
## read complete dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## get the subset of data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates into POSIXct format
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## create the second plot
globalActivePower <- as.numeric(subdata$Global_active_power)
plot(globalActivePower~subdata$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
