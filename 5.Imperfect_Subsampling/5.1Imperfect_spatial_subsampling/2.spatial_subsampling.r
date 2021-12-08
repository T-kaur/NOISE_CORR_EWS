#'Description: Imperfect spatial sub-sampling and  Generic Early Warning Signals for pre-transition timeseries data
#'
#'\code{imperfect_sampling_spatial} is used to estimate statistical moments within rolling windows along a irregularly sampled timeserie
#'
# Details:
#' see ref below
#'
# Arguments:
#'    @param corr is the correlation within the stochastic time series. Corr can take values: -0.8,-0.64,-0.48,-0.32,-0.16,0.0.16,0.32,0.48,0.64,0.8.
#'    @param seq_start is the minimum proportion of the habitat searched to sample the data. It is given in percentage.
#'    @param seq_end is the maximum proportion of the habitat searched to sample the data. It is given in percentage.
#'    @param total_files is the total number of the stochastic time series generated corresponding to a given noise correlation (corr).
#'    
#'    
# Returns:
#'   @return \code{imperfect_sampling_spatial} returns the kendall tau values corresponding to the generic early warning signals for spatially imperfect subsampled pre-transitrion timeseries data.


#'   @references Clements CF, Drake JM, Griffiths JI, Ozgul A (2015) 'Factors influencing the detectability
#'   of early warning signals of population collapse.' The American Naturalist 186(1):50–58

imperfect_sampling_spatial<- function(seq_start,seq_end,corr,total_files) {

#seq_start<-10
#seq_end<-100
#corr<-0.16
#total_files<-100
search_dir<-'/home'
main_dir<-'/home/DATA'

for(prob in seq_start:seq_end ){
prob1=prob/100
df_total<-data.frame()
color_seq1<-corr*100
color_seq<-data.frame(colore_seq1)
for (jj in 1:length(color_seq)) ## loop for noise color
{
  ##make a blank array	
 df_total<-data.frame()
 out_dir=paste0(main_dir,'/k',color_seq[jj])
 for (kk in 1:100) ## loop for file no
 {
  ## read the actual file
  file_path = paste0(out_dir,'/sorted_data/k',color_seq[jj],'_sim',kk,'.dat')
  print(file_path)
  dataF=read.table(file_path)
  
  ## random binomial distribution
  dataF$V3<-rbinom(length(dataF$V2), round(dataF$V2), prob=prob1)
  
  
  ### calculating the generic early warning signals ###
  myfile <- format(Sys.time(), "ktau_spatial")
  out_path = paste0(search_dir,'/f',prob,'/',myfile,color_seq1,".dat")
  
  out<- generic_ews(dataF$V3, winsize=50,detrending='gaussian', bandwidth=NULL,logtransform=FALSE,interpolate=FALSE)
  df <- data.frame(out)
  ## storing the kendall tau values corresponding to each generic EWSs and correlated stochastic timeseries
  df_total <- rbind(df_total,df)
  write.table(df_total, file=out_path, row.names=FALSE, col.names=FALSE)
 
 }
}
}
}
################################################################################################

