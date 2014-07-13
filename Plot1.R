
# Read table from original text, with specified dates
df <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';' , na.string="?")
colnames(df) <- names(read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1))

# Add a column with combined date and time
df$dateTime <- strptime(paste(test$Date,test$Time), format="%d/%m/%Y %H:%M:%S")

# Create plot 1
png(filename="plot1.png", width = 480, height = 480)
  hist(as.numeric(as.character(df1$Global_active_power)), col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

# another way to subset data by speficited dates --- slower
## df <- read.table ("household_power_consumption.txt", header = TRUE, sep=";", na.string="?")
## df$Date <- as.Date(as.character(df$Date), "%d/%m/%Y")
## df1 <- subset(df, df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"))
