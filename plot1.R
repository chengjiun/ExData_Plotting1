setwd('~/Downloads/Course4')
file <- 'household_power_consumption.txt'
data<-read.csv(file,na.strings='?',sep=';')

data$Date<- as.Date(data$Date, "%d/%m/%Y")
data<- subset(data, Date <= as.Date('2007-02-02') & Date >= as.Date('2007-02-01'))

png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power,col='red',main="Global Active Power",xlab='Global Active Power (kilowatts)')
dev.off()
