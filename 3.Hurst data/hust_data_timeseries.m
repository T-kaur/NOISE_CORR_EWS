

%% K:carrying capacity;r:maximum growth rate; c:maximum grazing rate; h:half saturation constant 
%% Generate multiple time series using Euler Maruyama method, for each value of the control parameter%%%%%
%% no_sim:Number of time series to be generated for the given parameter
%% n_max:number of timesteps;x0:initial condition. sigma and c are varied within a range in order to add variability across time series
%% corr:Correlation in stochastic fluctuations (change the value of corr to generate time series when system is perturbed with colored noise of different amplitude

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function xd=hurst_data_timeseries(c1,c_max,r,h,K,segments,no_sim,corr)


%% ====================================================================
%                   model parameters/ function arguemnets
%% ====================================================================
%corr=0.16;
%segments=50;
%no_sim=100;
%c1=10;r=1;K=100;h=10; 
%% ====================================================================
%% ====================================================================

global rr K h sigma
rng('shuffle');
ts=0:0.025:1000;             %%time span         
sigma=0.07;                  %% noise intensity    

%--------------------------------------
 %DETERMINISTIC TIMESERIES GENERATION
%--------------------------------------
f=@(t,z)[z(1)*(r*(1-z(1)/K)-c1*z(1)/(z(1)*z(1)+h*h))];
[ts,zz]=ode45(f,ts,90);      %% Using differential equation solver for fixed control parameter to get initial steady state conditions

%--------------------------------------
% STOCHASTIC TIMESERIES GENERATION
%--------------------------------------
x0=zz(end); %% setting initial conditions from values obtained using ode solver

mkdir('/home/Hurst DATA/model-1/k16')
datfile=corr*100;


cc=linspace(10,30,segments);   %%disctretizing the parameter range into "50" segments
for jj=1:length(cc)
    jj

    file_no=0;
for itr=1:no_sim
    
    file_no=file_no+1;
    fid(file_no) = fopen(sprintf('/home/Hurst DATA/model-1/k%d/C%d_sim%d_%d.dat',datfile,datfile,jj,file_no),'w' );
    
    
    c=cc(jj);
    t=0;
    n=0;xd=x0;
   
    
    t_max =1000;
    dt=0.025;
    n_max=t_max/dt;
  
    xi=abs(randn(1,1));
    xid=xi;
    
    while n<n_max
        %disp(n);
        n = n + 1;
	fprintf(fid(file_no),'%f %f\n',c,xd);

        w=randn(1,1);
     
	 %-------------------------------------------------------------------------------------------------- 
	 %                      Model Equation 
	 % =================================================================================================
	 % (replace model equations within while loop to generate time series corresponding to other models)
	 %--------------------------------------------------------------------------------------------------

         ssd=[rr*xd*(1-xd/K) ((c*xd*xd)/(xd*xd+h*h)) xid*xd*sqrt(dt) corr*xid+sigma*(sqrt(1-corr^2))*w];
         xd=xd+dt*(ssd(1)-ssd(2))+ssd(3);
         xid=ssd(4);
        
            end
     fclose(fid(file_no));
 end
end




 %-----------------------------------------------------------------------------------------------------------
 %     Ensemble average of the timeseries genertaed corresponding to a value of the control parameter 
 % ==========================================================================================================
 % This data is used in calculation of the Hurst exponent and network topolgies in visibility graph method.
 %-----------------------------------------------------------------------------------------------------------


 mkdir('/home/Hurst DATA/model-1/k16/sorted_data')

for jj1=1:length(cc)
    jj1
   
xx=[];

for n=1:no_sim
    n
     
    fid = fopen(sprintf('/home/Hurst DATA/model-1/k%d/sorted_data/C%d_C%d.dat',datfile,datfile,jj1),'w' );
    filename = sprintf('/home/Hurst DATA/model-1/k%d/C%d_sim%d_%d.dat',datfile,datfile,jj1,n) ;
    S = load(filename);
    x=S(:,2);
    
    xx=[xx x];
    mm=mean(xx'); % taking ensemble average of all the data for each value of the control parameter 
    
    fprintf(fid,'%f \n',mm);
    
    fclose(fid);
end
end

