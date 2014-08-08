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

#Build plot1 and save as PNG
q <- as.numeric(as.character(w$Global_active_power))
png("plot1.png", width = 480, height = 480)
hist(q, breaks=14, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
