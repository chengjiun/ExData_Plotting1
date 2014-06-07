setwd('~/Downloads/Course4')
file <- 'household_power_consumption.txt'
data<-read.csv(file,na.strings='?',sep=';')

data$Date<- as.Date(data$Date, "%d/%m/%Y")
data<- subset(data, Date <= as.Date('2007-02-02') & Date >= as.Date('2007-02-01'))
data$DT<- as.POSIXct(paste(data$Date, data$Time))
  

png(file="plot4.png",width=480,height=480)

par(mfrow = c(2, 2)) 
with(data, {
  plot(DT, Global_active_power, type='n', xlab='', ylab = "Global Active Power", main='')
  lines(DT,Global_active_power,type='l')
  plot(DT, Voltage,type='n', xlab='', ylab='Voltage', main="") 
  lines(DT,Voltage,type='l')
  plot(DT, Sub_metering_1,type='n',main="",ylab='Energy sub metering',xlab='')
  lines(DT,Sub_metering_1,type='l')
  lines(DT,Sub_metering_2,col='red',type='l')
  lines(DT,Sub_metering_3,col='blue',type='l')
  legend("topright", lty = 1, col = c("black", "red",'blue'), legend = names(data)[7:9])
  plot(DT, Global_reactive_power,type='n', xlab='', ylab = "Global_reactive_power", main='') 
  lines(DT,Global_reactive_power,type='l')
})
dev.off()
