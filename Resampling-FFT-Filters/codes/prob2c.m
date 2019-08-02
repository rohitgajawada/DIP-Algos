function output = prob2c()

img = imread('cameraman.tif');

ht = size(img, 1);
wid = size(img, 2);
chan = size(img, 3);

filt = ones(ht, wid);

for i = 1: ht
    for j = 1: wid
       filt(i, j) =  -((i - floor(ht / 2)) .^ 2 + (j - floor(wid / 2)) .^ 2);
    end
end

output = ones(ht, wid, chan);

for i = 1: chan
    
    Im = fftshift(fft2(img(:, :, i)));
    lapl = Im .* filt;
    lapl = real(ifft2(ifftshift(lapl)));
    
    normfactor = max(max(lapl * -1));
    
    lapl = lapl / normfactor * 255;
    output(:, :, i) = img(:, :, i) + 3 * uint8(lapl);
    
end

% subplot(1, 2, 1); imshow(img);
% subplot(1, 2, 2); imshow(uint8(output));

imshow(uint8(lapl));

end