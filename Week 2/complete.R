complete <- function(directory,id){
  count <- numeric()
  for (i in id){
    data_file <-paste(directory,"/",sprintf("%.3d",as.numeric(i)),".csv",sep="")
    data<-read.csv(data_file)
    complete_cases_data <- complete.cases(data)
    len <- length(complete_cases_data)
    counter=0
    for (j in 1:len)
      if (complete_cases_data[j] == 1){
        counter=counter+1
      }
      count<-append(count,counter)
    }
   #new_data_frame <- data.frame(id,count)
   #names(new_data_frame)[2] <- "nobs"
   #print(new_data_frame)
   return(count)
  }
