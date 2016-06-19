rankhospital <- function (state, outcome, num = "best"){
  
  setwd("/Users/George/Desktop/CourseraR/rprog-data-ProgAssignment3-data")
  data <- read.csv("outcome-of-care-measures.csv",na.strings="Not Available",stringsAsFactors=FALSE)
  x <- data[,7]
  
  y <- c("heart attack", "heart failure",  "pneumonia")
  
  if (length(x[x==state])==0){stop('invalid state')}
  if (length(y[y==outcome])==0){stop('invalid outcome')}
  
  if (outcome==y[1]){h <- 11}
  else if (outcome==y[2]){h <- 17}
  else {h <- 23}
  
  newdata <- na.omit(data[,c(2,7,h)])
  
  s <- split(newdata,newdata$State)
  state <- as.character(state)
  newdata2 <- as.data.frame(s[state])
  
  names(newdata2) <- c("hospital", "state", "outcome")
  
  newdata3 <- newdata2[with(newdata2,order(outcome, hospital)),]
  
  if (num=="best"){z <- 1}
  else if (num=="worst"){z <- length(newdata3[,1])}
  else {z <- as.integer(num)}
  
  print(newdata3[z,1])
  
  
  
  
}