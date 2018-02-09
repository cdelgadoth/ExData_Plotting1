# Read data from working directory
getwd()
energydata<- read.table ("Exploratory/Week1/household_power_consumption.txt", 
                         header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset_energy<- subset(energydata, energydata$Date=="1/2/2007" | energydata$Date =="2/2/2007")

subset_energy$Date <- as.Date(subset_energy$Date, format="%d/%m/%Y")
subset_energy$Time <- strptime(subset_energy$Time, format="%H:%M:%S")
subset_energy[1:1440,"Time"] <- format(subset_energy[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_energy[1441:2880,"Time"] <- format(subset_energy[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Saving plot in png with the specified dimensions if using R studio you can save image and give dimensions
png(filename = "plot4.png", width =480, height = 480)
#Create 4 plots together
par(mfrow=c(2,2))
with(subset_energy,{
    plot(subset_energy$Time,as.numeric(as.character(subset_energy$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
    plot(subset_energy$Time,as.numeric(as.character(subset_energy$Voltage)), type="l",xlab="datetime",ylab="Voltage")
    plot(subset_energy$Time,subset_energy$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    with(subset_energy,lines(Time,as.numeric(as.character(Sub_metering_1))))
    with(subset_energy,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
    with(subset_energy,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
    plot(subset_energy$Time,as.numeric(as.character(subset_energy$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

