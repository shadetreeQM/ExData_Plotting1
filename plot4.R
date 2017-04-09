plot4 <- function(){
	hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", skip = 66637, nrows = 2880)
	png(filename="plot4.png", width= 480, height= 480, units="px")
		#concatenate dates and times to a timestamp string
	dateme <- paste(hpc$V1, hpc$V2)
	#convert timestamp string to a DateTime object
	datemedateme <- strptime(dateme, "%d/%m/%Y %H:%M:%S")
	#see page 19 of PlottingBase.pdf for an example.  Do I need everything in one dataframe to make "with" work?
	par(mfrow= c(2,2))
	#with(hpc, {
	plot(datemedateme, hpc$V3, xlab="", ylab = "Global Active Power (kilowatts)", type="n")
	lines(datemedateme, hpc$V3)
	plot(datemedateme, hpc$V5, xlab="datetime", ylab = "Voltage", type="n")
	lines(datemedateme, hpc$V5)
	plot(datemedateme, hpc$V7, xlab="", ylab = "Energy sub metering", type="n")
	lines(datemedateme, hpc$V7, col="black")
	lines(datemedateme, hpc$V8, col="red")
	lines(datemedateme, hpc$V9, col="blue")
	legend("topright", lty=1, col = c("blue", "red", "black"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), cex=0.75)
	plot(datemedateme, hpc$V4, xlab="datetime", ylab = "Global_reactive_power", type="n")
	lines(datemedateme, hpc$V4)
	#})
	dev.off()
}