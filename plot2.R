setwd("/Users/habbes/ExData_Plotting1")
df <- read.csv("/Users/habbes/data/household_power_consumption.txt", sep = ";", header= TRUE, na.strings="?")

df1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
df1$newdate <- as.character(df1$Date)
df1$newdate <- as.Date(df1$newdate)


df1$Time <- as.character(df1$Time)
df1$newtime <- strptime(df1$Time, format = "%H:%M:%S")

df1$combidate <- paste(df1$Date, df1$Time)
df1$datetime <-  as.POSIXct(df1$combidate, format="%d/%m/%Y %H:%M:%S")

df1$Global_active_power <- as.numeric(df1$Global_active_power)


  png(filename = "plot2.png",width = 480, height=480, units = "px")    
  
  plot(df1$datetime,df1$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab ="",
                                cex.lab=0.5, cex.axis=0.75, xaxt = "n")
  daterange= c(as.POSIXlt(min(df1$datetime)), as.POSIXlt(max(df1$datetime)))
  axis.POSIXct(1, at=seq(daterange[1], daterange[2]+1400, by="day"), format="%a",cex.axis=0.75)
dev.off()

setwd("~")
