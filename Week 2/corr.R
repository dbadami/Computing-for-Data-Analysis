corr <- function(directory,threshold=0) {
  res <- numeric()
  m <- 332
  for (i in 1:m){
    data_file <-paste(directory,"/",sprintf("%.3d",as.numeric(i)),".csv",sep="")
    data<-read.csv(data_file)
    complete_cases_data <- complete.cases(data)
    len <- length(complete_cases_data)
    data<-data[complete_cases_data,]
    counter=0
    for(j in 1:len){
      if(complete_cases_data[j]==1) {
        counter=counter+1
      }
    }
    if(counter>threshold){
      a <- cor(data[,2],data[,3])
      res <- append(res,a)
    }
  }
  return(res)
}