#Libraries
library(data.table)

#Read the data as data frame
data <- fread("C:/Users/LENOVO/Desktop/Data_Science/Exploratory_analysis/household_power_consumption.txt")

#Subsetting the data for date 1/2/2007 & 2/2/2007
data1 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#now we are ready with the data So need to plot the graphs
data1$Global_active_power <- as.numeric(data1$Global_active_power)

#plot 1
hist(data1$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts")

#save plot as png format

dev.copy(png, "plot1.png")

dev.off()