
function [xqu,a,b,c] = nlp_oned_fitquadratic(f,xlo,xmid,xhi)

% Fit a quadratic function to the three points
% {(xlo,f(xlo)),(xmid,f(xmid)),(xhi,f(xhi))}
    
  % Calculate the inputs to the formula
    slo  = xlo^2;
    smid = xmid^2;
    shi  = xhi^2;
    flo  = feval(f,xlo);
    fmid = feval(f,xmid);
    fhi  = feval(f,xhi);

  % The minimum point of the fitted quadratic

    xqu = 0.5*(flo*(smid-shi)+fmid*(shi-slo)+fhi*(slo-smid))/...
              (flo*(xmid-xhi)+fmid*(xhi-xlo)+fhi*(xlo-xmid));

  % The coefficients of the fitted quadratic
  %  a.*x.^2 + b.*x + c
 
    a = (flo*(xhi-xmid)+fmid*(xlo-xhi)+fhi*(xmid-xlo))/...
	( (xmid-xlo)*(shi-slo)-(xhi-xlo)*(smid-slo) );
    b = (flo*(smid-shi)+fmid*(shi-slo)+fhi*(slo-smid))/...
	( (xmid-xlo)*(shi-slo)-(xhi-xlo)*(smid-slo) );
    c = fmid - a*smid - b*xmid;
  