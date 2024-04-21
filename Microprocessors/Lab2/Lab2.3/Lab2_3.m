
%%%
%%% N Monte Carlo permutations to be performed
%%%
%%% you run the program as:
%%% MCAND4(10) for 10 permutations
%%% MCAND4(100) for 100 permutations
%%% MCAND4(1000) for 1000 permutations
%%% etc...

function SwitchingActivity=Lab2_3(N)
%% for dynamic power computation we need the switching activity
%% lets consider a 4 input AND gate with the following truth table:


%%  A  B  C | O
%%  0  X  X | 0 
%%  X  0  X | 0 
%%  X  0  X | 0 
%%  X  X  1 | 0 
%%  1  1  0 | 1

#--- Truth Table ---#
  %%  A  B  C | O
  %%  0  0  0 | 0 
  %%  0  0  1 | 0 
  %%  0  1  0 | 0 
  %%  0  1  1 | 0 
  %%  1  0  0 | 0
  %%  1  0  0 | 0 
  %%  1  0  1 | 0 
  %%  1  1  0 | 1 
  %%  1  1  1 | 0 

%% and lets try to find the power consumption of the following workload (remember workload is program)
%%

Workload=[0 0 0; 1 1 1; 0 0 0; 1 1 1 ; 0 1 0];#Random Set of Workload#

MonteCarloSize=N
#Make some samples of Workload#
for i = 1:MonteCarloSize
    Workload=[Workload; round(mod(rand(),2)), round(mod(rand(),2)), round(mod(rand(),2))];
end
display(Workload);
vectorsNumber=size(Workload, 1);
gateInputsNumber=size(Workload, 2);
#Set start Values for Gates#
gtemp = !0; 
gateOutE = (0&0);
gateOutput= ((0&0)) & gtemp;

#------ Monte Carlo for Not Gate ------#
switchesNumberC = 0;
for i = 1:vectorsNumber    
    NewGateOutput=(! Workload(i,3));
    if (gtemp==NewGateOutput)
        continue;
    else
        gtemp=NewGateOutput;
    end
    
    switchesNumberC=switchesNumberC+1;
end
#------ Monte Carlo for And Gate ------#
switchesNumberE=0;
for i = 1:vectorsNumber    
    NewGateOutput=(Workload(i,1) &  Workload(i,2)));
    if (gateOutE==NewGateOutput)
        continue;
    else
        gateOutE=NewGateOutput;
    end
    
    switchesNumberE=switchesNumberE+1;
end
#------ Monte Carlo for Curcuit ------#
switchesNumberD=0;
for i = 1:vectorsNumber    
    NewGateOutput=(Workload(i,1) &  Workload(i,2)) & (! Workload(i,3));
    if (gateOutput==NewGateOutput)
        continue;
    else
        gateOutput=NewGateOutput;
    end
    
    switchesNumberD=switchesNumberD+1;
end
#---- Results ----#
switchesNumberC
switchesNumberE
switchesNumberD
vectorsNumber
SwitchingActivityE=switchesNumberE/vectorsNumber 
SwitchingActivityF=switchesNumberC/vectorsNumber 
SwitchingActivity=switchesNumber/vectorsNumber 
endfunction
