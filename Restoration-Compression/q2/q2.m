clear all;
img = rgb2gray(imread('../Assign4_imgs/Uncompressed_01.bmp'));

%perform fft compression: doubt with fft
n = 8;
qmatrix_fft = zeros(n, n);
qmatrix_fft(n, 1: n) = ones(1, n); 
qmatrix_fft(n, 1: n) = ones(1, n);
qmatrix_fft(1: n, 1) = ones(1, n);
qmatrix_fft(1, 1: n) = ones(1, n); 


dft = @(block_struct) ifft2(qmatrix_fft .* (fft2(block_struct.data)));
im_dft = blockproc(double(img), [8 8], dft);
RMSE_dft = RMSE(img, abs(im_dft));

%perform dct compression:
C = 2;
img_dct = myDCT_quantization(myDCT(img, create_mat_dct(8)), C);
im_new = myIDCT(myDCT_dequantization(img_dct, C), create_mat_dct(8));
RMSE_dct = RMSE(img, im_new);

%perform wavelet transform compression
[ll, lh, hl, hh] = dwt2(img, 'haar');
thres = 70;
ll = ll .* (ll > thres);
lh = lh .* (lh > thres);
hl = hl .* (hl > thres);
hh = hh .* (hh > thres);

im_dwt = idwt2(ll, lh, hl, hh, 'haar', size(img));
RMSE_dwt = RMSE(img, im_dwt);

%Visualize
subplot(2,2,1);
imshow(uint8(img));
title('Original image');

subplot(2,2,2);
imshow(uint8(abs(im_dft)));
title('DFT compression')
disp(RMSE_dft);

subplot(2,2,3);
imshow(uint8(im_new));
title('DCT compression');
disp(RMSE_dct);

subplot(2,2,4);
imshow(uint8(im_dwt));
title('DWT compression');
disp(RMSE_dwt);