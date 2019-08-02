pic = imread('Assign1_imgs/lemon.jpg');
rmax = min(size(pic, 1), size(pic, 2)) * 0.75;
xc = round(size(pic, 1) / 2);
yc = round(size(pic, 2) / 2);
rho = 2;
num = 20;
newpic = pic;

for ind = 1: num
    rho = rho - 0.05;
    rmax = rmax - 5;
    
    for c = 1: 3
        for x = 1:size(newpic, 1)
            for y = 1: size(newpic, 2)
                
                dx = x - xc;
                dy = y - yc;
                r = sqrt(dx^2 + dy^2);
                z = sqrt(rmax^2 - r^2);
                betax = (1 - (1/rho)) * asin(dx/sqrt(dx^2 + z^2));
                betay = (1 - (1/rho)) * asin(dy/sqrt(dy^2 + z^2));
                
                if r > rmax
                    tx = x;
                    ty = y;
                else
                    tx = x - (z * tan(betax));
                    ty = y - (z * tan(betay));
                end
        
                outx = min(max(round(tx), 1), size(pic,1));
                outy = min(max(round(ty), 1), size(pic,2));
        
                newpic(x, y, c) = pic(outx, outy, c);
            end
        end
    end
    
    imwrite(uint8(newpic), strcat(int2str(ind),'_3.png'));
end