# create plot of all sub metering energy in time
# the current directory need to include the file "household_power_comsumption.txt" which holds the data
file <- c("household_power_consumption.txt")
# read the subset of data for days 1/2/2007 and 2/2/2007
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')")
# format column Date as date
data_subset$Date <- as.POSIXlt(paste(as.Date(data_subset$Date,format="%d/%m/%Y"), data_subset$Time, sep=" "))
# format column Time as time
data_subset$Time <- strptime(data_subset$Time , format = "%H:%M:%S")
# open plot file
png("plot3.png")
# set maximum range for y axis
yrange<-range(data_subset$Sub_metering_1,data_subset$Sub_metering_2,data_subset$Sub_metering_3)
# plot first metering
with(data_subset, plot(Date,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering"),ylim=yrange)
# stay in same plot
par(new=T)
# plot second metering in red
with(data_subset, plot(Date,Sub_metering_2,type="l",xlab="", ylab="Energy sub metering", col=2, axes=F,ylim=yrange))
# stay in same plot
par(new=T)
# plot third metering in blue
with(data_subset, plot(Date,Sub_metering_3,type="l",xlab="", ylab="Energy sub metering", col=4, axes=F,ylim=yrange))
# next plot in new frame
par(new=F)
# add legend in top right corner
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c(1,2,4))
# close device and write file
dev.off()