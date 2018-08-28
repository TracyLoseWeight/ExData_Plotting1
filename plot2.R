################################## Reading data #################################
# first of all we want to find out what day is data$Date
date_time <- NULL
day <- NULL
for (i in 1:nrow(data)){
      date_time[[i]] <- strptime(paste(data[i, 1], data[i, 2], sep = ":"),format='%d/%m/%Y:%H:%M:%S')
      # Use function wday() from package "lubridate" 
      day[i] <- wday(date_time[[i]])
}
table(day)
# now we know that 1/2/2007 is Thursday and 2/2/2007 is Friday
# produce PNG file 
png(filename = "plot2.png", width = 480, height = 480) 
################################# plot ##########################################
par(mfrow = c(1,1), mar = c(5, 6, 4, 2))
plot(1:nrow(data), data$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)", 
     type = "n",
     xaxt = "n")
lines(1:nrow(data), data$Global_active_power, type="l")
axis(1, at = c(0, which(data$Date == "2/2/2007")[1], nrow(data)), 
     labels = c("Thu", "Fri", "Sat"))
# close PNG file
dev.off()