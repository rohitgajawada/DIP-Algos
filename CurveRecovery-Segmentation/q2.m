im = imread('./Assign3_imgs/Cricket2.jpeg');
im = rgb2gray(im);
im = double(im);

globalmean = mean(mean(im(:,:)));

meanparam = 0.0085;
varparam = 1.265;
pad = 3;

for i = 1: size(im, 1) - pad
    for j = 1: size(im, 2) - pad
            window = im(i: i+2, j: j+2);
            var_temp = var(var(window(:, :)));
            localimg(j) = meanparam * var_temp + varparam * globalmean;
            
            if(localimg(j) > 255 && j ~= 1)
                localimg(j) = localimg(j-1);
            end
            
            if im(i,j) > localimg(j)
                    output(i, j) = 1;
            else
                output(i, j) = 0;
            end
            
        end
end

figure;
imshow(output);