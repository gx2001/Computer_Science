function ask2
  
  %Step 1: read an image
  image = imread("cameraman.tif");
  
  %Step 2: Entropy 
  entropy_image = entropy(image);
  
  %Step 3:Divides the image into 8 ? 8 blocks
  cropped_image = mat2cell(image,8*ones(1,size(image,1)/8),8*ones(1,size(image,2)/8),size(image,3));
  %display(cropped_image(2));
  %display(cropped_image(2));
  %display(cropped_image(1))
  
  %Step 4 : Dct in every block 
  for i = length(cropped_image)
    display(i);
    dct_image= dct2(cropped_image(i));    
  endfor
  #{
  %Step 5 : quantize Image with Q
  for i = length(cropped_image)
    display(i);
    idct2(cropped_image(i));    
  endfor
  
 
  
  