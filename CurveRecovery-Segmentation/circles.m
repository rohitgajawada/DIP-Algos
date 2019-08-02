im = imread('../Assign3_imgs/circle1.jpg');
im = rgb2gray(im);
im = edge(im, 'canny');
im = double(im) * 255;

voting_limit = 180;
votestruct = zeros(size(im, 1), size(im, 2),100);

final = zeros(size(im, 1), size(im, 2));
k = 1;

minangle = 0;
maxangle = 360;
min_r = 10;
max_r = 100;

htval = size(im, 1);
widval = size(im, 2);


for i = 1: htval
    for j = 1: widval
        if(im(i, j) == 255)
            for r = min_r: max_r
                for theta = minangle: maxangle
                    posx = floor(i - r * cos(theta * pi / 180));
                    posy = floor(j - r * sin(theta * pi / 180));
                    if(posx >= 1 && posy >= 1)
                        if(posx <= htval && posy <= widval)
                            votestruct(posx, posy, r) = votestruct(posx, posy, r) + 1;
                        end
                    end
                end
            end
        end
    end
end

for i = 1: htval
    for j = 10: widval
        for r = min_r: max_r
            if(votestruct(i, j, r) >= voting_limit)
                k = k + 1;
                for theta = minangle: maxangle
                    posx = floor(i - r * cos(theta * pi / 180));
                    posy = floor(j - r * sin(theta * pi / 180));
                    if(posx >= 1 && posy >= 1)
                        if(posx <= htval && posy <= widval)
                            final(posx, posy) = 255;
                        end
                    end
                end
            end
        end
    end
end

imshow(uint8(final));
                        


