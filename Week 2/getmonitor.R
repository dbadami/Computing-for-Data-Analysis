getmonitor <- function(id, directory, summarize = FALSE) {
  datafile <- paste(directory,"/",sprintf("%.3d",as.numeric(id)),".csv",sep="")
  sensor_data <- read.csv(datafile)
  if (summarize == 1){
    print(summary(data))}
  return(sensor_data)}
