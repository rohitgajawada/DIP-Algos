function out = prob2b_2(img, type)

out = ones(size(img));
r = 50;

for c = 1: 3
    
    im1 = img(:, :, c);

    Im = fftshift(fft2(im1));
    ht = size(Im, 1);
    wid = size(Im, 2);
    cenx = floor(wid / 2);
    ceny = floor(ht / 2);
    
    [x, y] = meshgrid(1: wid, 1: ht);
    dist = (x - cenx) .^ 2 + (y - ceny) .^ 2;
    
    if type == 1
        filt = 1 - exp(-1 * dist / (2 * r ^ 2));
    else
        filt = exp(-1 * dist / (2 * r ^ 2));
    end
    
    Im = Im .* filt;

    out(:, :, c) = ifft2(ifftshift(Im));
    
end

imshow(uint8(abs(out)));

end
