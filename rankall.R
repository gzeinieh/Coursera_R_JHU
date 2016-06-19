rankall <- function (outcome, num = "best"){
  
  setwd("/Users/George/Desktop/CourseraR/rprog-data-ProgAssignment3-data")
  data <- read.csv("outcome-of-care-measures.csv",na.strings="Not Available",stringsAsFactors=FALSE)
 
  
  y <- c("heart attack", "heart failure",  "pneumonia")
  
  if (length(y[y==outcome])==0){stop('invalid outcome')}
  
  
  if (outcome==y[1]){h <- 11}
  else if (outcome==y[2]){h <- 17}
  else {h <- 23}
  
  newdata <- na.omit(data[,c(2,7,h)])
  
  s <- split(newdata,newdata$State)
  s <- lapply(s,function(x) x[with(x,order(x[,3],x[,1])),])
  
  
  if (num=="best"){z <- 1}
  #else if (num=="worst"){z <- length(newdata3[,1])}
  else {z <- as.integer(num)}
  
  l <- length(s)
  
  table <- data.frame(hospital=0,state=0)
  
  if (num=="worst"){
    for (i in 1:l){
      sta <- as.data.frame(s[i])
      table[i,1] <- as.character(sta[length(sta[,1]),1])
      table[i,2] <- as.character(names(s[i]))
      sta <- data.frame()
    
    }
  }
  
  else {
    
    for (i in 1:l){
    sta <- as.data.frame(s[i])
    table[i,1] <- as.character(sta[z,1])
    table[i,2] <- as.character(names(s[i]))
    sta <- data.frame()
  }
  }
table
  
  
  
  
}