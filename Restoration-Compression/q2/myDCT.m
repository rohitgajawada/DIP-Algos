function[dct_img] = myDCT(img, F)

img = double(img);
img = img - 128;

dct_function = @(block_struct) F * block_struct.data * F';
dct_img = blockproc(img, [8 8], dct_function);

end
