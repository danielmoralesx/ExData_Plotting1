if (require(sqldf)) {
  print("sqldf is loaded correctly")
} else {
  print("trying to install sqldf")
  install.packages("sqldf")
  if(require(sqldf)){
    print("sqldf installed and loaded")
  } else {
    stop("could not install sqldf")
  }
}

hpc <- read.csv.sql("household_power_consumption.txt",
                    sql = "select * from file where Date in ('1/2/2007', '2/2/2007')",
                    sep = ";")

Sys.setlocale(category = "LC_ALL", locale = "english")
x <- strptime(paste(as.character(hpc$Date), as.character(hpc$Time)), 
              "%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow = c(2, 2))

plot(x, 
     hpc$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     main = "",
     type = "l")

plot(x,
     hpc$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

plot(x,
     hpc$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "l")
lines(x, hpc$Sub_metering_2, col = "red")
lines(x, hpc$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "blue", "red"),
       bty = "n")

plot(x,
     hpc$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")

dev.off()