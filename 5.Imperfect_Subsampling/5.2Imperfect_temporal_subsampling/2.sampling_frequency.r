#'Description: Imperfect temporal sampling and  Generic Early Warning Signals for pre-transition timeseries data
#'
#'\code{imperfect_sampling_temporal} is used to estimate statistical moments within rolling windows along a irregularly sampled timeserie
#'
# Details:
#' see ref below
#'
# Arguments:
#'    @param corr is the correlation within the stochastic time series.
#'    @param seq_start is the minimum length of the sub-sampled time series. It is given in percentage.
#'    @param seq_end is the maximum length of the sub-sampled time series. It is given in percentage.
#'    @param total_files is the total number of the stochastic time series generated corresponding to a given noise correlation (corr).
#'    
#'    
# Returns:
#'   @return \code{imperfect_sampling_temporal} returns the kendall tau values corresponding to the generic early warning signals for irregularly sampled pre-transitrion timeseries data.


#'   @references Clements CF, Drake JM, Griffiths JI, Ozgul A (2015) 'Factors influencing the detectability
#'   of early warning signals of population collapse.' The American Naturalist 186(1):50–58

imperfect_sampling_temporal<- function(seq_start,seq_end,corr,total_files) {
  
#seq_start<-10
#seq_end<-100
#corr=0.16
#total_files<-100
search_dir<-'/home/'
main_dir<-'/home/DATA'

for(prob in seq_start:seq_end ){
  
  prob1=prob/100
  df_total<-data.frame()
  color_seq1<-corr*100
  color_seq<-data.frame(color_seq1)
  for (jj in 1:length(color_seq)) ## loop for noise color
  {
    ##make a blank array	
    df_total<-data.frame()
    
    out_dir=paste0(main_dir,'/k',color_seq[jj])
    for (kk in 1:total_files) ## loop for file no
    {
      new_data<-data.frame()
      ## read the actual file
      file_path = paste0(out_dir,'/sorted_data/K',color_seq[jj],'sim',kk,'.dat')
      print(file_path)
      dataF=read.table(file_path)

      ### data exrtaction ###
    
      dim_dataF=dim(dataF)
      len<-dim_dataF[1]
      data_extract_size<-(prob1)*len
      data_extract_generate<-sample.int(length(dataF$V1), data_extract_size)
      
      data_extract<-sort(data_extract_generate)
      ### irreglarly sampled data ###
      new_data<-data.frame(cbind(dataF$V1[data_extract],dataF$V2[data_extract]))
      
      xout<-min(new_data$X1):max(new_data$X1)
      #### interpolating the missing values ###
      new_data2<-approx(new_data$X1, new_data$X2,xout,method = "linear")
      

      new_data_ews<-data.frame(cbind(new_data2[[1]],new_data2[[2]]))
      ### calculating the generic early warning signals ###
      gg<-jj
      myfile<- format(Sys.time(), "ktau_temporal")
      out_path = paste0(search_dir,'/f',prob,'/',myfile,gg,".dat")
      
      out<- generic_ews(new_data_ews, winsize=50,detrending='gaussian', bandwidth=NULL,logtransform=FALSE,interpolate=FALSE)
      df <- data.frame(out)
      df_total <- rbind(df_total,df)
      ## storing the kendall tau values corresponding to each generic EWSs and correlated stochastic timeseries
      write.table(df_total, file=out_path, row.names=FALSE, col.names=FALSE)
    }
  }
}

}