function [xopt,zopt] = nlp_oned_golden_max(f,xlo,xhi,epsilon)
function y = func_oned(x)
% Golden Section Search for a MAX objective

  % Initial setup
  xhi =  35;
  xlo = 10;
  epsilon = 1;
  phi = (-1+sqrt(5))/2;
    x1 = xhi - phi*(xhi-xlo);
    x2 = xlo + phi*(xhi-xlo);
    k = 1;
  
  while (xhi-xlo > epsilon)
  
 
    % Left or Right
      if (feval(f,x1)>feval(f,x2))
        xhi = x2;
        x2  = x1;
        x1  = xhi - phi*(xhi-xlo);
      else
        xlo = x1;
        x1  = x2;
        x2  = xlo + phi*(xhi-xlo);
      end
    
      k = k+1;
  end
  
  % Display the values of the variables
    '----------';
    k;
    xvalues = [xlo,x1,x2,xhi]
    fvalues = [feval(f,xlo),feval(f,x1),feval(f,x2),feval(f,xhi)];
    range = xhi-xlo;
    '----------'

  % Estimate of optimal solution
    xopt = 0.5*(xlo+xhi);
    zopt = feval(f,xopt)
    plot(xopt,zopt,'b*','Markersize',15);
    