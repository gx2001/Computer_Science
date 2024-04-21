%%%
%%%
%%% τρέχετε το πρόγραμμα ως:
%%% signalprobs(input1sp,input2sp)
%%%
%%% Παραδείγματα:
%%% >> signalprobs(0.5,0.5)
%%% AND Gate for input probabilities (0.500000 0.500000):
%%% ans =  0.25000
%%% OR Gate for input probabilities (0.500000 0.500000):
%%% ans =  0.75000
%%% XOR Gate for input probabilities (0.500000 0.500000):
%%% NAND Gate for input probabilities (0.500000 0.500000):
%%% NOR Gate for input probabilities (0.500000 0.500000):
%%%
%%%
%%% >> signalprobs(0,0)
%%% AND Gate for input probabilities (0.00000 0.00000):
%%% ans =  0
%%% OR Gate for input probabilities (0.00000 0.00000):
%%% ans =  0
%%% XOR Gate for input probabilities (0.00000 0.00000):
%%% NAND Gate for input probabilities (0.00000 0.00000):
%%% NOR Gate for input probabilities (0.00000 0.00000):
%%%
%%% >> signalprobs(1,1)
%%% AND Gate for input probabilities (1.00000 1.00000):
%%% ans =  1
%%% OR Gate for input probabilities (1.00000 1.00000):
%%% ans =  1
%%% XOR Gate for input probabilities (1.00000 1.00000):
%%% NAND Gate for input probabilities (1.00000 1.00000):
%%% NOR Gate for input probabilities (1.00000 1.00000):
%%%
%%%
%%%
%%% Οι συναρτήσεις που υπολογίζουν τα signal probabilities
%%% AND και OR πυλών δύο εισόδων έχουν ήδη υλοποιηθεί παρακάτω.
%%% Οι συναρτήσεις που υπολογίζουν τα signal probabilities
%%% XOR, NAND και NOR πυλών δύο εισόδων είναι ημιτελής.
%%% (α) Σας ζητείτε να συμπληρώσετε τις υπόλοιπες ημιτελής συναρτήσεις για τον υπολογισμό
%%% των signal probabilities XOR,NAND και NOR 2 εισόδων πυλών.
%%% (β) γράψτε συναρτήσεις για τον υπολογισμό των signal probabilities
%%% AND, OR, XOR, NAND, NOR πυλών 3 εισόδων
%%% (γ) γράψτε συναρτήσεις για τον υπολογισμό των signal probabilities
%%% AND, OR, XOR, NAND, NOR πυλών Ν εισόδων


function s = signalprobs(varargin)
  % Check for the number of input arguments
  numInputs = nargin;

  if numInputs < 2
    error('At least two input signal probabilities are required.');
  end

  % Calculate the signal probabilities for 2-input gates
  sp2AND(varargin{1}, varargin{2});
  sp2OR(varargin{1}, varargin{2});
  sp2XOR(varargin{1}, varargin{2});
  sp2NAND(varargin{1}, varargin{2});
  sp2NOR(varargin{1}, varargin{2});

  % Calculate the signal probabilities for 3-input gates
  if numInputs >= 3
    sp3AND(varargin{1}, varargin{2}, varargin{3});
    sp3OR(varargin{1}, varargin{2}, varargin{3});
    sp3XOR(varargin{1}, varargin{2}, varargin{3});
    sp3NAND(varargin{1}, varargin{2}, varargin{3});
    sp3NOR(varargin{1}, varargin{2}, varargin{3});
  end

  % Calculate the signal probabilities for N-input gates
  if numInputs >= 4
    spAND(varargin{:});
    spOR(varargin{:});
    spNAND(varargin{:});
    spNOR(varargin{:});
  end
endfunction
%

% 2-input AND gate truth table
% 0 0:0
% 0 1:0
% 1 0:0
% 1 1:1
%% signal probability calculator for a 2-input AND gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%%        s: output signal probability
function s=sp2AND(input1sp, input2sp)
  printf("AND Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = input1sp*input2sp
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
  endfunction

% 2-input OR gate truth table
% 0 0:0
% 0 1:1
% 1 0:1
% 1 1:1
%% signal probability calculator for a 2-input OR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%%        s: output signal probability
function s=sp2OR(input1sp, input2sp)
  printf("OR Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = 1-(1-input1sp)*(1-input2sp)
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction


% 2-input XOR gate truth table
% 0 0:0
% 0 1:1
% 1 0:1
% 1 1:0
%% signal probability calculator for a 2-input XOR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%%        s: output signal probability
%%% The signal probability for a XOR gate with 2 inputs is: sp=(1-pA)pB+pA(1-pB)
function s=sp2XOR(input1sp, input2sp)
  printf("XOR Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = input1sp * (1 - input2sp) + (1 - input1sp) * input2sp % <-- mine
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction


% 2-input NAND gate truth table
% 0 0:1
% 0 1:1
% 1 0:1
% 1 1:0
%% signal probability calculator for a 2-input XOR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%%        s: output signal probability
function s=sp2NAND(input1sp, input2sp)
  printf("NAND Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = 1 - input1sp * input2sp % <-- mine
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction



% 2-input NOR gate truth table
% 0 0:1
% 0 1:0
% 1 0:0
% 1 1:0
%% signal probability calculator for a 2-input NOR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%%        s: output signal probability
function s=sp2NOR(input1sp, input2sp)
  printf("NOR Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = (1 - input1sp) * (1 - input2sp) % <-- mine
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction

%function s=signalprobs(input1sp, input2sp, input3sp)
 % sp3AND(input1sp, input2sp, input3sp)
  %sp3OR(input1sp, input2sp, input3sp)
  %sp3XOR(input1sp, input2sp, input3sp);
  %sp3NAND(input1sp, input2sp, input3sp);
  %sp3NOR(input1sp, input2sp, input3sp);
%endfunction

% 3-input AND gate truth table
% 0 0 0:0
% 0 0 1:0
% 0 1 0:0
% 0 1 1:0
% 1 0 0:0
% 1 0 1:0
% 1 1 0:0
% 1 1 1:1
%% signal probability calculator for a 3-input AND gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%% input3sp: signal probability of third input signal
%%        s: output signal probability
function s=sp3AND(input1sp, input2sp, input3sp)
  printf("AND Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = input1sp * input2sp * input3sp
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction

% 3-input OR gate truth table
% 0 0 0:0
% 0 0 1:1
% 0 1 0:1
% 0 1 1:1
% 1 0 0:1
% 1 0 1:1
% 1 1 0:1
% 1 1 1:1
%% signal probability calculator for a 3-input OR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%% input3sp: signal probability of third input signal
%%        s: output signal probability
function s=sp3OR(input1sp, input2sp, input3sp)
  printf("OR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = 1 - (1 - input1sp) * (1 - input2sp) * (1 - input3sp) 
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction

% 3-input XOR gate truth table
% 0 0 0:0
% 0 0 1:1
% 0 1 0:1
% 0 1 1:0
% 1 0 0:1
% 1 0 1:0
% 1 1 0:0
% 1 1 1:1
%% signal probability calculator for a 3-input XOR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%% input3sp: signal probability of third input signal
%%        s: output signal probability
%%% The signal probability for a XOR gate with 3 inputs is: sp=(1-pA)(1-pB)pC+(1-pA)pB(1-pC)+pA(1-pB)(1-pC)+pApBpC
function s=sp3XOR(input1sp, input2sp, input3sp)
  printf("XOR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = input1sp * (1 - input2sp) * (1 - input3sp) + (1 - input1sp) * input2sp * (1 - input3sp) + (1 - input1sp) * (1 - input2sp) * input3sp + input1sp * input2sp * input3sp
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction

% 3-input NAND gate truth table
% 0 0 0:1
% 0 0 1:1
% 0 1 0:1
% 0 1 1:1
% 1 0 0:1
% 1 0 1:1
% 1 1 0:1
% 1 1 1:0
%% signal probability calculator for a 3-input NAND gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%% input3sp: signal probability of third input signal
%%        s: output signal probability
function s=sp3NAND(input1sp, input2sp, input3sp)
  printf("NAND Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = 1 - (input1sp * input2sp * input3sp)
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction

% 3-input NOR gate truth table
% 0 0 0:1
% 0 0 1:0
% 0 1 0:0
% 0 1 1:0
% 1 0 0:0
% 1 0 1:0
% 1 1 0:0
% 1 1 1:0
%% signal probability calculator for a 3-input NOR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%% input3sp: signal probability of third input signal
%%        s: output signal probability
function s=sp3NOR(input1sp, input2sp, input3sp)
  printf("NOR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = (1 - input1sp) * (1 - input2sp) * (1 - input3sp)
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction

% N-input AND gate function
function s=spAND(varargin)
  numInputs = nargin;
  s = varargin{1};
  for i = 2:numInputs
    s = s * varargin{i};
  end
  Esw = 2 * s * (1 - s);
  disp(['N-input AND Gate for input probabilities: ' num2str(cell2mat(varargin))]);
  s = s
  printf("Switching Activity: %f\n", Esw);
endfunction

% N-input OR gate function
function s = spOR(varargin)
  numInputs = nargin;
  s = 1 - prod(1 - [varargin{:}]);
  Esw = 2 * s * (1 - s);
  disp(['N-input OR Gate for input probabilities: ' num2str(cell2mat(varargin))]);
  s = s
  printf("Switching Activity: %f\n", Esw);
endfunction


% N-input NAND gate function
function s = spNAND(varargin)
  numInputs = nargin;
  s = 1;
  for i = 1:numInputs
    p = varargin{i};
    s = (s * p);
  end
  s = 1 - s;
  Esw = 2 * s * (1 - s);
  disp(['N-input NAND Gate for input probabilities: ' num2str(cell2mat(varargin))]);
  s = s
  printf("Switching Activity: %f\n", Esw);
endfunction

% N-input NOR gate function
function s = spNOR(varargin)
  numInputs = nargin;
  s = 1;
  for i = 1:numInputs
    p = varargin{i};
    s = s * (1 - p);
  end
  Esw = 2 * s * (1 - s);
  disp(['N-input NOR Gate for input probabilities: ' num2str(cell2mat(varargin))]);
  s = s
  printf("Switching Activity: %f\n", Esw);
endfunction