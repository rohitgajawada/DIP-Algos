function lapl_struct = prob1a_laplacian(im, n)

    gauss_struct = prob1a_gaussian(im, n);
    lapl_struct = cell(1, n);
    
    for i = n: -1: 2
        
        x = gauss_struct{i};
        y = gauss_struct{i - 1};
        
        ht = size(y, 1);
        wid = size(y, 2);
        temp = imresize(x, [ht wid]);
        lapl_struct{i - 1} = y - temp;
        
    end
    
    lapl_struct{n} = gauss_struct{n};

end