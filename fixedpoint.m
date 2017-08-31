function fixedpoint(phix,xnot,maxiter,maxrelerror)
    global iterations;
    global err;
    err = double.empty(0,maxiter);
    if feval(phix,xnot)==xnot
        iterations = 1;
        err(1) = 0;
        root = xnot;
    else
        iterations = 0;
        for i=1:maxiter
            iterations = iterations+1;
            x = feval(phix,xnot);
            if x==xnot
                root = x;
                err(i) = 0;
                break;
            else
                err(i) = (abs(x-xnot))/x * 100;
                root = x;
                xnot = x;
            end
            if err(i)<=maxrelerror
                break;
            end
        end
    end
    disp(sprintf('Root = %f',root));
    figure;
    plot((1:iterations),err);
    xlabel('iterations');
    ylabel('err %');