%Solve p(x)=0 using Newton-Raphson with initial guess x=x0
function [x]=w02p2(x)

% we can set up a function and a derivative
%f = @(x)(x^6   -4*x^5  +9*x^4  +80*x^3  -516*x^2-256*x+1856);
%g = @(x)(6*x^5 -20*x^4 +36*x^3 +240*x^2 -1032*x-256);

% but we can also set up a vector of polynomial coefficients...
p = [1, -4, 9, 80, -516, -256, 1856]; 
% ... and ask Matlab to evaluate p(x) and p'(x) for us
f = @(x)(polyval(p,x));
g = @(x)(polyval(polyder(p),x));

% set initial guess
%x = 1.5;  % do not use 1.5, use function input instead

% apply 10 iterations of Newton--Raphson
for n=1:10
 x = x - f(x)/g(x);
 % print debug output
 %fprintf('iteration n=%2d value x=%15.12f\n',n,x)
end

end