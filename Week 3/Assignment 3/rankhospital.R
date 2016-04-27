rankhospital <- function(state,outcome, num){
  hospital_ranks <-best(state, outcome)
  colnames(hospital_ranks) <- c("HospitalName", "Rate", "Rank")
  x<-hospital_ranks
  rate_order <- x$Rate[order(x$HospitalName, x$Rate)]
  name_order <- x$HospitalName[order(x$HospitalName,x$Rate)]
  hospital_names <- name_order[order(rate_order)]
  death_rate <- rate_order[order(rate_order)]
  y<- data.frame(hospital_names,death_rate)
  if(num == 'best'){
    num =1
  }
  if(num == 'worst'){
    num = nrow(hospital_ranks)
  }
  #print(as.character(y$hospital_name[num]))
  return(as.character(y$hospital_name[num]))
}