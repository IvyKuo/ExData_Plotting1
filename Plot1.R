# set the writing directory to the folder data was saved
setwd("~/Desktop/Exploratory Data Analysis/course project")

# Read table from original text, with specified dates
df <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';' , na.string="?")
colnames(df) <- names(read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1))

# Create plot 1
png(filename="plot1.png", width = 480, height = 480)
  hist(as.numeric(as.character(df$Global_active_power)), col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

# another way to subset data by speficited dates --- slower
## df <- read.table ("household_power_consumption.txt", header = TRUE, sep=";", na.string="?")
## df$Date <- as.Date(as.character(df$Date), "%d/%m/%Y")
## df1 <- subset(df, df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"))
