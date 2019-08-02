pic1 = imread('./Assign1_imgs/mon.jpg');
pic2 = imread('./Assign1_imgs/lena.jpg');
% pic1 = rgb2gray(pic1);
pic2 = rgb2gray(pic2);
num1 = size(pic1, 1) * size(pic1, 1);
num2 = size(pic2, 1) * size(pic2, 1);

histogram1 = imhist(pic1); 
histogram2 = imhist(pic2);
cdf1 = cumsum(histogram1) / num1;
cdf2 = cumsum(histogram2) / num2;

lookuptable = zeros(256, 1, 'uint8'); 

for i = 1 : 256
    [value, ind] = min(abs(cdf2 - cdf1(i)));
    lookuptable(i) = ind - 1;
end

out = lookuptable(double(pic1)+1);
imshow(out);