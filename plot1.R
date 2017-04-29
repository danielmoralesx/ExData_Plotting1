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

png("plot1.png")
hist(hpc$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     col = "#FF2600")
dev.off()