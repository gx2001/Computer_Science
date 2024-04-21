function a = meros2(Q)
  #GEORGIOS CHATZILIGOS AM4835
  %Step 1: read an image
  image = imread("cameraman.tif");
  Q = [16 11 10 16 24 40 51 61;
          12 12 14 19 26 58 60 55;
          14 13 16 24 40 57 69 56;
          14 17 22 29 51 87 80 62;
          18 22 37 56 68 109 103 77;
          24 35 55 64 81 104 113 92;
          49 64 78 87 103 121 120 101;
          72 92 95 98 112 100 103 99];
  #Q= 3*Q;
  #Q= 5*Q;
  %Step 2: Entropy 
  entropy_image = entropy(image);
  
  %Step 3:Divides the image into 8 × 8 blocks
  cropped_image = mat2cell(image,8*ones(1,size(image,1)/8),8*ones(1,size(image,1)/8));
  #x = 1:length(cropped_image)  
  #cropped_image(x)
  cropped_image{:}  ;
  #cropped_image = mat2cell(image,8,8)
  #dct2(cropped_image{1,1})
 
 
  %Step 4 : every 8 × 8 block do dct2 
  for i = 1:length(cropped_image)
      for j = 1:length(cropped_image)
          if (i==3 && j==1)
            
            image_dct{i,j} = dct2(cropped_image{i,j});
            #display(image_dct{i,j});
          endif
          image_dct{i,j} = dct2(cropped_image{i,j});
      endfor
  endfor
  #*image_dct (3,1)
  #*image_dct {3,3}
  
  %Step 5 : quantum F= round(f/Q)
  
  for i = 1:length(cropped_image)
      for j = 1:length(cropped_image)

          F{i,j} = round(image_dct{i,j}./Q);
      endfor
  endfor
  
  %Step 6 : entropy of F
  
   entropy_F =0;
   for i = 1:length(cropped_image)
      for j = 1:length(cropped_image)
          entropy_F += entropy(F{i,j}) ;
      endfor
  endfor
  %*entropy_F
  
  %Step 7 : counts zeros
  %*block = F{1,1};
  counter =0;
   for i = 1:length(cropped_image)
      for j = 1:length(cropped_image)
             block = F{i,j} ;
             for b1= 1:length(block)
               for b2= 1:length(block)
                  if (block(b1,b2)==0)
                   counter +=1;
                  endif
               endfor
             endfor
      endfor
  endfor
  
  %Step 8 : reverse quantum
 for i = 1:length(cropped_image)
      for j = 1:length(cropped_image)

          F{i,j} = round(F{i,j}*Q);
      endfor
  endfor
  
   %Step 9 : reverse tranfomation dct
    for i = 1:length(cropped_image)
      for j = 1:length(cropped_image)
  
          image_idct{i,j} =  idct2(F{i,j});
      endfor
  endfor
  
  %Step 10 : uint8 
  
    for i = 1:length(cropped_image)
      for j = 1:length(cropped_image)
  
          image_uint8{i,j} =  uint8(image_idct{i,j});
      endfor
  endfor
   
   %Step 11 : I join 8x8 blocks in one 256x256 and then PSNR

    
    #---------- SOS COMMENT ----------#
    #------------  I don't this part of code  is rigth -----------#
    #------------  see line 115 in comments compute -----------#
   C = cat(1,image_uint8{:});
   B= reshape(C,256,256);
   psnr_image=psnr(B,image);
   #B= colormap('gray');
   imagesc(B);
  
     
     
    #{
    #------------ Uncomment this -------------#
    #----- It's the same to do psnr between original cropped image(8x8) and image_uint8(8x8) ------#
    #------ With Summatation ------#
    sum_psnr=0;
    for i = 1:length(cropped_image)
      for j = 1:length(cropped_image)
        sum_psnr +=psnr(cropped_image{i,j},image_uint8{i,j}) ;
      endfor      
    endfor
    #}
  #psnr_image=psnr(new_image,image );
  
  
  
  
  