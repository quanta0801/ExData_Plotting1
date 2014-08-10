#setwd("~/GitHub//ExData_Plotting1")

initial=read.table("household_power_consumption.txt",header=T,sep=";",nrows=10,na.strings="?")
class1=sapply(initial,class)
epdata=read.table("~/data/household_power_consumption.txt",header=T,sep=";",nrows=2075259,na.strings="?",colClasses=class1)
# names(epdata)

epdata=within(epdata,{
  Date=as.Date(Date,"%d/%m/%Y")
  Time=strptime(paste(Date,Time),format="%F %T")
})

epdatasubset=with(epdata,{
  epdata[is.element(epdata$Date,as.Date(c("2007-02-01","2007-02-02"),"%F")),]
})

# #Plot 1
# png("plot1.png")
# with(epdatasubset,hist(Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power"))
# dev.off()
# 
# #Plot 2
# png("plot2.png")
# with(epdatasubset,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
# dev.off()
# 
#Plot 3
png("plot3.png")
with(epdatasubset,{
  plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(Time,Sub_metering_2,col=2)
  lines(Time,Sub_metering_3,col=4)
})
legend("topright",legend=paste("Sub metering",1:3),lty=1,col=c(1,2,4))
dev.off()
# 
# #Plot 4
# png("plot4.png")
# par(mfrow=c(2,2))
# with(epdatasubset,{
#   #1st plot
#   plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power")
#   
#   #2nd plot
#   plot(Time,Voltage,type="l",xlab="datetime")
#   
#   #3rd plot
#   plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
#   lines(Time,Sub_metering_2,col=2)
#   lines(Time,Sub_metering_3,col=4)
#   legend("topright",legend=paste("Sub metering",1:3),lty=1,col=c(1,2,4),bty="n")
#   
#   #4th plot
#   plot(Time,Global_reactive_power,xlab="datetime")
# })
# dev.off()