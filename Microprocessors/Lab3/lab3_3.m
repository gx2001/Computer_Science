function Lab3_3()
  read_from_file
  #{
  
  #import functions.signalprobs;
  Top_inputs = [1,2,3];
  Signals_Table = [1,1,0,0,0,0];
 
  len_signals = 0;

  Elements_Types = ["NOT","AND","OR","XOR","NAND","NOR","XNOR"];
  #ElementsTable = (E1, E2, E3, E4, E5, E6, E7, E8, E9);
  #Signals_Table = length(s.inputs) + length(s.output)
  #{
  for i = 1:length(Top_inputs)
    Signals_Table(i) = round(mod(rand(),2));
  endfor
  #}
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
  
  read_from_file
  #{
  for i = 1:length(ElementsTable)
     if strcmp(ElementsTable(i).type, 'AND')
         for j = 1:length(s(i).inputs) 
           
           inputIndex1 
           
         endfor
         inputIndex1 = ElementsTable(i).inputs(1);
         inputIndex2 = ElementsTable(i).inputs(2);
         ElementsTable(i).output = spAND(inputIndex1,inputIndex2);
      end
  end
  
 
  #{
  for i = 1:length(ElementsTable)
      if strcmp(ElementsTable(i).type, 'AND')
          inputIndex1 = ElementsTable(i).inputs(1);
          inputIndex2 = ElementsTable(i).inputs(2);
          ElementsTable(i).output = spAND(inputIndex1,inputIndex2);
      end
  end
#}
  #s(1).output = sp2AND(s(1,1).inputs,s(1,2).inputs);
  #}
#}
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
  s = 1 - C
  Esw = 2 * s * (1 - s);
  printf("Switching Activity NOT: %f\n", Esw);
endfunction

function testbench
  
end 

function read_from_file
  Elements_Types = ["NOT","AND","OR","XOR","NAND","NOR","XNOR"];
  Signals_Table = [1,1,0,0,0,0];
  fileID = fopen('C:\Users\Stathis\circuitfile2.txt','r');  
  inputs_array = fgetl(fileID);
  inputs_array = erase(inputs_array(:,12:length(inputs_array)) , " ");
  length(inputs_array);
  inputs_array = char(inputs_array);
  alphabet = 'abcdefghijklmnopqrstuvwxyz';
  charToNumberMap = containers.Map('KeyType', 'char', 'ValueType', 'double');

  for i = 1:length(alphabet);
      charToNumberMap(alphabet(i)) = i;
  end
  numericValueOfA = charToNumberMap('a');

  for j = 1:length(inputs_array);
    numericValueOfInputs(j) = charToNumberMap(inputs_array(j));
  endfor  
  numericValueOfInputs ;#Inputs#
  Top_inputs = numericValueOfInputs;
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
  outputs = outputs(1:counter-1)


  s = struct('type',general ,'inputs',inputs,'outputs',outputs);
  #s(3).type
  #disp(s);
  s.inputs
  s.outputs
  ElementsTable = s;
  % Custom sorting key: place elements with inputs in Top_inputs at the beginning
  customSortKey = arrayfun(@(el) any(ismember(el.inputs, Top_inputs)), ElementsTable);

  % Sort ElementsTable using the custom sorting key
  [~, sortIndices] = sort(customSortKey, 'descend');
  ElementsTable = ElementsTable(sortIndices);

  % Print the sorted ElementsTable
  fprintf('\nSorted ElementsTable:\n');
  disp(ElementsTable)
  Signals_Table(ElementsTable(1).inputs(1))
  printf('\n\nBegin Process\n\n');
  for i = 1:length(ElementsTable)
    if strcmp(ElementsTable(i).type , 'AND')    
      if (i != length(ElementsTable))
        printf('Mid output (type): "%s"\n' ,ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type): "%s"\n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).outputs) = sp2AND(Signals_Table(ElementsTable(i).inputs(1)) ,Signals_Table(ElementsTable(i).inputs(2)));
      printf('\n\n');
    elseif strcmp(ElementsTable(i).type , 'NOT')
      if (i != length(ElementsTable))
        printf('Mid output (type) : "%s"\n', ElementsTable(i).type);
      elseif(i == length(ElementsTable))
        printf('Last output (type) : "%s"\n' , ElementsTable(i).type);
      endif
      Signals_Table(ElementsTable(i).outputs) = spNOT(Signals_Table(ElementsTable(i).inputs(1)));
      printf('\n\n');
    endif
  endfor

    ElementsTable(1).inputs
    ElementsTable(1).outputs
    ElementsTable(2).inputs
end