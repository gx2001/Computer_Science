function Lab3_1()
  
  
  
  #import functions.signalprobs;
  Top_inputs = [1,2,3];
  Signals_Table = [1,1,0,0,0,0];
 
  len_signals = 0;

  Elements_Types = ["NOT","AND","OR","XOR","NAND","NOR","XNOR"];

  Signals_Table
  s(1).type = "AND";
  s(1).inputs = [1,2];
  s(1).output = 5;
  
  
  length(s(1).inputs)
  
  s(2).type = "NOT";
  s(2).inputs = [3];
  s(2).output = 6;

  s(3).type = "AND";
  s(3).inputs = [5,6];
  s(3).output = 4;
  
  
  ElementsTable = s;
  
  #Signals_Table(ElementsTable(1).inputs(1))
  Signals_Table(ElementsTable(1).inputs(1))
  printf('\n\nBegin Process\n\n');
  for i = 1:length(ElementsTable)
    if strcmp(ElementsTable(i).type , 'AND')    
      if (i != length(ElementsTable))
        printf('Mid output (type): "%s"\n' ,ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type): \n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).output) = sp2AND(Signals_Table(ElementsTable(i).inputs(1)) ,Signals_Table(ElementsTable(i).inputs(2)));
      printf('\n\n');
    elseif strcmp(ElementsTable(i).type , 'NOT')
      if (i != length(ElementsTable))
        printf('Mid output (type) : "%s"\n', ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type) : "%s"\n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).output) = spNOT(Signals_Table(ElementsTable(i).inputs(1)));
      printf('\n\n');
    endif
  endfor
  
endfunction
function s=sp2AND(input1sp, input2sp)
  printf("AND Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = input1sp*input2sp
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
  endfunction
function s=sp2OR(input1sp, input2sp)
  printf("OR Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = 1-(1-input1sp)*(1-input2sp);
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction
function s=sp2XOR(input1sp, input2sp)
  printf("XOR Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = input1sp * (1 - input2sp) + (1 - input1sp) * input2sp; % <-- mine
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction
function s=sp2NAND(input1sp, input2sp)
  printf("NAND Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = 1 - input1sp * input2sp; % <-- mine
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction
function s=sp2NOR(input1sp, input2sp)
  printf("NOR Gate for input probabilities (%f %f):\n",input1sp,input2sp)
  s = 1 - (1 - input1sp) * (1 - input2sp); % <-- mine
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction
function s=sp3AND(input1sp, input2sp, input3sp)
  printf("AND Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = input1sp * input2sp * input3sp;
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction
function s=sp3OR(input1sp, input2sp, input3sp)
  printf("OR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = 1 - (1 - input1sp) * (1 - input2sp) * (1 - input3sp) ;
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction
function s=sp3XOR(input1sp, input2sp, input3sp)
  printf("XOR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = input1sp * (1 - input2sp) * (1 - input3sp) + (1 - input1sp) * input2sp * (1 - input3sp) + (1 - input1sp) * (1 - input2sp) * input3sp;
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction
function s=sp3NAND(input1sp, input2sp, input3sp)
  printf("NAND Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = 1 - (input1sp * input2sp * input3sp);
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction
function s=sp3NOR(input1sp, input2sp, input3sp)
  printf("NOR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
  s = 1 - (1 - input1sp) * (1 - input2sp) * (1 - input3sp);
  Esw = 2 * s * (1 - s);
  printf("Switching Activity: %f\n", Esw);
endfunction

% N-input NAND gate function
function s=spAND(varargin)
  numInputs = nargin;
  s = varargin{1};
  for i = 2:numInputs
    s = s * varargin{i};
  end
  Esw = 2 * s * (1 - s);
  disp(['N-input AND Gate for input probabilities: ' num2str(cell2mat(varargin))]);
  printf("Switching Activity: %f\n", Esw);
endfunction
function s=spNOT(C)
  s = 1 - C
  Esw = 2 * s * (1 - s);
  printf("Switching Activity NOT: %f\n", Esw);
endfunction

function testbench
  
end 