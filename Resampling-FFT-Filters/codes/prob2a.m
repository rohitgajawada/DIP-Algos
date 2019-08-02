function output = prob2a()

path = 'Assign2_imgs/other_images/cameraman.tif';
im = im2double(imread(path));

img = imresize(im, [pow2(round(log2(size(im, 1)))) pow2(round(log2(size(im, 2))))]);

rows = size(img, 1);
cols = size(img, 2);
yfact = exp(-2 * 1i * (pi/cols));
xfact = exp(-2 * 1i * (pi/rows));

temp = zeros(size(img));
output = zeros(size(img));

for i = 1: rows
    temp(i, :) = simplefft(img(i, :), yfact);
end

for j = 1: cols
    output(:, j) = simplefft(temp(:, j)', xfact');
end

imshow(log(abs(output)));

end