plot2 <- function(toPNG= TRUE){
        
        ## read input data
        ## note: using read.csv.sql function from sqldf library to filter the
        ##       data only for the 2 specific dates
        input <- read.csv.sql("household_power_consumption.txt",
                              sql = "select * from file where Date 
                              in ('1/2/2007','2/2/2007')",
                              sep=";")
        
        ## set device to png
        if(toPNG) png("plot2.png")
        ## do the plot
        # for x argument we paste date and time into one character vector 
        # and then convert it into a propper datetime format
        with(input, 
             plot( x=strptime(paste(Date,Time),
                                  format="%d/%m/%Y %H:%M:%S") , 
                   y=Global_active_power, 
                   type="l",            #type l for line plot
                   ylab="Global Active Power (kilowats)",
                   xlab=""
                         ) )
        
        ## finish plotting to png
        if(toPNG) dev.off()
}