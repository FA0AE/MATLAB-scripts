function secondActivityTesting(x0, xs, xi, iter, tol)
    %Se declara la función que se pretende obtener una ráiz única
    syms x  
    f = (x^3) + (4*(x^2)) - 10;
    df = diff(f);
    g1 = x - (x^3) - (4*(x^2)) + 10;
    g2 = sqrt((10/x) - (4*x));
    g3 = sqrt(10 - (x^3)) / 2;
    g4 = sqrt((10 / (4 + x)));
    g5 = x - (((x^3) + (4*(x^2)) -10) / ((3*(x^2)) + (8*x)));
    
    %Se convierten en funciones de matlab
    fx = matlabFunction(f);
    dfx = matlabFunction(df);
    gx1 = matlabFunction(g1);
    gx2 = matlabFunction(g2);
    gx3 = matlabFunction(g3);
    gx4 = matlabFunction(g4);
    gx5 = matlabFunction(g5);
    
    %Se manda llamar al script principal
    secondActivity(fx,dfx,gx1,gx2,gx3,gx4,gx5,x0,xs,xi,iter,tol)
end

