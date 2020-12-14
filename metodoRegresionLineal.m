function [a,error] = metodoRegresionLineal(pts) 
    n = size(pts, 1);
    suma_x = sum(pts(:,1));
    suma_y = sum(pts(:,2));
    suma_x2 = sum(pts(:,1) .* pts(:,1));
    suma_xy = sum(pts(:,1) .* pts(:,2));
    
    %Cálculo de a0 y a1
    a1 = (n * suma_xy - suma_x * suma_y) / (n * suma_x2 - suma_x ^ 2);
    a0 = (suma_y - a1 * suma_x) / n;
    a = [a0, a1];

    %Construcción de la función 
    syms x
    f = a0 + a1 * x;
    fx = matlabFunction(f);
    error = pts(:,2) - fx(pts(:,1));
    error = sum(error .^ 2); 
    
    %Gráfica
    figure(1);
    hold on;
    grid on;
    xt = [ min(pts(:,1)), max(pts(:,1)) ];
    yt = fx(xt);
    
    plot(xt, yt, 'k-');    
end