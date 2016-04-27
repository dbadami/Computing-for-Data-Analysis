agecount <- function(age = NULL){
  if(is.null(age)){
    stop("You have not entered an age!")
  }
  else{
    data<-readLines("homicides.txt")
    agg <- regexec("[A|a]ge: (.*?) years",data)
    agg <- regmatches(data,agg)
    ag <- sapply(agg, function(x) x[2])
    f <- is.na(ag)
    ag<-ag[!f]
    ag<- ag[ag==age]
    
    agg2<-regexec("male, (.*?) year",data)
    agg2 <- regmatches(data,agg2)
    ag2 <- sapply(agg2,function(x) x[2])
    f2 <- is.na(ag2)
    ag2 <- ag2[!f2]
    ag2 <-ag2[ag2==age]
    
    num <- length(ag)+length(ag2)
    print(num)
  }
}