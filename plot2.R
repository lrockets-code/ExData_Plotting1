#read file from fs
df <- read.csv("D:\\TEST_DSToolBox\\datasciencecoursera\\crs4-wk1\\household_power_consumption.txt",header=TRUE,sep=";")
#define datetime object as Date+Time and format
df$datetime<- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y%H:%M:%S"))
#rewrite GAP a s numeric
df$Global_active_power <- as.numeric(df$Global_active_power)
#filter on 2 days of Feb 2007 
df_filter <- subset(df,df$datetime>="2007/02/01"&df$datetime < "2007/02/03")
#open PNG device 
png(filename = "D:\\TEST_DSToolBox\\ExData_Plotting1\\Plot2.png",width = 480, height = 480, units = "px" )
#plot data and set labels
plot(df_filter$datetime,df_filter$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",main="")
#print on file
dev.off()