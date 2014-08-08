#Import the data (data must be downloaded to desktop and put in a file called 'power')
household_power_consumption <- read.csv("~/Desktop/Power/household_power_consumption.txt", sep=";")

#Change the name so you don't have to type out the long name everytime
x <- household_power_consumption

#Convert the Date row to Date format and join the column back to original
y <- x[,1]
z <- as.Date(y, "%d/%m/%Y")
x <- cbind(z, household_power_consumption)

#Subset for the date range
w <- x[x$z == "2007-02-01" | x$z == "2007-02-02",]

#Join the time and date columns
m = paste(as.character(w$z), as.character(w$Time), sep=" ")
n = strptime(m, format="%Y-%m-%d %H:%M")
w$Date=n

#Build plot4 and save as PNG
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#Create first graph
q <- as.numeric(as.character(w$Global_active_power))
plot(w$Date, w$Global_active_power, ylab = "Global Active Power (kilowatts)", type="l", xlab = "")

#Create second graph
plot(w$Date, w$Voltage, ylab = "Voltage", type="l", xlab = "datetime")

#Create third graph
plot(w$Date, w$Sub_metering_1, ylab = "Energy sub metering", type="l", xlab = "")
plot.xy(xy.coords(w$Date, w$Sub_metering_2), type="l", col = "red")
plot.xy(xy.coords(w$Date, w$Sub_metering_3), type="l", col = "blue")
legend("topright", legend = c("Sub Metering 1", "Sub Metering 2","Sub Metering 3"),lty=c(1,1,1),col=c("black","red","blue"))

#Create fourth graph
plot(w$Date, w$Global_reactive_power, ylab = "Global_reactive_power", type="l", xlab = "datatime")

dev.off()
