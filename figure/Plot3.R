##############################################################################################################
## Before you can run this script you need to download the text file (Electric power consuption)
## from: https://www.coursera.org/learn/exploratory-data-analysis/peer/ylVFo/course-project-1
## and move the file into your working directory together with this script.
## This script reads the txt file, convert column 1 into Date and subset the data.table based on the date
## between 2007-02-01 and 2007-02-02. Graph will be plotted using the data.table subsetted from the original file
##############################################################################################################

df<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE)
df[,1]<-as.Date(df[,1],format="%d/%m/%Y")
df2<-subset(df,Date=="2007-02-01"|Date=="2007-02-02")
df2[,3:9]<-lapply(df2[,3:9],function (x) as.numeric(x))
df2[,10]<-as.POSIXct(paste(df2[,1],df2[,2]))
png(file="./plot3.png",width=480,height = 480)
plot(df2$V10,df2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(df2$V10,df2$Sub_metering_2,type="l",col="red")
points(df2$V10,df2$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()
