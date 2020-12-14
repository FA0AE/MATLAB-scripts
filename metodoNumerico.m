classdef metodoNumerico
    methods (Static)       
        function [nRoot] = obtenerRaiz(count, n1)
            nRoot = zeros(1, count);
            for iter=1:length(n1)
                if(n1(iter) ~= 0)
                    nRoot(count) = n1(iter);
                    count = count + 1; 
                end
            end
        end 
        
        function [xs,fxs,i] = metodoPuntoFijo(x0,f,g,iter,tol) 
        %Ayudar en el performance del m todo  diff�    
        xs=zeros(1,iter+1);    
        fxs=xs;    
        xs(1)=x0;    
        fxs(1)=f(x0);    
            for i=1:iter %primer criterio de paro #iteraciones        
            %Segundo criterio de paro        
            if abs(fxs(i))<tol            
                xs=xs(1:i);            
                fxs=fxs(1:i);            
                return        
            end
            xs(i+1)=g(xs(i));        
            fxs(i+1)=f(xs(i+1));    
            end
        end

        function [xms,fxms,i] = metodoBiseccion(xi,xs,fun,tol)
            fxi = fun(xi);
            fxs = fun(xs);
            i = 1;
            %Se verifica primero que, dentro del intervalo, hayan raíces
            if((fxi*fxs) > 0)
                fprintf("Es probable que no se encuentre ninguna raíz en el intervalo [%d, %d]", xi, xs);
                xms = NaN;
                fxms = NaN;
            else
                %Se usa un Vector preasignado a un número muy grande (100,000)
                %ya que no tenemos un número de iteraciones asignado, es decir,
                %es indefinido y en MATLAB el tiempo de hacer Vectores 'dinámicos'
                %hace más complicado el código
                xms = zeros(1, 1000);
                fxms = xms;
                %Se evalua un punto medio 
                xms(i) = (xi + xs)/2;   
                fxms(i) = fun(xms(i));

                while(abs(fxms(i)) > tol)
                    if(fxi*fxms(i) < 0)
                        xs = xms(i);
                    else
                        xi = xms(i);
                        fxi = fxms(i);
                    end
                    i = (i+1);
                    xms(i) = (xi + xs)/2;   
                    fxms(i) = fun(xms(i));
                end
                xms = xms(1:i);
                fxms = fxms(1:i);
                return     
            end
        end

        function [xms,fxms,i] = metodoFalsaPosicion(xi,xs,fun,iter,tol)
            fxi = fun(xi);
            fxs = fun(xs);
            if(fxi * fxs > 0)
                fprintf("No es posible encontrar una raíz en el intervalo [%d, %d]", xi, xs);
                xms = NaN;
                fxms = NaN;
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
        
        function [xs, fxs, i] = metodoSecante(x0,x1,f,iter, tol)
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

        function [xs, fxs, i] = metodoNewton(x0,f, df, iter, tol)
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
        
        function [x] = metodoGaussJordan(A,b)    
            %Matriz extendida    
            M=[A b];        
            %Primer for es para visitar los elementos de la diagonal    
            for i=1:size(A,1)        
                %Dividir la fila para que el elemento de la diagonal nos de 1        
                if M(i,i)~=1            
                    M(i,:)=M(i,:)./M(i,i);            
                    %{
                    SE COMENTA EL DESPLIEGUE DE LA MATRIZ
                    disp(M)        
                    %}
                end
                %Segundo for es para convertir los elementos que no estan en la        
                %diagonal en 0        
                for j=1:size(A,1)            
                    if i~=j               
                        M(j,:)=M(j,:)-M(j,i)*M(i,:);                
                        %{
                        SE COMENTA EL DESPLIEGUE DE LA MATRIZ 
                        disp(M)            
                        %}
                   end
                end
            end
            x=M(:,end); 
            %Regresar el resultado   
        end
        
        function [a, error] = metodoRegresionPolinomial(pts, gp)  
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
                a = metodoNumerico.metodoGaussJordan(A,b);

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

        function [fnx,fn] = metodoInterpolacionPolinomial(ps,x)    
            n=length(ps);    
            B=zeros(n);    
            xs=ps(:,1);    
            B(:,1)=ps(:,2);    
            %Matriz B de diferencias finitas
            for j=2:n %Recorrer columnas        
                for i=1:n-j+1           
                    B(i,j)=(B(i+1,j-1)-B(i,j-1))/(xs(i+j-1)-xs(i));            
                    %{
                    fprintf('B(%d,%d) = \n',i,j);            
                    fprintf('(%.4f-%.4f)/(%.4f-%.4f) = %.4f \n',B(i+1,j-1),B(i,j-1),xs(i+j-1),xs(i),B(i,j));
                    %}
                end
                % Realizar la aproximación utilizando el modelo generado�        
                fnx = B(1,1);       
                xt = 1;        
                for j=1:n-1           
                    xt = xt * (x-xs(j));          
                    fnx = fnx + B(1,j+1) * xt;      
                end
                fn = 0;           
            end
        end
            
       
    end
end