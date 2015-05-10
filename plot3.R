plot3 <- function(toPNG= TRUE){
        
        ## read input data
        ## note: using read.csv.sql function from sqldf library to filter the
        ##       data only for the 2 specific dates
        input <- read.csv.sql("household_power_consumption.txt",
                              sql = "select * from file where Date 
                              in ('1/2/2007','2/2/2007')",
                              sep=";")
        
        ## set device to png
        if(toPNG) png("plot3.png")
        ## do the plot
        # we use a single * with * so that we don't need to repeat the dataframe 
        # name in each function
        with(input,{
                #create main plot for Sub_metering_1
                plot( strptime(paste(Date,Time),
                                   format="%d/%m/%Y %H:%M:%S") ,
                      Sub_metering_1, type="l",
                      xlab="",ylab="Energy sub metering")
                

                #add line plots for Sub_metering_2 and 3
                lines( strptime(paste(Date,Time),
                                   format="%d/%m/%Y %H:%M:%S") ,
                       Sub_metering_2, col = "red")
                
                lines( strptime(paste(Date,Time),
                                   format="%d/%m/%Y %H:%M:%S") ,
                       Sub_metering_3, col="blue")
                
                #add a legend
                legend("topright", 
                       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                       col=c("black","red","blue"),lty = 1)
                }
        )
        
        

        ## finish plotting to png
        if(toPNG) dev.off()
}