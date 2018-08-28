################################## Reading data #################################
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
data <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007") 
data[, 3] <- as.numeric(data[, 3])
# produce PNG file 
png(filename = "plot1.png", width = 480, height = 480) 
##################################### plot ######################################
par(mfrow = c(1,1), mar = c(5, 5, 4, 2))
hist(data$Global_active_power,
     col = "red", 
     xlim = c(0, 6), 
     ylim = c(0, 1200), 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", xaxt = "n", yaxt = "n")
axis(1, at = seq(0, 6, by = 2), 
     labels = c("0", "2", "4", "6"))
axis(2, at = seq(0, 1200, by = 200), 
     labels = c("0", "200", "400", "600", "800", "1000", "1200"))
# close PNG file
dev.off()

