function y = func_piecewise(x)

% Example of a piecewise defined function of one variable

  y = zeros(size(x));
  y(x<0) = -x(x<0).^2 + 4;
  y(x>=0) = (x(x>=0)-2).^2;

