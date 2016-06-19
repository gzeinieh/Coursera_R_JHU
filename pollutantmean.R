pollutantmean <- function(directory, pollutant, id = 1:332){
  
  x1 <- "/Users/George/Desktop/CourseraR"
  x2 <- as.character(directory)
  x<- paste(x1,x2,sep="/")
  setwd(x)
  Means <- vector()
  
  for (i in id) {
    if (i<10){fi1<-"00"}
    else if (i<100) {fi1<-"0"}
    else {fi1<-""}
    fi2 <- i
    fi3 <- ".csv"
    fi <- paste(fi1,fi2,fi3,sep="")
    data <-read.csv(as.character(fi))
    if (pollutant=="sulfate"){
    poll <- data$sulfate
    }
    else {poll <- data$nitrate}
    u <- poll[!is.na(poll)]
    Means <- c(Means,u)
    
    
  }
  final <- mean(Means)
}