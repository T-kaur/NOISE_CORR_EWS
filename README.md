{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf610
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #-------------------------------------------------------------------------------------------------------------------\
\
#-------------------------------------------------------------------------------------------------------------------\
\
#1.Time series simulation\
\
\
Time series simulation contains "stochastic_timeseries_model-1.m file. This is used to generate a stochastic time series for varying noise correlation, and along changing the control parameter. \
The below example shows how the function works \
\
#usage: xd=stochastic_timeseries_model-1(c1,c_max,r,h,K,no_sim,corr)\
#uasage:\
xd=stochastic_timeseries_model-1(10,30,1,100,10,100,0.16)\
#This example code is for noise correlation, k=0.16\
\
\
The function creates a folder namely "DATA" and "k16" in the path:\
'/home/DATA/k16'\
xd returns the population abundance at each time step.\
Then 100 stochastic time series corresponding to "k16" are stored in the folder "k16". \
\
##change the value of "corr" for varying noise correlation\
\
#-------------------------------------------------------------------------------------------------------------------\
\
#2.Gradient change analyses\
\
\
This folder contains the code for gradient change analyses used to identify pre-transition data and measure the statistical EWSs.\
The gradient_change_ews() function is called  through Rcode gradient_change_ews.R" file. After generating the stochastic time series from "1.Stochastic Time series simulation", import the time series in line 25. \
The below example shows how the function works :\
\
## This file requires to import two additional Rcodes as_detect.R and where_as.R from the below mentioned reference.\
\
\
#usage: gradient_change_ews <- function(corr,total_files)\
out<-gradient_change_ews(0.16,100)\
#This example code is for noise correlation, k=0.16\
ews_est: gives the Kendall-tau values corresponding to the generic early warning signals for pre-transitrion timeseries data.\
where_data: the time point of the abrupt shift, i.e pre-transition timeseries.\
\
The data for ews_est and where_data is stored in the path '/home/RCodes/ktau16.dat' and '/home/RCodes/where16.dat', respectively.\
  \
NOTE:change the name of data file corresponding to each k in line 74.\
\
Reference\
--------------\
\
Boulton CA, Lenton TM (2019) A new method for detecting abrupt shifts in time series. F1000Research 8(746):746\
\
#----------------------------------------------------------------------------------------------------------------------------------------------\
#3.Hurst data\
\
\
This folder contains matlab code to generate stochastic time series used for the calculation of hurst exponents, for varying noise correlation.\
\
The below example shows how the function works\
\
\
#usage: xd=model1(c1,c_max,rr,h,K,segments,no_sim,corr)\
#usage:\
xd=model1(10,30,1,100,10,50,100,16)\
#This example code is for noise correlation, k=0.16\
\
This function divides the range of control parameter "c" into 50 segments and generate 100 stochastic time series for each segment and a fixed k.\
Further, we take the ensemble average of the 100 simulated data to obtain a timeseries for each "c" and "k". \
\
The final data is stored  in the path:\
'/home/Hurst DATA/model-1/k16/sorted_data/C16_C%d.dat' \
\
NOTE %d corresponds to the segment of the control parameter, varying from 1 to 50.\
NOTE: Using the Hurst data, follow the Multi-fractal Detrended Fluctuation Analyses to calculate Hurst exponents :\
\
Reference\
--------------\
Kantelhardt JW, Zschiegner SA, Koscielny-Bunde E, Havlin S, Bunde A, Stanley HE (2002) Multifractal detrended fluctuation analysis of nonstationary time series. Physica A: Statistical Mechanics and its Applications 316(1-4):87\'96114\
\
#------------------------------------------------------------------------------------------------------------------------------------------------\
#4.Visibility graph\
\
\
This is a matlab code, which constructs the time series network and estimate corresponding network properties, such as clustering coefficient, average degree, density, and heterogeneity.\
\
The network constructed is stored in an adjacency matrix A.\
\
deg:stores the data for average degree of the time series network.\
Dens: stores the data for network density.\
clu: stores the data for clustering coefficient.\
\
NOTE: clustering coefficient is calculated by calling a function "clus_coeff.m", which is stored in another Matlab file.\
Het: stores the data capturing heterogeneity properties.\
#------------------------------------------------------------------------------------------------------------------------------------------------\
#5.Imperfect_Subsampling\
\
\
This folder contains two folders "5.1Imperfect_spatial_subsampling" and "5.2Imperfect_temporal_subsampling".\
\
Reference\
--------------\
Clements CF, Drake JM, Griffiths JI, Ozgul A (2015) Factors influencing the detectability of early warning signals of population collapse. The American Naturalist 186(1):50\'9658.\
\
\
#====================================================\
5.1Imperfect_spatial_subsampling: \
#====================================================\
\
#create_folders.r\
First folders are created to store imperfectly subsampled data using file create_folders.R\
The folders are created in the path: '/home/f%d'\
NOTE: %d corresponds to the vlue in the sequence 10,11,12,...100.\
\
#spatial_subsampling.r\
"imperfect_sampling_spatial()  imports the stochastic time series for a fixed noise correlation and then sub-samples the data according to the proportion of habitat searched. The below example shows how the function works\
\
#imperfect_sampling_spatial<- function(seq_start,seq_end,corr,total_files)\
out<-imperfect_sampling_spatial(10,100,0.16,100)\
\
This examples subsamples each of the 100 simulated timeseries such that the spatial area investigated varies from 10% to 100%, for noise correlation=0.16.\
Then after spatial-subsampling, it calculates the generic early warning signals using generic_ews().\
\
out stores the estimated kendall tau values corresponding to each EWSs, noise correlation and the proportion of the habitat serached in a file  having path:\
'/home/f%prob/ktau_spatial16.dat' \
\
NOTE: %prob takes value according to the proportion of habitat searched, varying from 10 to 100.\
\
#scatterplot_data.m\
This matlab code stores the kendall tau estimates for the returnrate from the output file obtained from imperfect_spatial_sampling().\
The output stores the data in the file "scatt1.dat"\
#loess_regression.r\
loess_regression. r imports the scatt1.dat file obtained from "scatterplot_data.m"\
This code fits a trend in the kendall tau obtained along varying the proprotion of habitat searched, using loess regression. The regression curve and corresponding data are stored in the file "scatt_regg_spatia1.dat".\
\
\
#====================================================\
5.2Imperfect_temporal_subsampling: \
#====================================================\
This folder contains similar data files as in the "5.1Imperfect_spatial_subsampling". Here instead of thespatial subsampling the codes follw temporal subsampling. The working of each matlab and Rstudio file is similar.\
\
\
#------------------------------------------------------------------------------------------------------------------------------------------------\
#------------------------------------------------------------------------------------------------------------------------------------------------\
#-------------------------------------------------------------------------------------------------------------------\
\
#NOTE: We use MATLAB version R2015b or later to run each matlab programme\
#NOTE: R version 3.6.3 or later. Open using any platform such as Rstudio or Anaconda.\
\
\
Reference\
--------------\
\
Dakos V, Carpenter SR, Brock WA, Ellison AM, Guttal V, Ives AR, K\'e9fi S, Livina V, Seekell DA, van Nes EH, Scheffer M (2012a) Methods for Detecting Early Warnings of Critical Transitions in Time Series Illustrated Using Simulated Ecological Data. PLoS ONE 7:e41,010\
\
\
}