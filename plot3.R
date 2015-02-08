file <- "household_power_consumption.txt"
filecontent <- readLines(file)

row2_index <- grep("^1/2/2007|^2/2/2007",filecontent)

df <- read.table(text=filecontent[row2_index],sep=";")

lbl <- strsplit(filecontent[1],";")

colnames(df) <- unlist(lbl)

df <- mutate(df, DateTime = dmy_hms(paste(Date,Time)))

png("plot3.png", width = 480, height = 480, bg = "transparent", units = "px")

plot(df$DateTime,df$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(df$DateTime,df$Sub_metering_2,col="red")
lines(df$DateTime,df$Sub_metering_3,col="blue")

legend("topright",lwd=2,pch=c(NA,NA,NA),col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()