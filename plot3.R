setwd('~/Downloads/Course4')
file <- 'household_power_consumption.txt'
data<-read.csv(file,na.strings='?',sep=';')

data$Date<- as.Date(data$Date, "%d/%m/%Y")
data<- subset(data, Date <= as.Date('2007-02-02') & Date >= as.Date('2007-02-01'))
Time<- as.POSIXct(paste(data$Date, data$Time))
  
png(file="plot3.png",width=480,height=480)
x<-Time
y<-data$Sub_metering_1
plot(x, y,type='n',main="",ylab='Energy sub metering',xlab='')
lines(x,y,type='l')
lines(x,data$Sub_metering_2,col='red',type='l')
lines(x,data$Sub_metering_3,col='blue',type='l')
legend("topright", lty = 1, col = c("black", "red",'blue'), legend = names(data)[7:9])
dev.off()
