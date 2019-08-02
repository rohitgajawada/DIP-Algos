img = imread('./Assign3_imgs/parabola1.jpg');

im=rgb2gray(img);

subplot(1,2,1);
imshow(im,[]);

[ht, wid]=size(im);

[edgemap, threshval]=edge(im,'canny',0.25);

rvals = [0.003, 0.004, 0.005, 0.006, 0.007, 0.008];

rlen = 6;

temp = zeros(ht, wid, rlen);

[yind, xind] = find(edgemap);

for k = 1: length(xind) 
    for xposval=1: wid
        for r = 1: 6
            yposval = yind(k) - rvals(r) * (xind(k) - xposval) ^ 2;
            yposval = round(yposval);
            if yposval < ht && yposval >= 1
                temp(yposval, xposval, r) = temp(yposval,xposval,r)+1;
            end
        end
    end
end

yposdetect = [];
xposdetect= [];
rposdetect= [];

maxtemp = max(temp,[],3);

se_vals = strel('disk',40);
maxstruct = imdilate(maxtemp, se_vals);

threshval = 100;

for r=1: 6
    [yposval xposval]=find((maxstruct(:,:) == temp(:,:,r)) & temp(:,:,r) > threshval);
    yposdetect = [yposdetect; yposval];
    xposdetect = [xposdetect; xposval];
    rposdetect = [rposdetect; rvals(r) * ones(length(xposval), 1)];
end

subplot(1,2,2);
imshow(edgemap, []);

for i=1:length(xposdetect)
    xposval=xposdetect(i);
    yposval=yposdetect(i);
    rposval=rposdetect(i);
    for x=1:wid
        y=round(yposval + rposval * (x - xposval) ^ 2);
        if y<=ht
            if y>=1
                rectangle('Position',[x y 1 1], 'Edgecolor','r');
            end
        end
    end
end
