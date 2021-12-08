clear all
clc
gap=8;
s1=[];s2=[];s3=[];s4=[];s5=[];s6=[];s7=[];s8=[];s9=[];s10=[];
s11=[];s12=[];s13=[];s14=[];s15=[];s16=[];s17=[];s18=[];s19=[];s20=[];
for prob=10:100
    
%%k=-0.8    
filename1 = sprintf('/home/f%d/ktau_temporal3.dat',prob) ;
            S1 = load(filename1);
            len=length(S1);
            x1=S1(6:gap:len,1);
            prob1=prob/100;
            y1=prob1.*ones(length(x1),1);
            
            s1=[s1; y1 x1];   
            save scatt1.dat s1 -ascii
         
         
%%k=-0.48
filename1 = sprintf('/home/f%d/ktau_temporal4.dat',prob) ;
	    S1=load(filename1);            
	    len=length(S1);
            x2=S1(6:gap:len,1);
            prob1=prob/100;
            y2=prob1.*ones(length(x2),1);
            
            s2=[s2; y2 x2];
            save scatt2.dat s2 -ascii
            
%%k=0.48 
filename1 = sprintf('/home/f%d/ktau_temporal2.dat',prob) ;
	    S1 = load(filename1);
            len=length(S1);
            x3=S1(6:gap:len,1);
            prob1=prob/100;
            y3=prob1.*ones(length(x3),1);
            
            s3=[s3; y3 x3];
            save scatt3.dat s3 -ascii
            
            
%% k=0.8
filename1 = sprintf('/home/f%d/ktau_temporal1.dat',prob) ;
            S1 = load(filename1);
            len=length(S1);
            x4=S1(6:gap:len,1);
            prob1=prob/100;
            y4=prob1.*ones(length(x4),1);
            
            s4=[s4; y4 x4];
            save scatt4.dat s4 -ascii
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%k=-0.8
filename1 = sprintf('/home/f%d/ktau_temporal3.dat',prob) ;
            S1 = load(filename1);
            len=length(S1);
            x5=S1(1:gap:len,1);
            prob1=prob/100;
            y5=prob1.*ones(length(x5),1);
            
            s5=[s5; y5 x5];
            save scatt5.dat s5 -ascii
            
%% k=-0.48
filename1 = sprintf('/home/f%d/ktau_temporal4.dat',prob) ;
	    S1 = load(filename1);
            len=length(S1);
            x6=S1(1:gap:len,1);
            prob1=prob/100;
            y6=prob1.*ones(length(x6),1);
            
            s6=[s6; y6 x6];
            save scatt6.dat s6 -ascii
            
%%k=0.48
filename1 = sprintf('/home/f%d/ktau_temporal2.dat',prob) ;
	    S1 = load(filename1);
            len=length(S1);
            x7=S1(1:gap:len,1);
            prob1=prob/100;
            y7=prob1.*ones(length(x7),1);
            
            s7=[s7; y7 x7];
            save scatt7.dat s7 -ascii
            
            
%% k=0.8
filename1 = sprintf('/home/f%d/ktau_temporal1.dat',prob) ;     
            S1 = load(filename1);
            len=length(S1);
            x8=S1(1:gap:len,1);
            prob1=prob/100;
            y8=prob1.*ones(length(x8),1);
             
            s8=[s8; y8 x8];
            save scatt8.dat s8 -ascii
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%k=-0.8
filename1 = sprintf('/home/f%d/ktau_temporal3.dat',prob) ;
	    S1 = load(filename1);
            len=length(S1);
            x9=S1(2:gap:len,1);
            prob1=prob/100;
            y9=prob1.*ones(length(x9),1);
            
            s9=[s9; y9 x9];
            save scatt9.dat s9 -ascii
            
            
%% k=-0.48
filename1 = sprintf('/home/f%d/ktau_temporal4.dat',prob) ;
            S1 = load(filename1);
            len=length(S1);
            x10=S1(2:gap:len,1);
            prob1=prob/100;
            y10=prob1.*ones(length(x10),1);
            
            s10=[s10; y10 x10];
            save scatt10.dat s10 -ascii
            
%% k=0.48
filename1 = sprintf('/home/f%d/ktau_temporal2.dat',prob) ;
            S1 = load(filename1);
            len=length(S1);
            x11=S1(2:gap:len,1);
            prob1=prob/100;
            y11=prob1.*ones(length(x11),1);
            
            s11=[s11; y11 x11];
            save scatt11.dat s11 -ascii
            
            
%% k=0.8
filename1 = sprintf('/home/f%d/ktau_temporal1.dat',prob) ;
	    S1 = load(filename1);
            len=length(S1);
            x12=S1(2:gap:len,1);
            prob1=prob/100;
            y12=prob1.*ones(length(x12),1);
            
            
            s12=[s12; y12 x12];
            save scatt12.dat s12 -ascii
            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%k=-0.8
filename1 = sprintf('/home/f%d/ktau_temporal3.dat',prob) ;
            S1 = load(filename1);
            len=length(S1);
            x13=S1(8:gap:len,1);
            prob1=prob/100;
            y13=prob1.*ones(length(x13),1);
            
            s13=[s13; y13 x13];
            save scatt13.dat s13 -ascii
               
            
%% k=-0.48
filename1 = sprintf('/home/f%d/ktau_temporal4.dat',prob) ;
	    S1 = load(filename1);
            len=length(S1);
            x14=S1(8:gap:len,1);
            prob1=prob/100;
            y14=prob1.*ones(length(x14),1);
            
            s14=[s14; y14 x14];
            save scatt14.dat s14 -ascii



%% k=0.48
filename1 = sprintf('/home/f%d/ktau_temporal2.dat',prob) ;
	    S1=load(filename1);
	    len=length(S1);
            x15=S1(8:gap:len,1);
            prob1=prob/100;
            y15=prob1.*ones(length(x15),1);
            
            s15=[s15; y15 x15];
            save scatt15.dat s15 -ascii
            
%% k=0.8
filename1 = sprintf('/home/f%d/ktau_temporal1.dat',prob) ;
            S1=load(filename1);
            len=length(S1);
            x16=S1(8:gap:len,1);
            prob1=prob/100;
            y16=prob1.*ones(length(x16),1);
           
            s16=[s16; y16 x16];
            save scatt16.dat s16 -ascii
            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%k=-0.8
filename1 = sprintf('/home/f%d/ktau_temporal3.dat',prob) ;
	    S1 = load(filename1);
            len=length(S1);
            x17=S1(7:gap:len,1);
            prob1=prob/100;
            y17=prob1.*ones(length(x17),1);
            
            s17=[s17; y17 x17];
            save scatt17.dat s17 -ascii
            
            
%% k=-0.48
filename1 = sprintf('/home/f%d/ktau_temporal4.dat',prob) ;
	    S1 = load(filename1);
            len=length(S1);
            x18=S1(7:gap:len,1);
            prob1=prob/100;
            y18=prob1.*ones(length(x18),1);
            
            s18=[s18; y18 x18];
            save scatt18.dat s18 -ascii
            
%%k=0.48
filename1 = sprintf('/home/f%d/ktau_temporal2.dat',prob) ;
	    S1 = load(filename1);
            len=length(S1);
            x19=S1(7:gap:len,1);
            prob1=prob/100;
            y19=prob1.*ones(length(x19),1);
            
            s19=[s19; y19 x19];
            save scatt19.dat s19 -ascii
            
%% k=0.8
filename1 = sprintf('/home/f%d/ktau_temporal1.dat',prob) ;
	    S1 = load(filename1);
            len=length(S1);
            x20=S1(7:gap:len,1);
            prob1=prob/100;
            y20=prob1.*ones(length(x20),1);
            
            s20=[s20; y20 x20];
            save scatt20.dat s20 -ascii
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end


 
