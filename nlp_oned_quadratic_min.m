
function [xopt,zopt] = nlp_oned_quadratic_min(f,xlo,xmid,xhi,epsilon)

% Quadratic Fit Search for a MIN objective

  % Initial setup
  k = 1;
    
  while (xhi-xlo > epsilon)

    xqu = nlp_oned_fitquadratic(f,xlo,xmid,xhi);

    % Display the values of the variables
      '----------'
      k
      xvalues = [xlo,xmid,xhi]
      fvalues = feval(f,xvalues)
      range = xhi-xlo
      xqu
      fqu = feval(f,xqu)

    % Plot the current interval
      plot(xlo,feval(f,xlo),'rx','Markersize',10);
      plot(xhi,feval(f,xhi),'gx','Markersize',10);

    % Coincide
      if (abs(xqu-xmid) <= 0.01)
        if (xmid-xlo > xhi-xmid)
          xqu = xmid - epsilon/2;
        else
          xqu = xmid + epsilon/2;
        end
      end

    % Left or right
      if (xqu < xmid)
        if (feval(f,xmid)<feval(f,xqu))
          xlo = xqu;
        else
          xhi = xmid;
          xmid = xqu;
        end
      else
        if (feval(f,xmid)<feval(f,xqu))
          xhi = xqu;
        else
          xlo = xmid;
          xmid = xqu;
        end
      end

    k = k+1;
  end
  
  % Display the values of the variables
    '----------'
    k
    xvalues = [xlo,xmid,xhi]
    fvalues = feval(f,xvalues)
    range = xhi-xlo

  % Estimate of optimal solution
    xopt = xmid
    zopt = feval(f,xopt)
    plot(xopt,zopt,'b*','Markersize',15);