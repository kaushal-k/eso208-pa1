function secant(funct,x1,x2,maxiter,maxrelerror)
    global iterations;
    global err;
    err = double.empty(1,maxiter);
    if feval(funct,x1)==0
        iterations = 1;
        err(1) = 0;
        root = x1;
    elseif feval(funct,x2)==0
        iterations = 1;
        err(1)=0;
        root = x2;
    else
        iterations = 0;
        for i=(1:maxiter)
            iterations = iterations+1;
            f1 = feval(funct,x1);
            f2 = feval(funct,x2);
            xnext = x1 - f1*((x1-x2)/(f1-f2));
            fnext = feval(funct,xnext);
            x1 = x2;
            x2 = xnext;
            err(i) = (abs(x1-x2))/x2 * 100;
            root = x2;
            if fnext==0
                err(i) = 0;
                break;
            end
            if err(i)<=maxrelerror
                break;
            end
        end
    end
    disp(sprintf('Root = %f',root));
    figure;
    plot((1:iterations),err);
    xlabel('iteration');
    ylabel('error %');