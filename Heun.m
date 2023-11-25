function dydt = f(y,t)

% solve dydt= r*y(t)*(1-y(t)/K) using Heun's method
dydt = @(t,y)(y(t)*(1 - (y(t)/3)));

% set up grid parameters
N = 100;
T = 10;
h = T/N;

% set the grid
t = (0:N)*h;

% set up problem parameters
y(1)= 0;         % initial population size
alpha = 0.5;     % Euler's modifier
K = 3;           %carrying capacity
r = 1;           % growth rate

%pre-allocate memory the solution
y = zeros(N+1,1);
y0 = 4;
belta = alpha;
c(1) = 1 - (1/2*alpha);
c(2) = 1/(2*alpha);

for n=1:N
    f = @(t,y)(y(t)*(1 - y(t)/3));
        k1 = f(t(n),y(n));
        k2 = f(t(n)+(alpha*h),y(n)+(belta*h*k1));
        y(n+1) = y(n) + h*((c(1)*k1)+(c(2)*k2));
        fprintf("step %d c(1)=%g c(2)=%g k1=%g k2=%g y=%g\n",n,c(1),c(2),k1,k2,y(n+1))
end   
 
%VISUALIZE THE SOLUTION
ttru = 0:0.001:T;
ytru = exp(-ttru.^2/2);
plot(t,y,'bo',ttru,ytru,'r-')
err = abs(y(N+1)-exp(-T.^2/2));
