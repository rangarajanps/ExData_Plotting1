file <- "household_power_consumption.txt"
filecontent <- readLines(file)

row2_index <- grep("^1/2/2007|^2/2/2007",filecontent)

df <- read.table(text=filecontent[row2_index],sep=";")

lbl <- strsplit(filecontent[1],";")

colnames(df) <- unlist(lbl)

df <- mutate(df, DateTime = dmy_hms(paste(Date,Time)))

png("plot2.png", width = 480, height = 480, bg = "transparent", units = "px")

plot(df$DateTime,df$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()