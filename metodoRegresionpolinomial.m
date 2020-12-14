function [a, error] = metodoRegresionpolinomial(pts, gp)  
    %Determinar el sistema de ecuaciones
    n = length(pts);            
    if (n-1) >= gp   %Restricción para el grado del polinomio 
        A = zeros(gp + 1, gp + 1);
        b = zeros(gp + 1, 1);

        for i=1:(gp + 1)
            b(i) = sum( pts(:,2) .* (pts(:,1) .^ (i-1)) );     
        end

        for i=1:(gp + 1)
            for j=1:(gp + 1)
                A(i,j) = sum(pts(:,1) .^ (i+j-2));
            end
        end
        A(1,1) = n;

        %Resolviendo el sistema de ecuaciones
        a = metodoGaussJordan(A,b);

        %Construyendo la función 
        syms x
        f = 0; 
        for i=1:(gp + 1)
            f = f + a(i) * x^(i-1);      
        end

        fx = matlabFunction(f);
        xt = linspace(min(pts(:,1)), max(pts(:,1)), 100);  
        yt = fx(xt);

        %Gráfica
        plot(xt, yt,'m-')
        error = pts(:,2) - fx(pts(:,1)); 
        error = sum(error .^ 2); 
    else
        a = NaN;
        error = Inf;
        fprintf("Error! El grado del polinomio (%d) es mayor al número de datos\n", gp);
    end
end

