## loess regression to fit the trend in the early warning signals of imperfectly sampled temporal data.

seq_start<-1
seq_end<-20
main_dir<-'"give pathwhere the 3.scatterplot_data function file is stored "'
for (scatt_seq in seq_start:seq_end){
  
  file_path = paste0(main_dir,'scatt',scatt_seq,'.dat')
  print(file_path)
  dataF=read.table(file_path)
  
  dff<-data.frame()
  df<-loess.smooth(dataF[1],dataF[2], method = "loess")
  myfile <- format(Sys.time(), "scatt_regg_temporal")
  ddf<-data.frame(rbind(df$x,df$y))
  myfile2 <- file.path(main_dir, paste0(myfile,'_',scatt_seq,".dat"))
  
  
  write.table(ddf, file = myfile2, sep = " ", row.names = FALSE, col.names = FALSE,
              quote = FALSE, append = FALSE)
  
}
##########################################################################


