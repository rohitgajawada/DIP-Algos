function[idct_im] = myIDCT(img, F)

inv_dct = @(block_struct) F' * block_struct.data * F;
idct_im = blockproc(double(img), [8 8], inv_dct);
idct_im = round(idct_im);
idct_im = idct_im + 128;
