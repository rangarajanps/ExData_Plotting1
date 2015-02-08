file <- "household_power_consumption.txt"
filecontent <- readLines(file)

row2_index <- grep("^1/2/2007|^2/2/2007",filecontent)

df <- read.table(text=filecontent[row2_index],sep=";")

lbl <- strsplit(filecontent[1],";")

colnames(df) <- unlist(lbl)

png("plot1.png", width = 480, height = 480, bg = "transparent", units = "px")

hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()
