
%%%
%%% N Monte Carlo permutations to be performed
%%%
%%% you run the program as:
%%% MCAND4(10) for 10 permutations
%%% MCAND4(100) for 100 permutations
%%% MCAND4(1000) for 1000 permutations
%%% etc...

function SwitchingActivity=MCAND4(N)
%% for dynamic power computation we need the switching activity
%% lets consider a 4 input AND gate with the following truth table:


%% I1 I2 I3 I4 | O
%%  X  X  X  0 | 0 
%%  X  X  0  X | 0 
%%  X  0  X  X | 0 
%%  0  X  X  X | 0 
%%  1  1  1  1 | 1



%% and lets try to find the power consumption of the following workload (remember workload is program)
%%
Workload=[0 0 0 0; 1 1 1 1; 0 0 0 1; 1 1 1 1; 0 1 0 1];

MonteCarloSize=N
for i = 1:MonteCarloSize
    Workload=[Workload; round(mod(rand(),2)), round(mod(rand(),2)), round(mod(rand(),2)), round(mod(rand(),2))]
end
vectorsNumber=size(Workload, 1);
gateInputsNumber=size(Workload, 2);
gateOutput=0&0&0&0;

switchesNumber=0;
for i = 1:vectorsNumber    
    NewGateOutput=Workload(i,1) &  Workload(i,2) & Workload(i,3) & Workload(i,4);
    %NewGateOutput
    if (gateOutput==NewGateOutput)
        continue;
    else
        gateOutput=NewGateOutput;
    end
    
    switchesNumber=switchesNumber+1;
end
switchesNumber
vectorsNumber
SwitchingActivity=switchesNumber/vectorsNumber
    

endfunction





%%
%%
%%