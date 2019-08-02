function x = prob1b(img1, img2, m)

    n = 5;
    mask = zeros(size(m, 1), size(m, 2), 3);
    mask(:, :, 1) = m;
    mask(:, :, 2) = m;
    mask(:, :, 3) = m;
    mask = mask ./ 255;
    size(mask)
    size(img1)
    size(img2)
    

    img1 = im2double(img1);
    img2 = im2double(img2);
    LA = prob1a_laplacian(img1,n);
    LB = prob1a_laplacian(img2,n);
    G = prob1a_gaussian(mask, n);
    
    LS = cell(1, n);

    for i = n: -1: 1
        
        newmask = mat2gray(G{i});
        newunmask = 1 - newmask;
        
        im1 = LA{i};
        im2 = LB{i};

        im1 = im1 .* newmask;
        im2 = im2 .* newunmask;

        x = im1 + im2;
        LS{i} = x;
        
    end
    
    for i = n: -1: 2
         
        old = cell2mat(LS(1, i));
        new = cell2mat(LS(1, i - 1));
        ht = size(new, 1);
        wid = size(new, 2);
        old = imresize(old, [ht wid]);
        LS{i-1} = new + old;
        
    end
    
    x = cell2mat(LS(1,1));
    imshow(x);

end