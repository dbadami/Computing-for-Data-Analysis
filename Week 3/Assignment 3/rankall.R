rankall <- function(outcome, num = 'best'){
all_data <- read.csv('outcome-of-care-measures.csv')
allstates <- as.character(all_data$State)
allstates <- unique(allstates)
lengthstates <- length(allstates)
hospitals_vec <- c()
state_vec <- c()
for (i in 1:lengthstates){
  hospitals_vec <- c(hospitals_vec,rankhospital(allstates[i],outcome,num))
  state_vec <- c(state_vec,allstates[i])
}
final_df <- data.frame(hospitals_vec,state_vec)
colnames(final_df) <- c('hospital', 'state')
rownames(final_df) <- c(allstates[order(allstates)])
final_df$hospital<-final_df$hospital[order(final_df$state)]
final_df$state<-final_df$state[order(final_df$state)]
return(final_df)

}
