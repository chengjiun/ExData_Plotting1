setwd('~/Downloads/Course4')
file <- 'household_power_consumption.txt'
data<-read.csv(file,na.strings='?',sep=';')

data$Date<- as.Date(data$Date, "%d/%m/%Y")
data<- subset(data, Date <= as.Date('2007-02-02') & Date >= as.Date('2007-02-01'))
Time<- as.POSIXct(paste(data$Date, data$Time))
  
png(file="plot2.png",width=480,height=480)
x<-Time
y<-data$Global_active_power

plot(x, y,type='n',main="",ylab='Global Active Power (kilowatts)',xlab='')
lines(x,y,type='l')
dev.off()
