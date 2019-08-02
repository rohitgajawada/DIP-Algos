function output = simplefft(input, fact)

n = size(input, 2);

if n == 1
    output = input;
    return
end

output = zeros(1, n);
even = input(1: 2: n);
odd = input(2: 2: n);
base = 1.0;

evenout = simplefft(even, fact ^ 2);
oddout = simplefft(odd, fact ^ 2);

for i = 1: n/2
    output(i) = evenout(i) + base * oddout(i);
    output(i + n/2) = evenout(i) - base * oddout(i);
    base = base * fact;
end

end