clear;
pic = imread('Assign1_imgs/zelda512-NoiseV400.jpg');
pic = im2double(pic);

fsize = 8;
sigma = 5;
inds = -floor(fsize/2) : floor(fsize/2);

pic2 = padarray(pic, [floor(fsize/2) floor(fsize/2)]);
dim = size(pic2);
ht = dim(1);
wid = dim(2);

ind = floor(fsize / 2);

tempimg = pic;

for i = 1 + ind: ht - ind
    for j = 1 + ind: wid - ind
        box = pic2(i - ind: i + ind, j - ind: j + ind, :);

        [X Y] = meshgrid(inds, inds);
        gf = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));

        dL = box(:,:,1) - pic2(i,j,1);
        da = box(:,:,2) - pic2(i,j,2);
        db = box(:,:,3) - pic2(i,j,3);
        H = exp(-(dL.^2+da.^2+db.^2)/(2*sigma^2));

        temp(:, :, 1) = box(:, :, 1) .* H;
        temp(:, :, 2) = box(:, :, 2) .* H;
        temp(:, :, 3) = box(:, :, 3) .* H;
        temp(:, :, 1) = temp(:, :, 1) .* gf;
        temp(:, :, 2) = temp(:, :, 2) .* gf;
        temp(:, :, 3) = temp(:, :, 3) .* gf;
        
        temp(1) = sum(sum(temp(:, :, 1)));
        temp(2) = sum(sum(temp(:, :, 2)));
        temp(3) = sum(sum(temp(:, :, 3)));

        norm = gf .* H;
        norm = sum(sum(norm(:)));

        final(1) = temp(1) / norm;
        final(2) = temp(2)/ norm;
        final(3) = temp(3) / norm;
        
        tempimg(i, j, :) = final(:);

    end
end

imshow(tempimg);