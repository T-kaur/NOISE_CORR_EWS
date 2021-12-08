#'Description: Gradient Change Analyses and  Generic Early Warning Signals for pre-transition timeseries data
#'
#'\code{gradient_change_ews} is used to estimate an abrupt shift in the state of a systems and measure statistical moments within rolling windows along a timeserie
#'
# Details:
#' see ref below
#'
# Arguments:
#'    @param corr is the correlation within the stochastic time series.
#'    @param total_files is the total number of the stochastic time series generated corresponding to a given noise correlation (corr).
#'    
#'    
# Returns:
#'   @return \code{gradient_change_ews} returns the time point where the abrupt shift in state of the system occurs such that:
#'   @return \item{ews_est}{gives the kendall tau values corresponding to the generic early warning signals for pre-transitrion timeseries data}
#'   @return \item{where_data}{the time point of the abrupt shift, i.e pre-transition timeseries}
#'  


#' @import as_detecet.R and where_as.R from:
#' @references Boulton CA, Lenton TM (2019) 'A new method for detecting abrupt shifts in time series.'
#' F1000Research 8(746):746

#corr=0.16;
gradient_change_ews <- function(corr,total_files) {

main_dir<-'/home/DATA'
output_dir<-'/home/RCodes'
color_seq1<-corr*100
color_seq<-data.frame(color_seq1)


for (jj in 1:length(color_seq)) ## loop for noise color
{
  print(jj)
  where_data<-data.frame()
  dff_total<-data.frame()
  read_dir=paste0(main_dir,'/k_',color_seq[jj])

  for (i in 1:total_files) ## loop for file no
  {

    ## read the actual file
    file_path = paste0(read_dir,'/k_',color_seq[jj],'_sim',i,'.dat')
    #print(file_path)
    dataFiles=read.table(file_path)
    
    t_len=length(dataFiles)
    gap<-40
    t_seq<-seq(1,t_len,1)
    d<-seq(1,t_len,gap)
    
    
    eg1<-data.frame(t_seq[d],dataFiles[d,3])
    colnames(eg1) <- c("t", "x")

    detect1 <- as_detect(eg1$x, dt=1) #run the detection algorithm
    where <- where_as(detect1$detect, dt=NA, thresh=0.7)
    where_data<-data.frame(rbind(where_data,where$as*gap))


    data_cut<-where$as_pos[1]*gap
    data_cut1<-data_cut-500


    data_pts<-seq(100,data_cut1,gap)
    dataF<-data.frame(dataFiles$V3[data_pts])
    out<- generic_ews(dataF, winsize=50,detrending='gaussian', bandwidth=NULL,logtransform=FALSE,interpolate=FALSE)
    df <- data.frame(out)
    ews_est <- rbind(ews_est,df)


  }
  # storing the data corresponding to time point of an abrupt shift  
  
  myfile1 <- format(Sys.time(), "/ktau")
  
  out_path1= paste0(output_dir,myfile1,color_seq1,".dat")
  write.table(ews_est, file=out_path1, row.names=FALSE, col.names=FALSE)

  # storing the data corresponding to time point of an abrupt shift  
  myfile2 <- format(Sys.time(), "/where")
  out_path2 = paste0(output_dir,myfile2,color_seq1,".dat")
  write.table(where_data, file=out_path2, row.names=FALSE, col.names=FALSE)
}

}
  
#######################################################################################################

#######################################################################################################
