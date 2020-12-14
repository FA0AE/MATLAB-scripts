function [xs, fxs, i]=metodoSecante(x0,x1,f,iter, tol)
    xs = zeros(1, iter+2);
    fxs = xs;
    xs(1) = x0;
    fxs(1) = f(x0);
    xs(2) = x1;
    fxs(2) = f(x1);
    for i = 2:(iter+1)          %Primer criterio de paro #iteraciones
        if(abs(fxs(i)) < tol)   %Segundo criterio
            xs = xs(1:i);
            fxs = fxs(1:i);
            return
        end
        xs(i+1) = xs(i) - ((fxs(i)*(xs(i-1) - xs(i))) / (fxs(i-1)-fxs(i)));
        fxs(i+1) = f(xs(i+1));
    end
end