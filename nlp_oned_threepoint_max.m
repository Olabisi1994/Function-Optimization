
function [xlo,xmid,xhi] = nlp_oned_threepoint_max(f,xlo,delta)

% Three-Point Pattern for a MAX objective

  % Initial setup
    k = 0;

  % Display the values of the variables
    '----------'
    k
    delta
    xlo

	 
  if (feval(f,xlo+delta)>feval(f,xlo))
  
    xmid = xlo + delta;
    
    % Plot the current interval
    plot(xlo,feval(f,xlo),'rx','Markersize',10);
    plot(xmid,feval(f,xmid),'kx','Markersize',10);
         
    k = k+1;
   
    % Expand
      finished = 0;
      while (finished==0)
      
        delta = 2*delta;

        % Display the values of the variables
         '----------'
         k
         delta
         xlo
         xmid
         
        if (feval(f,xmid)>feval(f,xmid+delta))
          xhi = xmid + delta
          % Plot the current interval
            plot(xhi,feval(f,xhi),'gx','Markersize',10);
            
            finished = 1;
            
        else
          xlo  = xmid;
          xmid = xmid + delta;
          % Plot the current interval
            plot(xlo,feval(f,xlo),'rx','Markersize',10);
            plot(xmid,feval(f,xmid),'kx','Markersize',10);
            
        end
	
        k = k+1;
	
      end
    
  else

    xhi = xlo + delta;
    
    % Plot the current interval
    plot(xlo,feval(f,xlo),'rx','Markersize',10);
    plot(xhi,feval(f,xhi),'gx','Markersize',10);
    
    k = k+1;

    % Reduce
      finished = 0;
      
      while (finished==0)
        delta = 0.5*delta;

        % Display the values of the variables
          '----------'
          k
          delta
          xlo
          xhi

        if (feval(f,xlo+delta)>feval(f,xlo))
          xmid = xlo + delta
          % Plot the current interval
          plot(xmid,feval(f,xmid),'kx','Markersize',10);
          
	      finished = 1;
          
        else
          xhi  = xlo + delta;
          % Plot the current interval
          plot(xhi,feval(f,xhi),'gx','Markersize',10);
	
        end
	
        k = k+1;

      end
  end
  
  % Display the final values of the variables
    '----------'
    xvalues = [xlo,xmid,xhi]
    fvalues = [feval(f,xlo),feval(f,xmid),feval(f,xhi)]
    plot(xlo,feval(f,xlo),'bo','Markersize',10);
    plot(xmid,feval(f,xmid),'bo','Markersize',10);
    plot(xhi,feval(f,xhi),'bo','Markersize',10);