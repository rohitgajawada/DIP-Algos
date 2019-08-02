function output = prob2d_a()

img = imread('./Assign2_imgs/notch_pass_reject_filter/notch1.png');

img = im2double(img);
Im = fft2(img);
Im = fftshift(Im);

Im(20:90,136:137) = 0;
Im(20:90,172:173) = 0;
Im(1:84,161:162) = 0;
Im(165:256,161:162) = 0;
Im(77:82,133:139) = 0;
Im(77:82,171:174) = 0;
Im(79:80,20:145) = 0;
Im(79:80,164:301) = 0;
Im(170:220,150:151) = 0;
Im(170:220,185:186) = 0;
Im(176:181,148:154) = 0;
Im(176:181,183:188) = 0;
Im(178:179,50:158) = 0;
Im(178:179,175:300) = 0;

output = ifft2(ifftshift(Im));

output=mat2gray(abs(output));

subplot(1,2,1); imshow(img);
subplot(1,2,2); imshow(output);

end
