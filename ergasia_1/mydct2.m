%GEORGE CHATZILIGOS AM 4835
function mydct2
  %8x8 array for test 
  a = [1 3 5 5 4 71 0 1;
       2 4 6 1 3 5 10 0; 
       7 8 10 4 6 1 3 5;
       1 3 5 5 4 71 0 1;
       2 4 6 1 3 5 10 0; 
       7 8 10 4 6 1 3 5;
       1 2 3 2 22 10 1 0;
       1 2 3 2 22 10 1 0];
  length(a)
  a_copy = a ; % I just made copy of original 8x8 array 
  %a_new = zeros(8,8);
  
  
  #1. Input of nxn array 
  #2. rows must be 2*n -> mydct()
  #3. columns must be 2*n ->  mydct()
  #4. in every column compute dct 
  #5. in every row compute dct
  
  for i = 1:length(a)
    rows = a(i,:);
    a_new(i,:) = mydct(rows);
  endfor
  display(a_new); %Print array after row dct 
  
  for j = 1:length(a)
    columns = a(:,j);
    a_new(:,j) += mydct(columns);
  endfor
  display(a_new);%Print array after column dct 
  correct_answer = dct2(a)
  
  %---------- Plots ---------%
  %figure(1)
  subplot(1,2,1)
  plot(a_new);
  subplot(1,2,2)
  plot(correct_answer);
  
  
  
  
  