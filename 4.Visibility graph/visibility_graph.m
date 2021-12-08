
%% no_sim:Number of time series to be generated for the given parameter
%% corr:Correlation in stochastic fluctuations (change the value of corr to generate time series when system is perturbed with colored noise of different amplitude.
%%The value of corr can be: -0.8,-0.64,-0.48,-0.32,-0.16,0,0.16,0.32,0.48,0.64,0.8. 
%% size:Size of the time series network (i.e., number of nodes)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x=visibility_graph(size,no_sim,corr)

%size=1000;  
%corr=0.16;

datfile=corr*100;

deg=[];Dens=[];clu=[];pathx = [];Het=[];
for jj1=1:no_sim
    jj1
    
    filename = sprintf('/home/Hurst DATA/model-1/k16/sorted_data/C16_C%d.dat',jj1);
    S = load(filename);
    x=S;
    
    
    tt=0.0:0.025:1000;
    %%create empty arrays
    x1=[];
    x2=[];
    
    
    for ii=round(linspace(1,length(x),size))
        
        x1=[x1; tt(ii)];
        x2=[x2; x(ii)];
    end
    
    
    A=zeros(size,size);

    for i =1:size
        for j=i+1:size
            if j==i+1
                A(i,j)=1;
            else
                count=0;
                for k=i+1:j-1
                    loop=i+1:j-1;
                    len2=length(loop);
                    if (x2(k)<x2(j)+(x2(i)-x2(j))*((x1(j)-x1(k))/(x1(j)-x1(i)))) %%checking for visibility condition
                         count=count+1;
                    end
                    if count==len2
                        A(i,j)=1;
                    end
                end
            end
        end
    end
    
    B=A+A';
    G=graph(B);
    %plot(G)
    %% ========================================================================
    %%                              Average deg
    %% ========================================================================
    dd=degree(G);
    dg=mean(dd);
    deg=[deg dg];
    save deg.dat deg -ascii
    %% ========================================================================
    %%                                Density
    %% ========================================================================     
    hh=G.Edges;
    a=find(A~=0);
    numEd=length(a);
    Dns=2*numEd/(size*(size-1));
    Dens=[Dens Dns];
    save dens.dat Dens -ascii

    %% ========================================================================
    %% 		              Clustering coefficient
    %% ========================================================================
    %% Clustgives c lustering coefficient
     Clust = clus_coeff(B);
     clu=[clu; Clust];
    save clust.dat clu -ascii

 
    %% ========================================================================
    %% 				   Heterogeneity
    %% ========================================================================
    
    hh=0;
    for i=1:size
        for j=i+1:size
            if (A(i,j)==1)
                hh=hh+((1/dd(i)^(1/2))-(1/dd(j)^(1/2))).^2;
            end
        end
    end
    ht=hh./(size-2*sqrt(size-1));
    Het=[Het ht];
    save Het.dat Het -ascii

    %% ========================================================================
end
