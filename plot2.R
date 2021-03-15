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
png("plot2.png",width=480,height=480)

# Plot Global_active_power by date
plot(df$Datetime,df$Global_active_power,type="l",xlab = "",ylab="Global Active Power (kilowatts)")

# Close .png file
dev.off()