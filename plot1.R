Sys.setlocale("LC_TIME", "English")
#I unzip the file as "project1.txt"
table <- read.csv(file = "project1.txt",sep = ";",na.strings = "?")

table$Date <- as.Date(table$Date, format = '%d/%m/%Y')
table$datetime <- paste(table$Date, table$Time)
table$time <- as.POSIXct(table$datetime, format="%Y-%m-%d %H:%M:%S")
#subset the data
table2 <- table[which(table$time >= "2007-02-01 00:00:00" & table$time < "2007-02-03 00:00:00"),]

png(file = "plot1.png") #Open PNG device

hist(table2$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
title(main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off() #Close PNG file device