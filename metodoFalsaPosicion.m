function [xms,fxms,i]=metodoFalsaPosicion(xi,xs,fun,iter,tol)
    fxi = fun(xi);
    fxs = fun(xs);
    if(fxi * fxs > 0)
        fprintf("No es posible encontrar una aíz en el intervalo [%d, %d]", xi, xs);
        xms = NaN;
        fxms = Nan;
        i = 0;
    else
        %Inicialización de los vectores
        xms = zeros(1,iter);
        fxms = xms;
        for i=1:iter                %primera condición de paro
            xms(i)=xs-(fxs*(xi-xs))/(fxi-fxs);     %generar el punto medio
            fxms(i) = fun(xms(i));  %evaluar el punto medio 
        %Verificar la segunda condición de paro
            if abs(fxms(i)) < tol
                xms = xms(1:i);
                fxms = fxms(1:i);
                return 
            end 
        %Se evaluán los distintos intervalos 
            if(fxi*fxms(i)) < 0     %intervalo izquierdo
                xs = xms(i);
                fxs = fxms(i);
            else                %intervalo derecho
                xi = xms(i);
                fxi = fxms(i);
            end
        end
    end
end