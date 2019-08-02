pic = imread('assignment1/Assign1_imgs/stereo_pair.jpg');
dim = size(pic);
ht = dim(1);
wid = dim(2);
half = floor(wid / 2);

pic1 = pic(:, 1: half, :);
pic2 = pic(:, half + 1: end, :);
dim = size(pic2);

gpic1 = rgb2gray(pic1);
gpic2 = rgb2gray(pic2);

corners1 = detectHarrisFeatures(gpic1);
corners2 = detectHarrisFeatures(gpic2);

[features1, realpoints1] = extractFeatures(gpic1, corners1);
[features2, realpoints2] = extractFeatures(gpic2, corners2);

pairedcoords = matchFeatures(features1, features2);
matchedPoints1 = realpoints1(pairedcoords(:, 1), :);
matchedPoints2 = realpoints2(pairedcoords(:, 2), :);

figure;
showMatchedFeatures(gpic1, gpic2, matchedPoints1, matchedPoints2);
match1 = matchedPoints1.Location;
ms1 = size(match1);
match1 = reshape(match1, [2 ms1(1)]);
match2 = matchedPoints2.Location;
ms2 = size(match2);
match2 = reshape(match2, [2 ms2(1)]);

% calculate homography matrix
matchsize = size(match1);
n = matchsize(2);
match1_x = match1(1, :); 
match1_y = match1(2, :);
match2_x = match2(1, :);
match2_y = match2(2, :); 

a = match2_x .* match1_x;
b = match2_x .* match1_y;
c = match2_y .* match1_x;
d = match2_y .* match1_y;
zerorows = zeros(3, n);
xy_rows = -[match1_x; match1_y; ones(1, n)];

hx = [xy_rows; zerorows; a; b; match2_x];
hy = [zerorows; xy_rows; c; d; match2_y];
h = [hx hy];

if n == 4
    [U, ~, ~] = svd(h);
else
    [U, ~, ~] = svd(h, 'econ');
end

matrix = (reshape(U(:, 9), 3, 3)).';


finalpic = pic2;
newdim = size(pic1);
ht2 = newdim(1);
wid2 = newdim(2);

for i = 1: ht2
    for j = 1: wid2 
        point = [i j 1]';
        newpoint = matrix * point;
        newpoint = round(newpoint ./ newpoint(3));
        newpoint(1) = min(max(newpoint(1), 1), ht2);
        newpoint(2) = min(max(newpoint(2), 1), wid2);
        finalpic(newpoint(1), newpoint(2), :) = pic1(i, j, :);
    end
end

diff = finalpic - pic2;
imshow(diff);
