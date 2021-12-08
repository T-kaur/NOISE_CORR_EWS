
%% K:carrying capacity;r:maximum growth rate; c:maximum grazing rate; h:half saturation constant 
%% Generate multiple time series using Euler Maruyama method%%%%%%
%% corr:Correlation in stochastic fluctuations (change the value of corr to generate time series when system is perturbed with colored noise of different amplitude
% corr can take values as: -0.8,-0.64,-0.48,-0.32,-0.16,0,0.16,0.32,0.48,0.64,0.8
%% no_sim:Number of time series to be generated for the given parameters
%% n_max:number of timesteps;x0:initial condition. sigma and c are varied within a range in order to add variability across time series

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function xd=stochastic_timeseries_model1(c1,c_max,r,h,K,no_sim,corr)

global sigma 
rng('shuffle');

ts=0:0.025:1000;         %%time span
%c1=10;		         %%initial value of the control parameter
%r=1;K=100;h=10;         %% model parameters
sigma=0.07;              %%noise intensity




f=@(t,z)[z(1)*(r*(1-z(1)/K)-c1*z(1)/(z(1)*z(1)+h*h))];
[ts,zz]=ode45(f,ts,90); %% ode solver

%--------------------------------------
% STOCHASTIC TIMESERIES GENERATION
%--------------------------------------



x0=zz(end); %% setting initial conditions from values obtained using ode solver
file_no=0;


%corr=0.16;  %% noise correlation
mkdir('/home/DATA/k16')

%no_sim=1;

for itr=1:no_sim
   
    file_no=file_no+1;
    fid(file_no) = fopen(sprintf('/home/DATA/k16/k16_sim%d.dat',itr),'w' );
    
    t=0; 
    n=0;
    xd=x0;
    c=10;         
    c_max=30;      
    t_max =1000;   
    dt=0.025;     
    n_max=t_max/dt;
    dc=(c_max-c)/n_max; 
    xi=abs(randn(1,1));
    xid=xi;
    
    while n<n_max
        %disp(n);
        fprintf(fid(file_no),'%f %f %f\n',n, c,xd);
        n = n + 1;
        c=c+dc;
        w=randn(1,1);

        %-------------------------------------------------------------------------------------------------- 
        %                      Model Equation 
        % =================================================================================================
        % (replace model equations within while loop to generate time series corresponding to other models)
        %--------------------------------------------------------------------------------------------------
        ssd=[r*xd*(1-xd/K) ((c*xd*xd)/(xd*xd+h*h)) xid*xd*sqrt(dt) corr*xid+sigma*(sqrt(1-corr^2))*w];
       
	xd=xd+dt*(ssd(1)-ssd(2))+ssd(3);
        xid=ssd(4);
      
        
        
    end 
end
fclose(fid);
