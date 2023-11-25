function [xopt,zopt] = nlp_oned_golden_min(f,xlo,xhi,epsilon)

% Golden Section Search for a MIN objective

  % Initial setup
    phi = (-1+sqrt(5))/2;
    x1 = xhi - phi*(xhi-xlo);
    x2 = xlo + phi*(xhi-xlo);
    k = 1;
  
  while (xhi-xlo > epsilon)
  
    % Display the values of the variables
      '----------'
      k
      [xlo,x1,x2,xhi]
      [feval(f,xlo),feval(f,x1),feval(f,x2),feval(f,xhi)]
      range = xhi-xlo
  
    % Plot the current interval
      plot(xlo,feval(f,xlo),'rx','Markersize',10);
      plot(xhi,feval(f,xhi),'gx','Markersize',10);

    % Left or Right
      if (feval(f,x1)<feval(f,x2))
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
    '----------'
    k
    [xlo,x1,x2,xhi]
    [feval(f,xlo),feval(f,x1),feval(f,x2),feval(f,xhi)]
    range = xhi-xlo
    '----------'

  % Estimate of optimal solution
    xopt = 0.5*(xlo+xhi)
    zopt = feval(f,xopt)
    plot(xopt,zopt,'b*','Markersize',15);