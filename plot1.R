#read file from fs
df <- read.csv("D:\\TEST_DSToolBox\\datasciencecoursera\\crs4-wk1\\household_power_consumption.txt",header=TRUE,sep=";")
#format Date as date object
df$Date <- as.Date(df$Date,"%d/%m/%Y")
#filter data in 2 days 2007/02/01 and 02
df_filter <- subset(df,df$Date=="2007/02/01"|df$Date=="2007/02/02")
#rewrite GAP as numeric
df$Global_active_power <- as.numeric(df$Global_active_power)
#open PNG device and give name
png(filename = "D:\\TEST_DSToolBox\\ExData_Plotting1\\Plot1.png",width = 480, height = 480, units = "px" )
#draw histo and set labels
hist(df_filter$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
#write to file
dev.off()