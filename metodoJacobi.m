function [x, i, error] = metodoJacobi(x, A, b, iter, tol)
    %Descomponer la matriz A en A = D-L-U
    %Se usan funciones de Matlab
    D = diag(diag(A));
    L = -tril(A, -1);
    U = -triu(A, 1);
    DI = Inversa(D);
    T = DI * (L + U);
    c = DI * b;
    error = zeros(1,iter);
    
    for i=1:iter
        xant = x;           %Guardando el x anterior
        x = (T * x) + c;    %Calculando el x actual 
        error(i) = norm((x - xant)) / norm(x); %Usando la norma
        if(error(i) < tol)
            error = error(1:i); 
            return 
        end
    end
    
end