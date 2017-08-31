function newtonraphson(funct,fdash,xnot,maxiter,maxrelerror)
    global iterations;
    global err;
    err = double.empty(0,maxiter);
    if feval(funct,xnot)==0
        iterations = 1;
        root = xnot;
        err(1) = 0;
    else
        iterations = 0;
        for i=(1:maxiter)
            iterations = iterations + 1;
            if feval(fdash,xnot)==0
                i = i-1;
                iterations = iterations-1;
                xnot = xnot+0.1;
                continue;
            end
            x = xnot - (feval(funct,xnot)/feval(fdash,xnot));
            if x==xnot
                err(i) = 0;
                root = xnot;
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