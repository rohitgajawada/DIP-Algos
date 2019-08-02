pic = imread('Assign1_imgs/bell.jpg');
pic = im2double(pic);

% gaussian filtering
fsize = 5;
sigma = 10;
inds = -floor(fsize/2) : floor(fsize/2);
[X Y] = meshgrid(inds, inds);

gf = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));
total = sum(gf(:));
gf = gf / total;
output1 = imfilter(pic, gf);
imshow(output1);

% median filtering
% fsize = 8;
% ind = floor(fsize / 2);
% tempimg = pic;
% pic = padarray(pic, [floor(fsize/2) floor(fsize/2)]);
% dim = size(pic);
% ht = dim(1);
% wid = dim(2);
% for c = 1: 3
%     for i = 1 + ind: ht - ind
%         for j = 1 + ind: wid - ind
%             box = pic(i - ind: i + ind, j - ind: j + ind, c);
%             box = reshape(box, [1, size(box, 1) * size(box, 1)]);
%             medval = median(box);
%             tempimg(i, j, c) = medval;
%         end
%     end
% end
% imshow(tempimg);
% 
% %highboost filtering
% lambda = 3;
% sharp = pic - output1;
% output2 = pic + lambda .* sharp;
% imshow(output2);
