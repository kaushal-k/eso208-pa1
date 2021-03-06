function bairstow(funct,alpha0,alpha1,maxiter,maxrelerror)
    funct = inline2sym(funct);
    c = sym2poly(funct);
    c = fliplr(c);
    s = size(c)-1;
    n = s(2);
    d = double.empty(0,n+1);
    del = double.empty(0,n);
    
    % d(n+1) is actually d(n) and so for c
    for i=(1:maxiter)
        d(n+1) = c(n+1);
        d(n) = c(n) + d(n+1)*alpha1
        for j=(n-2:-1:0)
            %disp(sprintf('j in d lop=%f',j));
            d(j+1) = c(j+1) + d(j+2)*alpha1 + d(j+3)*alpha0;
        end
        del(n) = d(n+1);
        del(n-1) = d(n) + del(n)*alpha1;
        for j=(n-3:-1:0)
            %disp(sprintf('j in del loop=%f',j));
            del(j+1) = d(j+2) + del(j+2)*alpha1 + del(j+3)*alpha0;
        end
        if d(2)==0 && d(1)==0
            %disp('zero are d1 do');
            break;
        end
        delalpha0 = (-del(2)*d(1) + del(3)*d(2)) / (del(2)*del(2) - del(1)*del(3));
        delalpha1 = (del(1)*d(1) - del(2)*d(2)) / (del(2)*del(2) - del(1)*del(3));
        err0 = abs(delalpha0/(alpha0+delalpha0))*100;
        err1 = abs(delalpha1/(alpha1+delalpha1))*100;
        alpha0 = alpha0 + delalpha0;
        alpha1 = alpha1 + delalpha1;
        if err0<=maxrelerror && err1<=maxrelerror && i>1
            %disp('err less');
            break;
        end
    end
    root1 = (alpha1 + sqrt(alpha1*alpha1 + 4*alpha0))/2.0;
    root2 = (alpha1 - sqrt(alpha1*alpha1 + 4*alpha0))/2.0;
    disp(sprintf('Root1=%f; Root2=%f',root1,root2));
    disp(sprintf('size=%f',n));
    disp(sprintf('c(2)=%f',c(2)));
end