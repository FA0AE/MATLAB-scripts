function falsePositionHW(xi, xs, n, errorAproxBis, errorAproxFalsePos)
    %Declaración de la función (n en los parámetros es igual al número de 
    %elementos que se quieren para el método gráfico)
    syms x
    f = ((-26) + (85 * x) - (91*(x^2)) + (44*(x^3)) - (8*(x^4)) + (x^5));
    fx = matlabFunction(f);
    
    %Método Gráfico
    hold on
    grid on
    xlabel('x');
    ylabel('y');
    falsePositonGraphic(xi, xs, n, fx);
    
    %Metodo de la bisección 
    [xms, fxms] = bisection(fx, xi, xs, errorAproxBis);
    %Se grafica el resultado, marcando el punto de intersección con 0 de 
    %acuerdo con el nivel de tolerancia o de error aproxamdo aceptado
    plot(xms(end), fxms(end), 'bo');
    
    %Metodo de la falsa posición
    [xms, fxms] = falsePosition(fx, xi, xs, errorAproxFalsePos);
    %Se grafica el resultado, marcando el punto de intersección con 0 de 
    %acuerdo con el nivel de tolerancia o de error aproxamdo aceptado 
    plot(xms(end), fxms(end), 'g*');
    
    legend('Método gráfico','Método de la bisección', 'Método de la falsa posición');
end

function falsePositonGraphic(xi, xs, n, fun)
    x = linspace(xi, xs, n);
    y = fun(x);
    plot(x, y, 'r-');
end

function [xms,fxms]=bisection(fun, xi, xs, errorAprox)
    fxi = fun(xi);
    fxs = fun(xs);
    %Se inicializa el valor inicial (1) de la variable contador para 
    %el ciclo while
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
        
        while(abs(fxms(i)) > errorAprox)
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
        fprintf("Se hicieron %d iteraciones con el método de bisección\n", i);
        return     
    end
end

function [xms,fxms]=falsePosition(fun, xi, xs, errorAprox)
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
        xms(i) = xs - (fxs * (xi - xs)) / (fxi - fxs);   
        fxms(i) = fun(xms(i));
        
        while(abs(fxms(i)) > errorAprox)
            if(fxi*fxms(i) < 0)
                xs = xms(i);
                fxs = fxms(i);
            else
                xi = xms(i);
                fxi = fxms(i);
            end
            i = (i+1);
            %Se vuelve a calcular un punto medio 
            xms(i) = xs - (fxs * (xi - xs)) / (fxi - fxs);   
            fxms(i) = fun(xms(i));
        end
        xms = xms(1:i);
        fxms = fxms(1:i);
        fprintf("Se hicieron %d iteraciones con el método de falsa posición\n", i);
        return     
    end
end