function Lab3_3_b()
  read_from_file

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
  printf("NOT Gate for input probabilities (%f):\n",C)
  s = 1 - C
  Esw = 2 * s * (1 - s);
  printf("Switching Activity NOT: %f\n", Esw);
endfunction
function s = spXNOR(varargin)
    numInputs = nargin; 
    s = varargin{1}; % Initialize s with the first input
    for i = 2:numInputs
        s = s * varargin{i} + (1 - s) * (1 - varargin{i});
    end
    Esw = 2 * s * (1 - s);
    disp(['N-input XNOR Gate for input probabilities: ' num2str(cell2mat(varargin))]);
    printf("Switching Activity: %f\n", Esw);
end

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

function ReturnArray=testbench(choise,Signals_Table,inputs_array)
  printf("Testbench num: %d\n", choise);
  if (choise==1)
    for i = 1:length(inputs_array)
      Signals_Table(i) = round(mod(rand(),2));
    endfor
  elseif(choise ==2)
    AM = 0.4835;
    for i = 1:length(inputs_array)
      Signals_Table(i) = AM;
    endfor
   else
    for i = 1:length(inputs_array)
      Signals_Table(i) = 0.5;
    endfor
  endif
  ReturnArray = Signals_Table;
end 
function read_from_file
  Elements_Types = ["NOT","AND","OR","XOR","NAND","NOR","XNOR"];
  #Signals_Table = [1,1,0,0,0,0];
  fileID = fopen('C:\Users\GX\Desktop\9ο Εξαμηνο\Μικροεπεξεργαστες\Lab3\circuitfile.txt','r');  
  #disp(values_in_inputs_not_outputs);
  
  alphabet = 'abcdefghijklmnopqrstuvwxyz';
  charToNumberMap = containers.Map('KeyType', 'char', 'ValueType', 'double');

  for i = 1:length(alphabet);
      charToNumberMap(alphabet(i)) = i;
  end
  tline = fgetl(fileID);

  general = cell(1, 100);
  counter = 1;
  inputs = cell(1,100);
  outputs = cell(1,100);
  while ischar(tline)
      words = strsplit(tline, ' ');
      #words = split(tline);
      general{counter} = words{1}; #gates
      outputs{counter} = words{2};  #outputs 
      currentInputs = words(3:end);  % inputs
      % Convert currentInputs to numeric values
      numericInputs = zeros(size(currentInputs));
      for k = 1:length(currentInputs)
          numericInputs(k) = charToNumberMap(currentInputs{k});
      end
      outputs{counter} = charToNumberMap(outputs{counter});
      inputs{counter} = numericInputs; #inputs
      tline = fgetl(fileID);
      counter = counter + 1;
  end
   
  fclose(fileID); 
  general = general(1:counter-1);
  inputs  = inputs(1:counter -1);
  outputs = outputs(1:counter-1);
  
  s = struct('type',general ,'inputs',inputs,'outputs',outputs);
  
  # --- 2nd Method --- #
  values_in_inputs_not_outputs = setdiff([inputs{:}], [outputs{:}]);
  inputs_array = values_in_inputs_not_outputs
  
  #disp(s);
  maxOutputValue = max(cell2mat(outputs));
  Signals_Table = zeros(1, maxOutputValue);
  Signals_Table = testbench(1,Signals_Table,inputs_array)


  s.inputs;
  s.outputs;
  ElementsTable = s;
  

 printf('\n\nBegin Process\n\n');
  for i = 1:length(ElementsTable)
    if strcmp(ElementsTable(i).type , 'AND')    
      if (i != length(ElementsTable))
        printf('Mid output (type): "%s"\n' ,ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type): "%s"\n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).outputs) = spAND(Signals_Table(ElementsTable(i).inputs(1)) ,Signals_Table(ElementsTable(i).inputs(2)));
      printf('\n\n');
    elseif strcmp(ElementsTable(i).type , 'NOT')
      if (i != length(ElementsTable))
        printf('Mid output (type) : "%s"\n', ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type) : "%s"\n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).outputs) = spNOT(Signals_Table(ElementsTable(i).inputs(1)));
      printf('\n\n');
        elseif strcmp(ElementsTable(i).type , 'OR')
      if (i != length(ElementsTable))
        printf('Mid output (type) : "%s"\n', ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type) : "%s"\n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).output) = spOR(Signals_Table(ElementsTable(i).inputs(1)) ,Signals_Table(ElementsTable(i).inputs(2)));
      printf('\n\n');
    elseif strcmp(ElementsTable(i).type , 'XOR')
      if (i != length(ElementsTable))
        printf('Mid output (type) : "%s"\n', ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type) : "%s"\n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).output) = spXOR(Signals_Table(ElementsTable(i).inputs(1)) ,Signals_Table(ElementsTable(i).inputs(2)));
      printf('\n\n');
    elseif strcmp(ElementsTable(i).type , 'NAND')
      if (i != length(ElementsTable))
        printf('Mid output (type) : "%s"\n', ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type) : "%s"\n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).output) = spNAND(Signals_Table(ElementsTable(i).inputs(1)) ,Signals_Table(ElementsTable(i).inputs(2)));
      printf('\n\n');
    elseif strcmp(ElementsTable(i).type , 'NOR')
      if (i != length(ElementsTable))
        printf('Mid output (type) : "%s"\n', ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type) : "%s"\n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).output) = spNOR(Signals_Table(ElementsTable(i).inputs(1)) ,Signals_Table(ElementsTable(i).inputs(2)));
      printf('\n\n');
        elseif strcmp(ElementsTable(i).type , 'XNOR')
      if (i != length(ElementsTable))
        printf('Mid output (type) : "%s"\n', ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type) : "%s"\n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).output) = spXNOR(Signals_Table(ElementsTable(i).inputs(1)) ,Signals_Table(ElementsTable(i).inputs(2)));
      printf('\n\n');
    endif
  endfor

end