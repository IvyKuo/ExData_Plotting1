# set the writing directory to the folder data was saved
setwd("~/Desktop/Exploratory Data Analysis/course project")

# Read table from original text, with specified dates
df <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';' , na.string="?")
colnames(df) <- names(read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1))

# Add a column with combined date and time
df$dateTime <- strptime(paste(df$Date,df$Time), format="%d/%m/%Y %H:%M:%S")

# Create plot 3
png(filename="plot3.png", width = 480, height = 480)
  plot(df$dateTime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
  lines(df$dateTime, df$Sub_metering_2, type = "l", col = "red")
  points(df$dateTime, df$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()