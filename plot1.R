# Download input file from url
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tmp <- tempfile()
download.file(url,tmp)

# Set input dataframe
df <- read.delim(unzip(tmp,files="household_power_consumption.txt"),sep=";")
dim(df)

# Convert Date & Time columns to Datetime object 
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df$Time <- format(strptime(df$Time, "%H:%M:%S"),"%H:%M:%S")

# Subset datas from 2007-02-01 & 2007-02-02
df <- subset(df,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

# Open .png file 
png("plot1.png",width=480,height=480)

# Plot histogram of Global_active_power
hist(as.numeric(df$Global_active_power),col = "red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# Close .png file
dev.off()