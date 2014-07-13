# set the writing directory to the folder data was saved
setwd("~/Desktop/Exploratory Data Analysis/course project")

# Read table from original text, with specified dates
df <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';' , na.string="?")
colnames(df) <- names(read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1))

# Add a column with combined date and time
df$dateTime <- strptime(paste(df$Date,df$Time), format="%d/%m/%Y %H:%M:%S")

# Create plot 2
png(filename="plot2.png", width = 480, height = 480)
  plot(df$dateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()