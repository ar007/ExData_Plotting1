# Steps to create Plot4 
# Read the data into R
hholdpc  <- read.table("household_power_consumption.txt",sep=";",skip=66636,nrow=2880,header=T,stringsAsFactors=F)
header  <- read.table("household_power_consumption.txt",sep=";",nrow=3,header=T)
colnames(hholdpc)  <- names(header)


# hholdpc dataframe has the required data
hholdpc$Date  <- strptime(paste(hholdpc$Date,hholdpc$Time), "%d/%m/%Y %H:%M:%S")

# Adjust the plot space to accomodate 4 plots
par(mfrow=c(2,2))

# Global Active Power vs Datetime
with(hholdpc,plot(Date,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

# Voltage vs Datetime
with(hholdpc,plot(Date,Voltage,type="l",xlab="datetime",ylab="Voltage"))

# Energy Sub metering vs Datetime
with(hholdpc,plot(Date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(hholdpc,lines(Date,Sub_metering_2,col="red"))
with(hholdpc,lines(Date,Sub_metering_3,col="blue"))
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Global Reactive Power vs Datetime
with(hholdpc,plot(Date,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

# Creating the PNG file for Plot4
png(file = "plot4.png")  ## Open PNG device; create 'plot4.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
# Adjust the plot space to accomodate 4 plots
par(mfrow=c(2,2))

# Global Active Power vs Datetime
with(hholdpc,plot(Date,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

# Voltage vs Datetime
with(hholdpc,plot(Date,Voltage,type="l",xlab="datetime",ylab="Voltage"))

# Energy Sub metering vs Datetime
with(hholdpc,plot(Date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(hholdpc,lines(Date,Sub_metering_2,col="red"))
with(hholdpc,lines(Date,Sub_metering_3,col="blue"))
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Global Reactive Power vs Datetime
with(hholdpc,plot(Date,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
dev.off() 



