function secondActivity(fx,dfx,gx1,gx2,gx3,gx4,gx5,x0,xs,xi,iter,tol)

    %Declaración del Método de Punto Fijo
    [xPF1,fxPF1,iPF1]=metodoPuntoFijo(x0,fx,gx1,iter,tol);
    [xPF2,fxPF2,iPF2]=metodoPuntoFijo(x0,fx,gx2,iter,tol);
    [xPF3,fxPF3,iPF3]=metodoPuntoFijo(x0,fx,gx3,iter,tol);
    [xPF4,fxPF4,iPF4]=metodoPuntoFijo(x0,fx,gx4,iter,tol);
    [xPF5,fxPF5,iPF5]=metodoPuntoFijo(x0,fx,gx5,iter,tol);
        
    %Resultado del Método Punto Fijo
    fprintf("El resultado de g1 son:\n")
    fprintf("x = %d\n", xPF1(end));
    fprintf("fx = %d\n",fxPF1(end));
    fprintf("Las iteraciones son: %d\n", iPF1);
    fprintf("El resultado de g2 son:\n")
    fprintf("x = %d\n", xPF2(end));
    fprintf("fx = %d\n",fxPF2(end));
    fprintf("Las iteraciones son: %d\n", iPF2);
    fprintf("El resultado de g3 son:\n")
    fprintf("x = %d\n", xPF3(end));
    fprintf("fx = %d\n",fxPF3(end));
    fprintf("Las iteraciones son: %d\n", iPF3);
    fprintf("El resultado de g4 son:\n")
    fprintf("x = %d\n", xPF4(end));
    fprintf("fx = %d\n",fxPF4(end));
    fprintf("Las iteraciones son: %d\n", iPF4);
    fprintf("El resultado de g5 son:\n")
    fprintf("x = %d\n", xPF5(end));
    fprintf("fx = %d\n",fxPF5(end));
    fprintf("Las iteraciones son: %d\n", iPF5);
    
    %Método Gráfico
    figure(1);
    hold on;
    grid on;

    %Se revisa la convergencia de las funciones
    fprintf("\nChecando la convergencia\n");
    if(abs(fxPF1(end)) > tol || isnan(fxPF1(end)))
        fprintf("El número de iteraciones (%d) fue mayor al esperado en g%d\n", iPF1, 1);
    else
        plot(xPF1,fxPF1, '-k');
        plot(xPF1(end),fxPF1(end), 'ok');
    end
    
    if(abs(fxPF2(end)) > tol || isnan(fxPF2(end)))
        fprintf("El número de iteraciones (%d) fue mayor al esperado en g%d\n", iPF2, 2);
    else
        plot(xPF2,fxPF2, '-m');
        plot(xPF2(end),fxPF2(end), 'om');
    end
    
    if(abs(fxPF3(end)) > tol || isnan(fxPF3(end)))
        fprintf("El número de iteraciones (%d) fue mayor al esperado en g%d\n", iPF3, 3);
    else
        plot(xPF3,fxPF3, '-g');
        plot(xPF3(end),fxPF3(end), 'og');
     end
    
    if(abs(fxPF4(end)) > tol || isnan(fxPF4(end)))
        fprintf("El número de iteraciones (%d) fue mayor al esperado en g%d\n", iPF4, 4);
    else
        plot(xPF4,fxPF4, '-b');
        plot(xPF4(end),fxPF4(end), 'ob');
    end
    
    if(abs(fxPF5(end)) > tol || isnan(fxPF5(end)))
        fprintf("El número de iteraciones (%d) fue mayor al esperado en g%d\n", iPF5, 5);
    else
        plot(xPF5,fxPF5, '-r');
        plot(xPF5(end),fxPF5(end), 'or');
    end
    
    legend('gx3','gx3','gx4','gx4','gx5','gx5');
    
    %Declaración del Método de Bisección
    [xmsB,fxmsB,iB]=metodoBiseccion(xi,xs,fx,iter,tol);
    
    %Declaración del Método de Falsa Posición
    [xmsFP,fxmsFP,iFP]=metodoFalsaPosicion(xi,xs,fx,iter,tol);

    %Declaración del Método de Newton 
    [xsN, fxsN, iN]=metodoNewton(x0,fx, dfx, iter, tol);

    %Gráfico con los demás métodos 
    hold off;
    figure(2);
    hold on;
    grid on;
    
    %El mejor gx del punto fijo fue g5 al tener 4 iteraciones solamente
    %por lo tanto, se graficará
    plot(xPF5,fxPF5, '-r');
    plot(xPF5(end),fxPF5(end), 'or');
    plot(xmsB, fxmsB, '-k');
    plot(xmsB(end), fxmsB(end), 'ok');
    fprintf("\nMétodo de bisección\n");
    fprintf("El número de iteraciones en Bisección fue: %d\n", iB);
    fprintf("El valor de x final en Bisección fue: %d\n", xmsB(end));
    plot(xmsFP, fxmsFP, '-y');
    plot(xmsFP(end), fxmsFP(end), 'oy');
    fprintf("\nMétodo de falsa posición\n");
    fprintf("El número de iteraciones en Falsa Posición fue: %d\n", iFP);
    fprintf("El valor de x final en Falsa Posición fue: %d\n", xmsFP(end));
    plot(xsN, fxsN, '-c');
    plot(xsN(end), fxsN(end), 'oc');
    fprintf("\nMétodo de Newton\n");
    fprintf("El número de iteraciones en Newton fue: %d\n", iN);
    fprintf("El valor de x final en Newton fue: %d\n", xsN(end));
    
    legend('gx5','gx5','Método de bisección','Método de bisección','Falsa Posición','Falsa Posición','Newton','Newton' );
end


%Se declaran todos los métodos en funciones dado a que el archivo 
%correspondiente a la tarea está en un directorio diferente a estos 

function [xs,fxs,i]=metodoPuntoFijo(x0,f,g,iter,tol) 
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

function [xms,fxms,i]=metodoBiseccion(xi,xs,fun,iter,tol)
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
            xms(i) = (xi+xs)/2;     %generar el punto medio
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
            else                %intervalo derecho
                xi = xms(i);
                fxi = fxms(i);
            end
        end
    end
end

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