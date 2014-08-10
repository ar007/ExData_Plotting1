# Steps to create Plot3 
# Read the data into R
hholdpc  <- read.table("household_power_consumption.txt",sep=";",skip=66636,nrow=2880,header=T,stringsAsFactors=F)
header  <- read.table("household_power_consumption.txt",sep=";",nrow=3,header=T)
colnames(hholdpc)  <- names(header)

# hholdpc dataframe has the required data
hholdpc$Date  <- strptime(paste(hholdpc$Date,hholdpc$Time), "%d/%m/%Y %H:%M:%S")

# Adjust the plot space to accomodate only 1 plot
par(mfrow=c(1,1))

# Display the plot in the Plots region to verify 
with(hholdpc,plot(Date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(hholdpc,lines(Date,Sub_metering_2,col="red"))
with(hholdpc,lines(Date,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Creating the PNG file for Plot3
png(file = "plot3.png")  ## Open PNG device; create 'plot3.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
with(hholdpc,plot(Date,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(hholdpc,lines(Date,Sub_metering_2,col="red"))
with(hholdpc,lines(Date,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()  ## Close the PNG file device


