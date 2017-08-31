%ESO208 Programming assignment 1 Solutions to non linear equations
funct = input('Enter f(x):');
%funct = str2fun(['@(x)' funct]);
funct = inline(funct, 'x');
method = input('Choose a method\n(1)Bisection\n(2)False Position\n(3)Fixed-Point\n(4)Newton-Raphson\n(5)Secant\n');
if method==1 || method==2 || method==5
    x1 = input('Lower x:');
    x2 = input('Upper x:');
    x=(x1-100):0.1:(x2+100);
    y = feval(funct, x);
    plot(x,y);
else
    a = input('Inital x:');
    x = (a-100):0.1:(a+100);
    y = feval(funct, x);
    plot(x,y);
    if method==3
        phix = input('Enter phi(x):');
        phix = inline(phix, 'x');
    end
    if method==4
        fdashx = input('Enter f''(x):');
        fdashx = inline(fdashx, 'x');
    end
end
xlabel('x');
ylabel('f(x)');
hold on;
maxiter = input('Maximum iterations:');
maxrelerror = input('Maximum relative error:');

switch method
    case 1 
        bisection(funct,x1,x2,maxiter,maxrelerror);
    case 2 
        falseposition(funct,x1,x2,maxiter,maxrelerror);
    case 3 
        fixedpoint(phix,a,maxiter,maxrelerror);
    case 4
        newtonraphson(funct,fdashx,a,maxiter,maxrelerror);
    case 5
        secant(funct,x1,x2,maxiter,maxrelerror);
end    