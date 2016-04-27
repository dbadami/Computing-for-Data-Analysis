best <- function(state, outcome){
data <- read.csv('outcome-of-care-measures.csv')
# 11 17 23
data[,11] <- suppressWarnings(as.numeric(as.character(data[,11])))
data[,17] <- suppressWarnings(as.numeric(as.character(data[,17])))
data[,23] <- suppressWarnings(as.numeric(as.character(data[,23])))

s<- data$State
valid_state <- s == state
valid_data <- data[valid_state,]

if (nrow(valid_data)==0){
  stop('invalid state')
}

if (tolower(outcome)=='heart attack'){
  heart_attack_df <- data.frame(valid_data$Hospital.Name,valid_data[,11])
  colnames(heart_attack_df)<-c('State', '30-Day-Death')
  heart_attack_complete <- heart_attack_df[complete.cases(heart_attack_df),]  
  d<- heart_attack_complete
}

else if(tolower(outcome)=='heart failure'){
  heart_failure_df <- data.frame(valid_data$Hospital.Name,valid_data[,17])
  colnames(heart_failure_df)<-c('State', '30-Day-Death')
  heart_failure_complete <- heart_failure_df[complete.cases(heart_failure_df),] 
  d<- heart_failure_complete
}
else if(tolower(outcome)=='pneumonia'){
  pn_df <- data.frame(valid_data$Hospital.Name,valid_data[,23])
  colnames(pn_df)<-c('State', '30-Day-Death')
  pn_complete <- pn_df[complete.cases(pn_df),] 
  d<-pn_complete
}

else {
  stop('invalid outcome')
}

death <- as.numeric(d[,2])
hos <- as.character(d[,1])


rank_hos <- data.frame(hos,death,1:length(death))
return(rank_hos)

}


 
