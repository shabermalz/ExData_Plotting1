setwd("/Users/habbes/ExData_Plotting1")
df <- read.csv("/Users/habbes/data/household_power_consumption.txt", sep = ";", header= TRUE, na.strings="?")

df1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]

df1$Date <-  as.Date(df1$Date)
df1$Time <- as.character(df1$Time)
df1$Time <- strptime(df1$Time, format = "%H:%M:%S")
df1$Global_active_power <- as.numeric(df1$Global_active_power)


png(filename = "plot1.png",width = 480, height=480, units = "px")    
hist(df1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", x.lim = c(0,7.5),
                                    ylim= c(1,1200), col="red", right = TRUE, bg="grey", breaks=seq(0,7.5, by=.5),
                                    cex.lab=.7, cex.axis=0.7, cex.main=0.8)

dev.off()

setwd("~")
