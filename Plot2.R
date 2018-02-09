# Read data from working directory
getwd()
energydata<- read.table ("Exploratory/Week1/household_power_consumption.txt", 
header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_energy<- subset(energydata, energydata$Date=="1/2/2007" | energydata$Date =="2/2/2007")

subset_energy$Date <- as.Date(subset_energy$Date, format="%d/%m/%Y")
subset_energy$Time <- strptime(subset_energy$Time, format="%H:%M:%S")
subset_energy[1:1440,"Time"] <- format(subset_energy[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_energy[1441:2880,"Time"] <- format(subset_energy[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Saving plot in png with the specified dimensions
png(filename = "Plot2", width =480, height = 480)
plot(subset_energy$Time,as.numeric(as.character(subset_energy$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 



