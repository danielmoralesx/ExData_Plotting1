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
png("plot2.png")
plot(strptime(paste(as.character(hpc$Date), as.character(hpc$Time)), 
              "%d/%m/%Y %H:%M:%S"), 
     hpc$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()