# create plot of Global Active Power against Freequency
# the current directory need to include the file "household_power_comsumption.txt" which holds the data
file <- c("household_power_consumption.txt")
# read the subset of data for days 1/2/2007 and 2/2/2007
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')")
# format column Date as date
data_subset$Date <- as.Date(data_subset$Date , format = "%d/%m/%y")
# format column Time as time
data_subset$Time <- strptime(data_subset$Time , format = "%H:%M:%S")
# open plot file
png("plot1.png")
# plot Global Active Power against Freequency
hist(data_subset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
# close plot
dev.off()