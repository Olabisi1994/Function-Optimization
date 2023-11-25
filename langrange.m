% compute the langrange polynomial

x  = [-3; -2; -1; 1; 2; 3];
y = [60; 56; 12; -28; 0; 276];
N = length(x);

n=6;
Ln= 1;
for m=1:N
    if m~=n
       % l(x) = l(x) * (x-x_m)/(x_n-x_m)
       Ln = conv(Ln, [1; -x(m)]/(x(n)-x(m)));
    end
end
p = zeros(N,1);
for n = 1:N
p = p + L(1,n)*y(n);
end