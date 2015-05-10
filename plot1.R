plot1 <- function(toPNG= TRUE){
        ## read input data
        ## note: using read.csv.sql function from sqldf library to filter the
        ##       data only for the 2 specific dates
        input <- read.csv.sql("household_power_consumption.txt",
                                 sql = "select * from file where Date 
                                        in ('1/2/2007','2/2/2007')",
                                 sep=";")
        ## set device to png
        if(toPNG) png("plot1.png")
        
        ## do the plot
        hist(input$Global_active_power,col="red",
             xlab="Global Active Power (kilowats)", main ="Global Active Power")
        
        ## finish plotting to png
        if(toPNG) dev.off()
        
}