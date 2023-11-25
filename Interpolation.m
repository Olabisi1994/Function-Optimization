% Vanedemonde polynomial interpolation

x = [ -3 -2 -1 1 2 3];      % as a column
y = [ 60 56  12 -28 0 276];  % as a column
N = length(x);

% form the vandermonde matrix
V = zeros(N,N); 
for m=1:N
    for n=1:N
        V(m,n) = x(m)^(n-1);
    end
end

% solve vandermonde systeem V*p=y
p = V^(-1)*y;  %<----BAAAAAD

% visualise
hold on
plot(x,y,'bo')
t=-3:0;01:3;
plot(t,polyval(p(end:-1:1),t),'b-')
hold off
