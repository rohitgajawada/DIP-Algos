function output = prob2d_b()

img = imread('./Assign2_imgs/notch_pass_reject_filter/notch2.jpg');

img = im2double(img);
Im = fft2(img);
Im = fftshift(Im);

Im(37:44,107:108) = 0;
Im(40:41,105:110) = 0;
Im(89:90,20:25) = 0;
Im(85:95,22:23) = 0;
Im(8:12,22:23) = 0;
Im(120:124,22:23) = 0;
Im(6:10,107:108) = 0;
Im(118:122,107:108) = 0;
Im(77,80:92) = 0;
Im(71:83,86) = 0;
Im(53,38:50) = 0;
Im(47:59,44) = 0;

ansI = ifft2(ifftshift(Im));
ansI=mat2gray(abs(ansI));

subplot(1,2,1); imshow(img);
subplot(1,2,2); imshow(ansI);

end
