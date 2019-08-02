pic = imread('Assign1_imgs/lecun.jpg');
num = 20;
ax = 10;
ay = 15;
taux = 120;
tauy = 150;
dim = size(pic);
wid = dim(2);
ht = dim(1);


temp = pic;
for n = 1: num
    for c = 1: 3
        for i = 1: ht
            for j = 1: wid
                ti = i + ax*sin((2*pi*j)/taux);
                tj = j + ay*sin((2*pi*i)/tauy);
                tempi = min(max(round(ti), 1), size(pic,1));
                tempj = min(max(round(tj), 1), size(pic,2));
                temp(i, j, c) = pic(tempi, tempj, c);
            end
        end
    end
    ax = ax + 4;
    ay = ay + 4;
    taux = taux + 4;
    tauy = tauy + 4;
    imwrite(uint8(temp), strcat(int2str(n),'_3.png'));
end

% imshow(temp);
        