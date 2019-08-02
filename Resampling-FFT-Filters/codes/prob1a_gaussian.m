function gauss_struct = prob1a_gaussian(im, n)

    filt = 13;
    sigma = 100;
    len = floor(filt/2);
    
    p = -len: len;
    [x, y] = meshgrid(p, p);
    
    filt = exp(-(x * x + y * y) / (2 * sigma * sigma));
    normfactor = sum(filt(:));
    filt = filt / normfactor;
    
    gauss_struct = cell(1, n);
    tempimg = im;
    
    for i = 1: n
        gauss_struct{i} = tempimg;
        tempimg = imfilter(tempimg, filt);
        tempimg = tempimg(1: 2: end, 1: 2: end, :);

    end

end