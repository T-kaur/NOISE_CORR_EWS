start_index<-10
end_index<-100
main_dir<-'/home/'

for(sequence_index in start_index:end_index){
  out_dir=paste0(main_dir,'/f',sequence_index)
  dir.create(out_dir,showWarnings = FALSE)
  }

