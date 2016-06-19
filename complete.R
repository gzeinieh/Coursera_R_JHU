complete <- function(directory, id = 1:332){
  
  x1 <- "/Users/George/Desktop/CourseraR"
  x2 <- as.character(directory)
  x<- paste(x1,x2,sep="/")
  setwd(x)
  nobs <- vector()
  

  
  for (i in 1:length(id)) {
    if (id[i]<10){fi1<-"00"}
    else if (id[i]<100) {fi1<-"0"}
    else {fi1<-""}
    fi2 <- id[i]
    fi3 <- ".csv"
    fi <- paste(fi1,fi2,fi3,sep="")
    data <-read.csv(as.character(fi))
    ready <- data$sulfate[!is.na(data$nitrate)]
    final <- ready[!is.na(ready)]
    nobs[i] <- length(final)
    
    
  }
  da<-data.frame(id,nobs)
  
  
  return(da)
}