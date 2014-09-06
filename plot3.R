Sys.setlocale("LC_TIME", "English")
#I unzip the file as "project1.txt"
table <- read.csv(file = "project1.txt",sep = ";",na.strings = "?")

table$Date <- as.Date(table$Date, format = '%d/%m/%Y')
table$datetime <- paste(table$Date, table$Time)
table$time <- as.POSIXct(table$datetime, format="%Y-%m-%d %H:%M:%S")
#subset the data
table2 <- table[which(table$time >= "2007-02-01 00:00:00" & table$time < "2007-02-03 00:00:00"),]

png(file = "plot3.png") #Open PNG device

with(table2, plot(time, Sub_metering_1, type ="l", col="black",xlab="",ylab="Energy submetering"))
with(table2, points(time,Sub_metering_2 , col = "red",type = "l"))
with(table2, points(time,Sub_metering_3 , col = "blue",type = "l"))
legend("topright", cex=0.8, lty=1,  col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off() #Close PNG file device