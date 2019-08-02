num = 4;

if num == 1

    i1 = imread('../Assign4_imgs/restore_01.jpg');
    len = 30; angle = 0; nsr = .0275;
    psf = fspecial('motion', len, angle);

    restored = deconvwnr(i1, psf, nsr);
    imwrite(restored, './pics/restored01.jpg');

elseif num == 2
    
    i1 = imread('../Assign4_imgs/restore_02.jpg');
    len = 23; angle = 0; nsr = .03;
    psf = fspecial('motion', len, angle);

    restored = deconvwnr(i1, psf, nsr);
    imwrite(restored, './pics/restored02.jpg');

elseif num == 3
        
    [i1, map] = imread('../Assign4_imgs/restore_03.gif');
    i1 = ind2rgb(i1, map);
    len = 20; angle = 35; nsr = .0275;
    psf = fspecial('motion', len, angle);

    restored = deconvwnr(i1, psf, nsr);
    imwrite(restored, './pics/restored03.jpg');
    
elseif num == 4
    
    i1 = imread('../Assign4_imgs/restore_04.jpg');
    len = 25; angle = -20; nsr = .03;
    psf = fspecial('motion', len, angle);

    temp = i1(120: 350, 80: 530, :);
    restored = deconvwnr(temp, psf, nsr);
    i1(120: 350, 80: 530, :) = restored;

    imwrite(i1, './pics/restored04.jpg');
    
end
        
