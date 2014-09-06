table <- read.csv(file = "project1.txt",sep = ";",na.strings = "?")

table$Date <- as.Date(table$Date, format = '%d/%m/%Y')
table$datetime <- paste(table$Date, table$Time)
table$time <- as.POSIXct(table$datetime, format="%Y-%m-%d %H:%M:%S")
#subset the data
table2 <- table[which(table$time >= "2007-02-01 00:00:00" & table$time < "2007-02-03 00:00:00"),]

png(file = "plot4.png") #Open PNG device

par(mfrow=c(2,2))

hist(table2$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
title(main="Global Active Power", xlab="Global Active Power (kilowatts)")

plot(table2$time,table2$Voltage,type = "l",xlab="datetime",ylab="Voltage")

with(table2, plot(time, Sub_metering_1, type ="l", col="black",xlab="",ylab="Energy submetering"))
with(table2, points(time,Sub_metering_2 , col = "red",type = "l"))
with(table2, points(time,Sub_metering_3 , col = "blue",type = "l"))
legend("topright", bty ="n", lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(table2$time,table2$Global_reactive_power,type = "l",xlab="datetime",ylab="Global_reactive_power")

dev.off() #Close PNG file device