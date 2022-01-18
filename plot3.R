#read file from fs
df <- read.csv("D:\\TEST_DSToolBox\\datasciencecoursera\\crs4-wk1\\household_power_consumption.txt",header=TRUE,sep=";")
#define datetime object as Date+Time a format
df$datetime<- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y%H:%M:%S"))
#rewrite GAP as numeric
df$Global_active_power <- as.numeric(df$Global_active_power)
#filter data on 2 days of Feb 20007
df_filter <- subset(df,df$datetime>="2007/02/01"&df$datetime < "2007/02/03")
#open PNG device 
png(filename = "D:\\TEST_DSToolBox\\ExData_Plotting1\\Plot3.png",width = 480, height = 480, units = "px" )

with(df_filter,plot(df_filter$datetime,df_filter$Sub_metering_1,type="l",main="",ylab="Energy Sub Metering",xlab=""))
lines(df_filter$datetime,df_filter$Sub_metering_2,col="red")
lines(df_filter$datetime,df_filter$Sub_metering_3,col="blue")
legend(x="topright",legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2)

dev.off()
