# Read data from working directory
getwd()
energydata<- read.table ("Exploratory/Week1/household_power_consumption.txt", 
header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_energy<- subset(energydata, energydata$Date=="1/2/2007" | energydata$Date =="2/2/2007")
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(subset_energy$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

