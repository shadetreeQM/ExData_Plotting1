plot2 <- function(){
	hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", skip = 66637, nrows = 2880)
	png(filename="plot2.png", width= 480, height= 480, units="px")
	#concatenate dates and times to a timestamp string
	dateme <- paste(hpc$V1, hpc$V2)
	#convert timestamp string to a DateTime object
	datemedateme <- strptime(dateme, "%d/%m/%Y %H:%M:%S")
	plot(datemedateme, hpc$V3, xlab="", ylab = "Global Active Power (kilowatts)", type="n")
	lines(datemedateme, hpc$V3)
	dev.off()
}