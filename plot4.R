#Libraries
library(data.table)

#Read the data as data frame
data <- fread("C:/Users/LENOVO/Desktop/Data_Science/Exploratory_analysis/household_power_consumption.txt")

#Subsetting the data for date 1/2/2007 & 2/2/2007
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data1 <- mutate(data1, DateTime = paste(data1$Date,data1$Time))

data1$DateTime <-  as.POSIXct(data1$DateTime, format = "%d/%m/%Y %H:%M:%S",tz="UTC")
#png("plot4.png", width=480, height=480)
par(mfrow =c(2,2))

plot(data1$DateTime,data1$Global_active_power,xlab = "",ylab = "Global Active Power",type = "l") #plot 1

plot(data1$DateTime,data1$Voltage,xlab = "datetime",ylab = "Voltage",type = "l") #plot2

plot(data1$DateTime,data1$Sub_metering_1,type = "l",col = "black",xlab = "", ylab = "Energy Sub metering") #plot3

lines(data1$DateTime,data1$Sub_metering_2,col="red")

lines(data1$DateTime,data1$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),bty = "n",cex = .6,lty=c(1,1))

plot(data1$DateTime,data1$Global_reactive_power,xlab = "datetime",ylab = "Global Reactive Power",type = "l")

dev.copy(png,"plot4.png",width= 720)

dev.off()