# First I set the working directory for me
setwd("/Users/apine/Documents/dataCourse/ExploreData/ExData_Plotting1")
# read in the file
d = read.table("household_power_consumption.txt", sep=";", header = TRUE,stringsAsFactors=F)
# set the date column to date class
d[,1]=as.Date(d[,1],"%d/%m/%Y")
# subset the data to the appropriate 2 day span
e = subset(d,d$Date>=as.Date('2007-02-01') & d$Date<=as.Date('2007-02-02'))
# convert the string data to numeric so it graphs
e$Global_active_power = as.numeric(e$Global_active_power)
# ensure that there is only one graph on the screen
par(mfrow = c(1,1))
png(filename="plot1.png", width=480, height=480)
hist(e$Global_active_power,xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()