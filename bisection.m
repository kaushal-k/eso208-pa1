function bisection(funct,x1,x2,maxiter,maxrelerror)
    global iterations;
    global err;
    err = double.empty(0,maxiter);
    if feval(funct,x1)==0
        iterations = 1;
        err(1) = 0;
        rootcache = x1;
    elseif feval(funct,x2)==0
        iterations = 1;
        err(1) = 0;
        rootcache = x2;
    else
        iterations = 0;
        for i=1:maxiter
            iterations = iterations + 1;
            f1 = feval(funct,x1);
            f2 = feval(funct,x2);
            xmid = (x1+x2)/2;
            fmid = feval(funct,xmid);
            if fmid==0
                rootcache = xmid;
                err(i) = 0;
                break;
            elseif f1*fmid<0
                x2 = xmid;
            elseif fmid*f2<0
                x1 = xmid;
            end
            if i>1
                err(i) = abs((rootcache-xmid)/xmid) * 100;
                if(err(i)<=maxrelerror)
                    break;
                end
            end
            rootcache = xmid;
        end
    end
    disp(sprintf('Root = %f',rootcache));
    figure;
    plot((1:iterations),err);
    xlabel('iteration');
    ylabel('error %');