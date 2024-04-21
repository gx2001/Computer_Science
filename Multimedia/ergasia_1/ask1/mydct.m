function ans = mydct(x)
  %delete comments with * to see some results of figures for test  
  
  #x = 0:0.1:10;
  #double_x = 0:0.1:20;
  l_x = length(x);
  #f =  sin(2*pi*15*x) + sin(2*pi*40*x); %Input f(x) 
  double_l_x = 2*l_x;
  
  
  %*figure(1)
  %*plot(x,f)
  
  % Step 1 : f(x) -> g(x)
  for c = 1:double_l_x
    if (c>=l_x || c<=double_l_x-1);
      %display(c)
      g = flip(x);
    else
      display(c)
      g=x
    endif
  endfor
  
  % Step 2 : g(x) -> G(u)
  %I use fft in my solution which create the formula in excersise help
  %source -> https://ch.mathworks.com/help/signal/ug/discrete-fourier-transform.html
  G = fft(g);
  %*figure(2); 
  %*plot(2*x,G);
  
  %Step 3 : F(u)
  w = 1/sqrt(double_l_x);
  F = w*G(1)*cos((2*0+1)*pi*0/double_l_x);
  for u = 2:double_l_x -1
      w=sqrt(2/l_x);
      F += w*G*cos((2*u+1)*pi*u/double_l_x);
  endfor
  
  %*figure(3);
  %*plot(2*x,F);
  
  ans = F;
  