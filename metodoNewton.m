function [xs, fxs, i]=metodoNewton(x0,f, df, iter, tol)
    xs = zeros(1, iter+1);
    fxs = xs;
    xs(1) = x0;
    fxs(1) = f(x0);
    for i = 1:iter
        if(abs(fxs(i)) < tol)
            xs = xs(1:i);
            fxs = fxs(1:i);
            return
        end
        xs(i+1) = xs(i) - fxs(i)/df(xs(i));
        fxs(i+1) = f(xs(i+1));
    end
end