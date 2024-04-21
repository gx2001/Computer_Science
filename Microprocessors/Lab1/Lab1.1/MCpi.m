pkg load geometry
function MCpi
  axis equal;
  x1 = 2;
  x2 = 2;
  r = 2;
  #Circle#
  #1.Center = 2 , 2 
  #2.r=2
  title ("rectangle() with FaceColor = green");
  sideSquere = 4;
  Esquere = sideSquere^2;
  Ecircle = (pi*sideSquere)^2;
  r = sideSquere/2;
  counter =0 ;
  N = 20000;
  #Check if Distance Point > R;
  #points = zeros(N,2)
  for row = 1:N;
    for col = 1:2;
      x = rand(1)*4;
      points(row,col) = x;
    end
  end
  display(points);
  
  h = drawCircle([x1,x2,r] , 'color' , 'r' );
  h1 = rectangle("Position",[0, 0 , 4 ,4]);

  hold on 
  title ("Pi:Mode Carlo");
  scatter(points(:,1),points(:,2),[],'g');
  axis([-1 5 -1 5]);
  
  for row = 1:N;
    cordX = points(row,1)
    cordY = points(row,2)
    distance = sqrt((cordX-2)^2 + (cordY-2)^2)
    if (distance<=r)
      counter = counter + 1;
    endif
  endfor
  display(counter);
  logos = counter / N ;
  PI = logos * 4;
  display(PI);
  
endfunction
