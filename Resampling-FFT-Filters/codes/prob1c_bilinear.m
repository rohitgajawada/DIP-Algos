function prob1c_bilinear(n)

img = imread('Assign2_imgs/other_images/football.jpg');

for num = 1: n
    
    height = size(img, 1);
    width = size(img, 2);
    chan = size(img, 3);
    ht2 = height * 2;
    wid2 = width * 2;

    x = zeros(ht2, wid2, chan);
    x = x - 1;

    %map originals 
    for c = 1: chan
        for i = 1: ht2
            for j = 1: wid2
                if mod(i, 2) == 1
                    if mod(j, 2) == 1
                        x(i, j, c) = img((i + 1)/ 2, (j + 1)/ 2, c);
                    end
                end
            end
        end
    end

    %get average values for partially incomplete rows
    for c = 1: chan
        for i = 1: 2: ht2
            for j = 1: wid2
                if x(i, j) == -1
                    if j == wid2
                        x(i, j, c) = x(i, j - 1, c);
                    else
                        x(i, j, c) = floor((x(i, j - 1, c) + x(i, j + 1, c)) / 2);
                    end
                end
            end
        end
    end

    %get average values for partially incomplete columns
    for c = 1: chan
        for i = 2: 2: ht2
            for j = 1: wid2
                if i == ht2
                    x(i, j, c) = x(i - 1, j, c);
                else
                    x(i, j, c) = floor((x(i - 1, j, c) + x(i + 1, j, c)) / 2);
                end
            end
        end
    end

    img = x;

end

imshow(uint8(x));