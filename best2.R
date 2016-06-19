best2 <- function (state, outcome){
  
  setwd("/Users/George/Desktop/CourseraR/rprog-data-ProgAssignment3-data")
  data <- read.csv("outcome-of-care-measures.csv")
  x <- data[,7]
    
  y <- c("heart attack", "heart failure",  "pneumonia")
    
  if (length(x[x==state])==0){stop('invalid state')}
  if (length(y[y==outcome])==0){stop('invalid outcome')}
  
  s <- split(data,data$State)
  state <- as.character(state)
  newdata <- as.data.frame(s[state])
  
  ##data <- data[order(data$State),]
  #c <- "Hospital.Name"
  #w <- paste(state,c, sep=".")
  #newdata <- newdata[order(w),]
  
  #which(a == min(a))
  
  if (outcome==y[1]){h <- which(as.numeric(newdata[,11])==min(as.numeric(newdata[,11])))}
  else if (outcome==y[2]){h <- which(as.numeric(newdata[,17])==min(as.numeric(newdata[,17])))}
  else {h <- which(as.numeric(newdata[,23])==min(as.numeric(newdata[,23])))}
  
  names <- newdata[,2]
  best <- names[h]
  best <- sort(best)
  print(best[1])
}