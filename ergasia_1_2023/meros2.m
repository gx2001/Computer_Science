function meros2_1()
#Step 1 : read image from drive 
f = imread('/home/gx2001/Desktop/cameraman.tif');
Q1 = [
    16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99;
];
Q2 = 3*Q1;
Q3 = 2*Q2;
Image1 = method(f,Q1);
Image2 = method(f,Q2);
Image3 = method(f,Q3);
psnr1 = compute_PSNR(f,Image1);
psnr2 = compute_PSNR(f,Image2);
psnr3 = compute_PSNR(f,Image3);
subplot(1,3,1)
imshow(Image1);
title(['PSNR : Q1 : ' num2str(psnr1)])
subplot(1,3,2)
imshow(Image2);
title(['PSNR : Q2 : ' num2str(psnr2)])
subplot(1,3,3)
imshow(Image3);
title(['PSNR : Q3 : ' num2str(psnr3)])

endfunction;
function Image = method(f,Q)
#Step 2 : Compute entropy of image = f
entropy_f = entropy(f);
#display(entropy_f);

#Step 3 : Separate the image to block(8x8)
#Just take values of these
[M,N] = size(f);
block_size = 8;
num_of_blocks_M = M/block_size;
num_of_blocks_N = N/block_size;
#---- Set all matrcices ----#
quantized_dct = zeros(M,N);
dct_image = zeros(M,N);
inverse_quantized_dct = zeros(M, N);
inverse_dct_image = zeros(M, N);
#--------------------------------------------------------#
 
#Step 4 : dct for every block

for i = 1:num_of_blocks_M
    for j = 1:num_of_blocks_N
        block = f((i - 1) * block_size+1:i*block_size,(j - 1)*block_size+1:j*block_size);
        dct_block = dct2(double(block));
        dct_image((i - 1) * block_size + 1 : i * block_size, (j - 1) * block_size + 1 : j * block_size) = dct_block;
    endfor
endfor
#plot(dct_image)

#Step 5 : quantize of DCT

for i = 1:num_of_blocks_M
    for j = 1:num_of_blocks_N
        dct_block = dct_image((i-1)* block_size + 1 :i* block_size,(j-1) * block_size + 1 : j * block_size);
        quantized_dct_block = round(dct_block ./ Q);
        quantized_dct((i - 1) * block_size +1 : i * block_size, (j-1) * block_size + 1 : j * block_size) = quantized_dct_block;
    end
end

#Step 6 : Entropy of absolute value of quantized DCT
abs_quantized_dct = abs(quantized_dct);
entropy_quantized = entropy(abs_quantized_dct);

#Step 7 : Compute zeros on an image 

total_zeros = 0;
for i=1 : M 
  for j =1: N 
    if (abs_quantized_dct(i,j) == 0)
      total_zeros =  total_zeros  +  1;
    endif
  endfor
endfor
#Step 8 : inverse quantize

for i = 1:num_of_blocks_M
    for j = 1:num_of_blocks_N
        quantized_block = quantized_dct((i - 1) * block_size + 1 : i * block_size, (j - 1) * block_size + 1 : j * block_size);
        inverse_quantized_block = quantized_block .* Q;
        inverse_quantized_dct((i - 1) * block_size + 1 : i * block_size, (j - 1) * block_size + 1 : j * block_size) = inverse_quantized_block;
    end
end


#Step 9: Compute iDCT for every block 

for i = 1:num_of_blocks_M
    for j = 1:num_of_blocks_N
        quantized_block = inverse_quantized_dct((i - 1) * block_size + 1 : i * block_size, (j - 1) * block_size + 1 : j * block_size);
        inverse_dct_block = idct2(quantized_block);
        inverse_dct_image((i - 1) * block_size + 1 : i * block_size, (j - 1) * block_size + 1 : j * block_size) = inverse_dct_block;
    end
end
#Step 10: Transform image into uint8

for i =1 : M 
  for j =1: N 
    if (inverse_dct_image(i,j) <= 0)
      inverse_dct_image(i,j)=0;
    elseif(inverse_dct_image(i,j) >= 255)
      inverse_dct_image(i,j) =255;
     endif
  endfor
endfor
inverse_dct_image = uint8(inverse_dct_image);
#imagesc(inverse_dct_image);
#colormap(gray);
Image  = inverse_dct_image;
endfunction
#Step 11:Compute Psnr and show image 
function psnr_value =compute_PSNR(image,f)
    psnr_value = psnr(image, f);
    display(psnr_value);
  endfunction