%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Import the spatially subsampled data file and save the data point corresponding to a particular early warning signal 
% This code stores for the RETURNRATE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
gap=8;
s1=[];
for prob=10:100
%%==================================================================================


%% k=0.16
filename1 = sprintf('/home/f%d/ktau_spatial1.dat',prob) ;
            S1 = load(filename1);
            len=length(S1);
            x=S1(6:gap:len,1);
            prob1=prob/100;
            y=prob1.*ones(length(x),1);
            
            s1=[s1; y x];
            save scatt1.dat s1 -ascii
          

end

%%===================================================================================


 
