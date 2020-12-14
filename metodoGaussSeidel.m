function [x,i,error]=metodoGaussSeidel(x,A,b,iter,tol)    
    %Descomper a la matriz A=D-L-U    
    D = diag(diag(A));    
    L = -tril(A,-1);    
    U = -triu(A,1);    
    DI = Inversa(D-L);    
    T = DI*U;    
    c = DI*b;    
    error = zeros(1,iter);    
    for i=1:iter        
        xant = x;             %guardando x anterior        
        x = T*x+c;            %calculado x actual        
        error(i) = norm(x-xant)/norm(x);        
        if (error(i) < tol)            
            error=error(1:i);            
            return        
        end
    end
end