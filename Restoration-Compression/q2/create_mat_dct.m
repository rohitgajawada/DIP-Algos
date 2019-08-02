function output = create_mat_dct(n)

[cc, rr] = meshgrid(0: n-1);
c = sqrt(2 / n) * cos(pi * (2 * cc + 1) .* rr / (2 * n));
c(1, :) = c(1, :) / sqrt(2);

output = c;