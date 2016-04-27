count <- function(cause = NULL){
  causes_of_death <- c("asphyxiation", "blunt force" ,"other" ,"shooting","stabbing" ,"unknown")
  if (is.null(cause)){
    stop("Please enter a cause of death")
  } 
  else if(is.element(cause,causes_of_death)){
    homicides <- readLines("homicides.txt")
    r<- regexec("<dd>[c|C]ause: (.*?)</dd>",homicides)
    m<- regmatches(homicide,r)
    cod <- sapply(m, function(x) x[2])
    cod <- cod[!is.na(cod)]
    death <- cause==tolower(cod)
    cod<-cod[death]
    print(length(cod))
  }
  else{
    stop("You have not entered a valid cause of death!")
  }
}