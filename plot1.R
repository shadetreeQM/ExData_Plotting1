plot1 <- function(){
	#hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?")
	#Have table, need to subset rows down to two days.
	#Actually, since we know that the rows are in time order and 1-minute intervals, I could calculate how many minutes passed to subset the data..
	hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", skip = 66637, nrows = 2880)
	png(filename="plot1.png", width= 480, height= 480, units="px")
	hist(hpc$V3, col="#f48642", main ="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()
}