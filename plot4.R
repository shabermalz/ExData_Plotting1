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


  png(filename = "plot4.png", width = 480, height=480, units = "px")    
  
  par(mfcol=c(2,2))
  par(mar= c(5,4,2,2) + 0.1)
  #first plot
  plot(df1$datetime,df1$Global_active_power, type="l", ylab = "Global Active Power", xlab ="",
       cex.lab=0.5, cex.axis=0.5, xaxt = "n")
  daterange= c(as.POSIXlt(min(df1$datetime)), as.POSIXlt(max(df1$datetime)))
  axis.POSIXct(1, at=seq(daterange[1], daterange[2]+1400, by="day"), format="%a",cex.axis=0.5)
  
  #second plot
  
  plot(df1$datetime,df1$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab ="",
                                cex.lab=0.5, cex.axis=0.5, xaxt = "n")
  lines(df1$datetime, df1$Sub_metering_2, col="red")
  lines(df1$datetime, df1$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_1", "Sub_metering_3"),cex=0.25, lty=c(1, 1), col=c("black", "blue", "red"))

  daterange= c(as.POSIXlt(min(df1$datetime)), as.POSIXlt(max(df1$datetime)))
  axis.POSIXct(1, at=seq(daterange[1], daterange[2]+1400, by="day"), format="%a",cex.axis=0.5)
  
  #third plot
  #plot(df1$datetime,df1$Voltage , type="l", ylab = "Voltage", xlab ="datetime", ylim = c(232,248),
       #cex.lab=0.5, cex.axis=0.4, xaxt = "n")
  plot(df1$datetime,df1$Voltage , type="l", ylab = "Voltage", xlab ="datetime", ylim = c(232,248),
  cex.lab=0.5, cex.axis=0.4, yaxt="n",xaxt = "n")
  axis(2, at=seq(234, 248, by=4), cex.axis=.5)
  daterange= c(as.POSIXlt(min(df1$datetime)), as.POSIXlt(max(df1$datetime)))
  axis.POSIXct(1, at=seq(daterange[1], daterange[2]+1400, by="day"), format="%a",cex.axis=0.5, xlab="datetime")
  
  #forth plot
  plot(df1$datetime ,df1$Global_reactive_power , type="l", xlab ="datetime",
       cex.lab=0.5, cex.axis=0.5, xaxt = "n")
  
  daterange= c(as.POSIXlt(min(df1$datetime)), as.POSIXlt(max(df1$datetime)))
  axis.POSIXct(1, at=seq(daterange[1], daterange[2]+1400, by="day"), format="%a",cex.axis=0.5, xlab="datetime")
  
  
  dev.off()

setwd("~")
