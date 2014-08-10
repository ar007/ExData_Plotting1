# Steps to create Plot2 
# Read the data into R
hholdpc  <- read.table("household_power_consumption.txt",sep=";",skip=66636,nrow=2880,header=T,stringsAsFactors=F)
header  <- read.table("household_power_consumption.txt",sep=";",nrow=3,header=T)
colnames(hholdpc)  <- names(header)

# hholdpc dataframe has the required data
hholdpc$Date  <- strptime(paste(hholdpc$Date,hholdpc$Time), "%d/%m/%Y %H:%M:%S")

# Adjust the plot space to accomodate only 1 plot
par(mfrow=c(1,1))

# Display the plot in the Plots region to verify 
with(hholdpc,plot(Date,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# Creating the PNG file for Plot2
png(file = "plot2.png")  ## Open PNG device; create 'plot2.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
with(hholdpc,plot(Date,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()  ## Close the PNG file device
