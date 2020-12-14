% Francisco Ariel Arenas Enciso 
% A01369122
% Actividad Integradora 1

% main() Function
function proyectoPrimerParcial()    
    % Llamadas a las funciones que resuelven los problemas 
    problemaUno();
    problemaDos();  
    %Creación de la función usada en 3. y 5.
    syms h 
    r = 3;
    v = 30; 
    f = (pi * (h^2)) * (((3 * r) - h) / 3) - v;
    df = diff(f);
    fh = matlabFunction(f);
    problemaTres(fh);
    
    problemaCuatro();
    
    dfh = matlabFunction(df);
    problemaCinco(fh, dfh);
    
    problemaSeis();
    problemaSiete();
end 

function problemaUno()
    syms x
    f = ((-1)*25) + (82 * x) - (90 * (x^2)) + (44 * (x^3)) - (8 * (x^4)) + (0.7 * (x^5));
    fx = matlabFunction(f);
    
    %Método gráfico 
    figure(1);
    hold on;
    grid on;
    xGraf = linspace(0.5, 1.0, 20);
    y = fx(xGraf);
    y1 = zeros(1, 20);
    x1 = zeros(1, 20);
    count = 0;
    for iter=1:length(y)
        if(y(iter) >= 0 && y(iter) < 1 )
            y1(iter) = y(iter);
            x1(iter) = xGraf(iter); 
            count = count + 1;
        end 
    end   
    yRoot = metodoNumerico.obtenerRaiz(1, y1);
    xRoot = metodoNumerico.obtenerRaiz(1, x1);

    plot(xRoot, yRoot, 'ko');
    plot(xGraf, y, 'r');
    
    %Metodo de Bisección
    [xms,fxms,i] = metodoNumerico.metodoBiseccion(0.5, 1.0, fx, 0.001);
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 1\n");
    fprintf("Se hicieron %d iteraciones con el método de bisección\n", i);
    fprintf("El valor de x en donde hubo raíz fue: %d\n", xms(end));
    fprintf("El valor de y en donde hubo raíz fue: %d\n", fxms(end));
    fprintf("---------------------------------------------------------\n");
     
    %Continuación de gráficas
    plot(xms(end), fxms(end), 'bo');
    legend('Raíz encontrada con Método Gráfico', 'Función', 'Método de Bisección');
    hold off
    figure(2);
    hold on;
    grid on;
    xmsError = 1:i;
    plot(xmsError, fxms, '--b');
    legend('Gráfica de error');
end 

function problemaDos()
    syms h
    g = 9.81;
    v = 5;
    t = 2.5;
    l = 4;
    
    f = (sqrt((2 * g * h))) * tanh(((sqrt((2 * g * h))) / (2 * l)) * t) - v;
    fh = matlabFunction(f);
    
    %Método gráfico 
    figure(3);
    hold on;
    grid on;
    xGraf = linspace(0, 2, 20);
    y = fh(xGraf);
    y1 = zeros(1, 20);
    x1 = zeros(1, 20);
    count = 0;
    for iter=1:length(y)
        if(y(iter) >= 0 && y(iter) < 1 )
            y1(iter) = y(iter);
            x1(iter) = xGraf(iter); 
            count = count + 1;
        end 
    end   
    yRoot = metodoNumerico.obtenerRaiz(1, y1);
    xRoot = metodoNumerico.obtenerRaiz(1, x1);

    plot(xRoot, yRoot, 'ko');
    plot(xGraf, y, 'r');
    
    %Metodo de Bisección
    [xms,fxms,i] = metodoNumerico.metodoBiseccion(0, 2, fh, 0.01);
    
    %Método de Secante
    [xsS, fxsS, iS] = metodoNumerico.metodoSecante(0,2,fh, 6, 0.01);
    
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 2\n");
    fprintf("Bisección\n");
    fprintf("Se hicieron %d iteraciones con el método de bisección\n", i);
    fprintf("El valor de x en donde hubo raíz fue: %d\n", xms(end));
    fprintf("El valor de y en donde hubo raíz fue: %d\n", fxms(end));
    fprintf("Secante\n");
    fprintf("Se hicieron %d iteraciones con el método de secante\n", iS);
    fprintf("El valor de x en donde hubo raíz fue: %d\n", xsS(end));
    fprintf("El valor de y en donde hubo raíz fue: %d\n", fxsS(end));  
    fprintf("---------------------------------------------------------\n");
     
    %Continuación de gráficas
    plot(xms(end), fxms(end), 'bo');
    plot(xsS(end), fxsS(end), 'go');
    legend('Raíz encontrada con Método Gráfico', 'Función', 'Método de Bisección', 'Método de Secante');
    hold off
    figure(4);
    hold on;
    grid on;
    xmsError = 1:i;
    plot(xmsError, fxms, '--b');
    xsSError = 1:iS;
    plot(xsSError, fxsS, '--g');
    legend('Gráfica de error Bisección', 'Gráfica de error Secante');
end 

function problemaTres(f) 
    fprintf("\n---------------------------------------------------------\n");    
    fprintf("PROBLEMA 3\n");    
    [xms,fxms,i] = metodoNumerico.metodoFalsaPosicion(0, 3, f, 3, 0.00001);

    if(isnan(fxms))
        fprintf("\nERROR\n");
        fprintf("---------------------------------------------------------\n");
    else
        fprintf("Se hicieron %d iteraciones con el método de Falsa posición\n", i);
        fprintf("El valor de x en donde hubo raíz fue: %d\n", xms(end));
        fprintf("El valor de y en donde hubo raíz fue: %d\n", fxms(end));
        fprintf("---------------------------------------------------------\n");
    end
end 

function problemaCuatro()
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 4\n");
    syms x
    f = 5 - (5*x) - (exp(0.5*x));
    df = diff(f);
    fx = matlabFunction(f);
    dfx = matlabFunction(df);
    [xs, fxs, i] = metodoNumerico.metodoNewton(0.7, fx, dfx, 20, 0.02);
    fprintf("Resultados de Newton\n");
    fprintf("Se hicieron %d iteraciones con el método de Newton\n", i);
    fprintf("El valor de x en donde hubo raíz fue: %d\n", xs(end));
    fprintf("El valor de y en donde hubo raíz fue: %d\n", fxs(end));
    fprintf("---------------------------------------------------------\n");
    
    figure(5);
    hold on;
    grid on;
    plot(xs, fxs, '-r');
    plot(xs(end), fxs(end), 'ok');
    legend('Gráfica de método de Newton');
    
    figure(6);
    hold on;
    grid on;
    xsError = 1:i;
    plot(xsError, fxs, '--b');
    legend('Gráfica de error Newton');
end


function problemaCinco(f, df)   
    [xs, fxs, i] = metodoNumerico.metodoNewton(3, f, df, 10, 0.00000000000001);
    xsError = 1:i;
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 5\n");
    fprintf("Resultados de Newton\n");
    fprintf("Se hicieron %d iteraciones con el método de Newton\n", i);
    fprintf("El valor de x en donde hubo raíz fue: %d\n", xs(end));
    fprintf("El valor de y en donde hubo raíz fue: %d\n", fxs(end));
   
    if(length(xsError) ~= length(xs) && length(xsError) ~= length(fxs))
    fprintf("La longitud del vector 'xs' (valores de x) es: %d\n", length(xs));
    fprintf("La longitud del vector 'fxs' (valores de y) es: %d\n", length(fxs));
    fprintf("La longitud del vector con las iteraciones es: %d\n", length(xsError));
    fprintf("Hay un error ya que no se puede derivar más después de la 11 iteración\n");
    end
    fprintf("---------------------------------------------------------\n");
    
    figure(7);
    hold on;
    grid on;
    plot(xs, fxs, '-r');
    plot(xs(end), fxs(end), 'ok');
    legend('Gráfica de método de Newton');
    
    figure(8);
    hold on;
    grid on;
    plot(xsError, fxs, '--b');
    legend('Gráfica de error Newton');
end 

function problemaSeis()
    A=[10 2 -1; -3 -6 2; 1 1 5];
    b=[27 -61.5 -21.5]';
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 6\n");
    fprintf("El sistema de ecuaciones en forma matricial es: \n");
    disp([A b]);
    fprintf("Usando el método de Gauss-Jordan:\n");
    [x]=metodoNumerico.metodoGaussJordan(A,b);
    
    for i=1:3
        fprintf("El valor de x%d es: ", i);
        fprintf("%g\n", x(i));
    end
    
    fprintf("\nSi se multiplia el vector de resultados por A (A*x) se obtiene:\n");
    
    for i=1:3
        r = (A*x);
        fprintf("La ecuación %d resulta en: ", i);
        fprintf("%g\n", r(i));
    end
    fprintf("---------------------------------------------------------\n");
end

function problemaSiete()
    A=[2 -6 -1; -3 -1 7; -8 1 -2];
    b=[-38 -34 -20]';
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 7\n");
    fprintf("El sistema de ecuaciones en forma matricial es: \n");
    disp([A b]);
    fprintf("Usando el método de Gauss-Jordan:\n");
    [x]=metodoNumerico.metodoGaussJordan(A,b);
    
    for i=1:3
        fprintf("El valor de x%d es: ", i);
        fprintf("%g\n", x(i));
    end
    
    fprintf("\nSi se multiplia el vector de resultados por A (A*x) se obtiene:\n");
    
    for i=1:3
        r = (A*x);
        fprintf("La ecuación %d resulta en: ", i);
        fprintf("%g\n", r(i));
    end
    fprintf("---------------------------------------------------------\n");
end




