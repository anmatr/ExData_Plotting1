# create plot of Global Active Power in time
# the current directory need to include the file "household_power_comsumption.txt" which holds the data
file <- c("household_power_consumption.txt")
# read the subset of data for days 1/2/2007 and 2/2/2007
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')")
# format column Date as date
data_subset$Date <- as.POSIXlt(paste(as.Date(data_subset$Date,format="%d/%m/%Y"), data_subset$Time, sep=" "))
# format column Time as time
data_subset$Time <- strptime(data_subset$Time , format = "%H:%M:%S")
# open plot file
png("plot2.png")
# plot Global Active Power in time
with(data_subset, plot(Date,Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)"))
# close device
dev.off()

