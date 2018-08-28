# produce PNG file 
png(filename = "plot4.png", width = 480, height = 480)
################################# plot ##########################################
par(mfrow = c(2,2), mar = c(4, 5, 4, 2))
#plot the first graph
plot(1:nrow(data), data$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)", 
     type = "n",
     xaxt = "n")
lines(1:nrow(data), data$Global_active_power, type="l")
axis(1, at = c(0, which(data$Date == "2/2/2007")[1], nrow(data)), 
     labels = c("Thu", "Fri", "Sat"))
# plot the second graph
# convert variable Voltage into numeric class
data[, 5] <- as.numeric(data[, 5])
plot(1:nrow(data), data$Voltage,
     xlab = "datetime",
     ylab = "Voltage", 
     type = "n",
     xaxt = "n")
lines(1:nrow(data), data$Voltage, type="l")
axis(1, at = c(0, which(data$Date == "2/2/2007")[1], nrow(data)), 
     labels = c("Thu", "Fri", "Sat"))
#plot the third graph
plot(1:nrow(data), data$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering", 
     type = "n",
     xaxt = "n")
lines(1:nrow(data), data$Sub_metering_1, type="l")
lines(1:nrow(data), data$Sub_metering_2, type="l", col = "red")
lines(1:nrow(data), data$Sub_metering_3, type="l", col = "blue")
axis(1, at = c(0, which(data$Date == "2/2/2007")[1], nrow(data)), 
     labels = c("Thu", "Fri", "Sat"))
legend("topright", 
       inset=c(0, 0.01),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       cex = 0.8,
       col = c("black", "red", "blue"),
       box.lty = 0)
# plot the fourth graph
plot(1:nrow(data), data$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power", 
     type = "n",
     xaxt = "n")
lines(1:nrow(data), data$Global_reactive_power, type="l")
axis(1, at = c(0, which(data$Date == "2/2/2007")[1], nrow(data)), 
     labels = c("Thu", "Fri", "Sat"))
# close PNG file
dev.off()