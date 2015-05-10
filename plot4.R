plot4 <- function(toPNG= TRUE){
        
        ## read input data
        ## note: using read.csv.sql function from sqldf library to filter the
        ##       data only for the 2 specific dates
        input <- read.csv.sql("household_power_consumption.txt",
                              sql = "select * from file where Date 
                              in ('1/2/2007','2/2/2007')",
                              sep=";")
        ## set device to png
        if(toPNG) png("plot4.png")
        
        par(mfrow = c(2,2)) #set 2x2 plots
        ##Create all plots
        # we use a single * with * so that we don't need to repeat the dataframe 
        # name in each function
        with(input,{
        #Draw plot number 1 -- Global Active Power
                plot( strptime(paste(Date,Time),
                               format="%d/%m/%Y %H:%M:%S") ,
                      Global_active_power, type="l",
                      ylab="Global Active Power",
                      xlab="") 
        # Draw plot number 2 -- Voltage
                plot( strptime(paste(Date,Time),
                               format="%d/%m/%Y %H:%M:%S") ,
                      Voltage, type="l",xlab="datetime")
        
        # Draw plot number 3 -- sub metering
        
                plot( strptime(paste(Date,Time),
                               format="%d/%m/%Y %H:%M:%S") ,
                      Sub_metering_1, type="n",
                      xlab="",ylab="Energy sub metering")
                
                lines( strptime(paste(Date,Time),
                                format="%d/%m/%Y %H:%M:%S") ,
                       Sub_metering_1)
                
                lines( strptime(paste(Date,Time),
                                format="%d/%m/%Y %H:%M:%S") ,
                       Sub_metering_2, col = "red")
                
                lines( strptime(paste(Date,Time),
                                format="%d/%m/%Y %H:%M:%S") ,
                       Sub_metering_3, col="blue")
                
                legend("topright", 
                       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                       col=c("black","red","blue"),lty = 1,  bty = "n")
        
        
        # Draw plot number 4 -- Global_reactive_power
                plot( strptime(paste(Date,Time),
                               format="%d/%m/%Y %H:%M:%S") ,
                      Global_reactive_power, type="l",
                      xlab="datetime")
                
        })
        
        ## finish plotting to png
        if(toPNG) dev.off()
}