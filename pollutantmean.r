pollutantmean<- function(directory, pollutant,id=1:332){
  dir<-paste(getwd(),"/",directory, "/", sep="")
  files<-list.files(dir)
  result<-0
  
  for (i in 1:length(id)){
    connection<-file(paste(getwd(),"/",directory,"/",files[id[i]],sep=""),"r")
    initial<-read.table(connection,nrows=100)
    classes<-sapply(initial,class)
    data<-read.table(connection,sep = ",",colClasses = classes)
    close(connection)
    names(data)<-c("Date","sulfate","nitrate","id")
    
    pollutantData<-data[pollutant]
    result<-result+mean(as.numeric(pollutantData[!is.na(pollutantData)]))
    
  }
  result
}
