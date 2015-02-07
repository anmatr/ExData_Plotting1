file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')")
data_subset$Date <- as.POSIXlt(paste(as.Date(data_subset$Date,format="%d/%m/%Y"), data_subset$Time, sep=" "))
data_subset$Time <- strptime(data_subset$Time , format = "%H:%M:%S")
png("plot3.png")
yrange<-range(data_subset$Sub_metering_1,data_subset$Sub_metering_2,data_subset$Sub_metering_3)
with(data_subset, plot(Date,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering"),ylim=yrange)
par(new=T)
with(data_subset, plot(Date,Sub_metering_2,type="l",xlab="", ylab="Energy sub metering", col=2, axes=F,ylim=yrange))
par(new=T)
with(data_subset, plot(Date,Sub_metering_3,type="l",xlab="", ylab="Energy sub metering", col=4, axes=F,ylim=yrange))
par(new=F)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c(1,2,4))
dev.off()