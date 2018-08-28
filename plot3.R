################################## Reading data #################################
data[, 7] <- as.numeric(data[, 7])
data[, 8] <- as.numeric(data[, 8])
data[, 9] <- as.numeric(data[, 9])
# produce PNG file 
png(filename = "plot3.png", width = 480, height = 480)
################################# plot ##########################################
par(mfrow = c(1,1), mar = c(5, 6, 4, 2))
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
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       cex = 1,
       col = c("black", "red", "blue"))
# close PNG file
dev.off()
