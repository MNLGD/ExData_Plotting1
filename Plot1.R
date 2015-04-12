Plot1 <-function(){
  #Plot a histogram of frequency of Global Active Power for the two dates specified.
  
  filename = "exdata_data_household_power_consumption.zip"
  if (!file.exists(filename)) {
    value <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                           destfile = filename)
  }
  
  ## Read the data from the contents of the zipped file
  data <- read.csv(unz(filename, "household_power_consumption.txt"), header=T,
                      sep=";", stringsAsFactors=F, na.strings="?",
                      )
  
  
  data$Date <- as.Date(as.character(data$Date),format='%d/%m/%Y')
  data$Time <- strptime(data$Time, format="%H:%M:%S")
 
  datasub <- subset(data, data$Date %in%c(as.Date('2007-02-01'), as.Date('2007-02-02')))

  png(filename="plot1.png", width=480, height=480)
  hist(datasub$Global_active_power, 
       col="red", xlab="Global Active Power (kilowatts)",  main="Global Active Power")
  dev.off()
 

}