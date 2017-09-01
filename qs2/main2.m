%ESO208 Programming Assignment 1 Qs 2 (Muller and Bairstow methods)
funct = input('Enter f(x):','s');
funct = inline(funct,'x');
method = input('Choose a method:\n(1)Muller\n(2)Bairstow\n');
maxiter = input('Enter maximum iterations:');
maxrelerror = input('Enter maximum relative error:');
switch method
    case 1
        xinit = [ input('Enter Xa:'),input('Enter Xb:'),input('Enter Xc:') ];
        x = ( min(xinit)-100 :0.1: max(xinit)+100 );
        y = feval(funct,x);
        plot(x,y);
        xlabel('x');
        ylabel('f(x)');
        muller(funct,xinit(1),xinit(2),xinit(3),maxiter,maxrelerror);
        xinit = [ input('Enter Xa:'),input('Enter Xb:'),input('Enter Xc:') ];
        muller(funct,xinit(1),xinit(2),xinit(3),maxiter,maxrelerror);
        
    case 2
        alpha0 = input('Enter alpha0:');
        alpha1 = input('Enter alpha1:');
        x = -100:0.1:100;
        y = funct(x);
        plot(x,y);
        xlabel('x');
        ylabel('f(x)');
        bairstow(funct,alpha0,alpha1,maxiter,maxrelerror);
        alpha0 = input('Second, enter alpha0:');
        alpha1 = input('Second, enter alpha1:');
        bairstow(funct,alpha0,alpha1,maxiter,maxrelerror);        
end