function muller(funct,xa,xb,xc,maxiter,maxrelerror)
    if funct(xa)==0
        root = xa;
    elseif funct(xb)==0
        root = xb;
    elseif funct(xc)==0
        root = xc;
    else
        for i=(1:maxiter)
            fa = funct(xa);
            fb = funct(xb);
            fc = funct(xc);
            a = (((fc-fb)/(xc-xb)) - ((fb-fa)/(xb-xa))) / (xc-xa);
            b = ((fc-fb)/(xc-xb)) + a*(xc-xb);
            c = fc;
            delx1 = (-2*c)/(b+sqrt(b*b-4*a*c));
            delx2 = (-2*c)/(b-sqrt(b*b-4*a*c));
            if abs(delx1)<=abs(delx2)
                delx = delx1;
            else
                delx = delx2;
            end
            x = xc + delx;
            if funct(x)==0
                root = x;
                break;
            else
                err = abs((x-xc)/x) * 100;
                root = x;
                xa = xb;
                xb = xc;
                xc = x;
            end
            if err<=maxrelerror
                break;
            end
        end
    end
    disp(sprintf('Root = %f',root));
end