# set the writing directory to the folder data was saved
setwd("~/Desktop/Exploratory Data Analysis/course project")

# Read table from original text, with specified dates
df <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';' , na.string="?")
colnames(df) <- names(read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1))

# Add a column with combined date and time
df$dateTime <- strptime(paste(df$Date,df$Time), format="%d/%m/%Y %H:%M:%S")

# Create plot 4 
png(filename="plot4.png", width = 480, height = 480)
  par(mfrow = c(2,2))
  plot(df$dateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(df$dateTime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", col = "black")
  with(df, {
     plot(df$dateTime, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
     lines(df$dateTime, df$Sub_metering_2, type = "l", col = "red")
     points(df$dateTime, df$Sub_metering_3, type = "l", col = "blue")
     legend("topright", lty = 1, box.lty = 0, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   }) 
  plot(df$dateTime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", col = "black")
dev.off()
  