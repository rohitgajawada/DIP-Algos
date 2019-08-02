function output = prob2d_c()

img = im2double(imread('./Assign2_imgs/notch_pass_reject_filter/notch3.jpg'));
Im = img;
output = img;

for c = 1: 3
    Im(:, :, c) = fft2(img(:, :, c));
    Im(:, :, c) = fftshift(Im(:, :, c));
end

Im(1: 88, 127: 132, :) = 0;
Im(170: 256, 127: 132, :) = 0;
Im(128: 132, 1: 90, :) = 0;
Im(128: 132, 170: 256, :) = 0;

for c = 1: 3
    output(:,:,c) = ifft2(ifftshift(Im(:, :, c)));
end

output=mat2gray(abs(output));

subplot(1, 3, 1); imshow(img);
subplot(1, 3, 2); imshow(Im);
subplot(1, 3, 3); imshow(output);

end
