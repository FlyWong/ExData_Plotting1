#Assumptions:
#1. data file "household_power_consumption.txt" resides in working directory and can be accessed directly via filename
#2. machine running this code has a 4GB RAM to ensure acceptable performance 

df_data <- read.table("household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?", , stringsAsFactors=FALSE)


df_datafiltered <- df_data[as.Date(df_data$Date, format = "%d/%m/%Y") > as.Date("2007-01-31") & as.Date(df_data$Date, format = "%d/%m/%Y") < as.Date("2007-02-03"),] # subset data for 1st and 2nd Feb 2007

# create dt, a new datetime column for time series plotting.
df_datafiltered$dt <- strptime(paste(df_datafiltered$Date, df_datafiltered$Time, sep=", "), format="%d/%m/%Y, %H:%M:%S")

png("plot2.png", width=480, height=480)

par(mfrow = c(1,1)) #initialize environment for plot

with(df_datafiltered, plot(dt, as.numeric(as.character(Global_active_power)),type="l", ylab = "Global Active Power (kilowatts)", xlab=""))

dev.off()

