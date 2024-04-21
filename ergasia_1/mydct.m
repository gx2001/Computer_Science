function ans = mydct(x)
  %delete comments with * to see some results of figures for test  
  
  #x = 0:0.1:10;
  #double_x = 0:0.1:20;
  l_x = length(x)
  #f =  sin(2*pi*15*x) + sin(2*pi*40*x); %Input f(x) 
  double_l_x = 2*l_x
  
  
  %*figure(1)
  %*plot(x,f)
  
  % Step 1 : f(x) -> g(x)
  
  g = x
  g1 = flip(x)
  
  
  % Step 2 : g(x) -> G(u)
  %I use fft in my solution which create the formula in excersise help
  %source -> https://ch.mathworks.com/help/signal/ug/discrete-fourier-transform.html
  G = fft(g);
  G1 = fft(g1);
  %*figure(2); 
  %*plot(2*x,G);
  
  %Step 3 : F(u)
  
  w = 1/sqrt(double_l_x);  #u=0 
  F = w*((G(1)*cos((2*0+1)*pi*0/double_l_x)) + (G1(1)*cos((2*0+1)*pi*0/double_l_x))); # F(1) or F(0)
  for u = 2:l_x 
      w=sqrt(2/l_x);
      F += w*(((G*cos((2*u+1)*pi*u/double_l_x))) + ((G1*cos((2*u+1)*pi*u/double_l_x) ) ) );
      #F +=w*(G+G1)*cos((2*u+1)*pi*u/double_l_x) 
  endfor
  
  %*figure(3);
  %*plot(2*x,F);
  
  ans =abs(F)
  