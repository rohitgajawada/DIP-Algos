pic = imread('./Assign1_imgs/zelda512-NoiseV400.jpg');
pic = rgb2gray(pic);
dim = size(pic);
ht = dim(1);
wid = dim(2);

fsize = 201;
fp = floor(fsize/2);
impadded = padarray(pic, [fp, fp]);
output = pic;

for i = 1 + fp: ht + fp
    for j = 1 + fp : wid + fp
        window = impadded(i - fp: i + fp, j - fp: j + fp);
        counts = imhist(window);
        counts2 = cumsum(counts);
        output(i - fp, j - fp) = counts2(window(fp + 1, fp + 1) + 1) / (fsize * fsize) * 255;
    end
end

imshow(output);