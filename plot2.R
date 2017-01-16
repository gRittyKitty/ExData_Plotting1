# First I set the working directory for me
setwd("/Users/apine/Documents/dataCourse/ExploreData")
# read in the file
d = read.table("household_power_consumption.txt", sep=";", header = TRUE,stringsAsFactors=F)
setwd("./ExData_Plotting1")
# set the date column to date class
d[,1]=as.Date(d[,1],"%d/%m/%Y")
# subset the data to the appropriate 2 day span
e = subset(d,d$Date>=as.Date('2007-02-01') & d$Date<=as.Date('2007-02-02'))
# convert the string data to numeric so it graphs
e$Global_active_power = as.numeric(e$Global_active_power)
e$Datetimecol = strptime(paste(e$Date,e$Time),"%Y-%m-%d %H:%M:%S")
# ensure that there is only one graph on the screen
par(mfrow = c(1,1))
png(filename="plot2.png", width=480, height=480)
plot(e$Datetimecol,e$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
