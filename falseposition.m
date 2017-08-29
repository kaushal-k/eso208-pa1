function falseposition(funct, x1, x2, maxiter, maxrelerror)
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
        for i = (1:maxiter)
            iterations = iterations+1;
            f1 = feval(funct,x1);
            f2 = feval(funct,x2);
            xfalse = x1 - f1*((x1-x2)/(f1-f2));
            ffalse = feval(funct,xfalse);
            if f1*ffalse<0
                x2 = xfalse;
            elseif f2*ffalse<0
                x1 = xfalse;
            elseif ffalse==0
                err(i) = 0;
                rootcache = xfalse;
                break;
            end
            if i>1
                err(i) = (abs(rootcache-xfalse))/xfalse * 100;
                if err(i)<=maxrelerror
                    break;
                end
            end
            rootcache = xfalse;
        end
    end
    disp(sprintf('Root = %f',rootcache));
    figure;
    plot((1:iterations),err);
    xlabel('iteration');
    ylabel('error %');    