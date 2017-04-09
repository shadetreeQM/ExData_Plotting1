plot3 <- function(){
	hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", skip = 66637, nrows = 2880)
	png(filename="plot3.png", width= 480, height= 480, units="px")
		#concatenate dates and times to a timestamp string
	dateme <- paste(hpc$V1, hpc$V2)
	#convert timestamp string to a DateTime object
	datemedateme <- strptime(dateme, "%d/%m/%Y %H:%M:%S")
	plot(datemedateme, hpc$V7, xlab="", ylab = "Energy sub metering", type="n")
	lines(datemedateme, hpc$V7, col="black")
	lines(datemedateme, hpc$V8, col="red")
	lines(datemedateme, hpc$V9, col="blue")
	legend("topright", lty=1, col = c("blue", "red", "black"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
	dev.off()
}