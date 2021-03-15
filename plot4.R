# Set input dataframe
df <- read.delim("household_power_consumption.txt",sep=";")
dim(df)

# Convert Date & Time columns to Datetime object 
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df$Time <- format(strptime(df$Time, "%H:%M:%S"),"%H:%M:%S")

# Subset datas from 2007-02-01 & 2007-02-02
df <- subset(df,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

# Create Datetime columns from Date & Time objects
df$Datetime <- as.POSIXct(paste0(df$Date,df$Time))

# Open .png file 
png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))
# c(1,1)
plot(df$Datetime,df$Global_active_power,type="l",xlab = "",ylab="Global Active Power")
# c(1,2)
plot(df$Datetime,df$Voltage,type="l",xlab="datetime",ylab="Voltage")
# c(2,1)
plot(df$Datetime,df$Sub_metering_1,type="l",xlab = "",ylab="Energy sub metering",col="black")
lines(df$Datetime,df$Sub_metering_2,col="red")
lines(df$Datetime,df$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
# c(2,2)
plot(df$Datetime,df$Global_reactive_power,type="l",xlab = "datetime",ylab="Global_reactive_power")

# Close .png file
dev.off()