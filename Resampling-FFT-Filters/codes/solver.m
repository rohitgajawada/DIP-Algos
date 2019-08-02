function val = solver(p0, p1, p2, p3, x1, x2)

M = [x1^3 x1^2 x1 1; x2^3 x2^2 x2 1; 3*(x1^2) 2*x1 1 0; 3*(x2^2) 2*x2 1 0];
Y = [p1; p2; (p1 - p0)/2; (p3 - p2)/2;];

c = M\Y;
pt = (x1 + x2)/2;

val = c(1) * (pt ^ 3) + c(2) * (pt ^ 2) + c(3) * pt + c(4);

end
