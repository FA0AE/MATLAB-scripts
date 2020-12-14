% Francisco Ariel Arenas Enciso; Javier Vargas 
% A01369122; A01377718
% Proyecto Final

% main() Function
function ProyectoFinal()    
    % Llamadas a las funciones que resuelven los problemas   
    problemaTres();
    problemaCuatro();
    problemaCinco();
    problemaReal();
end 

function problemaTres()
    ps = [-50 -30 0 60 90 110; 1270 1280 1350 1480 1580 1700]';
    errors = zeros(1, length(ps) - 1);
    
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 3\n");
    for i=1:(length(ps) - 1)
        figure(i)
        hold on 
        grid on
        plot(ps(:,1), ps(:,2), 'or')
        [a, error] = metodoNumerico.metodoRegresionPolinomial(ps, i);
        errors(i) = error;
        fprintf("\nREGRESIÓN LINEAL GRADO %d\n", i);
        fprintf("El error encontrado en esta solución fue de: %.4f\n", error);
        for j=1:length(a)
            fprintf("El valor del coeficiente a%d es de: %.4f\n", (j-1), a(j));
        end
        xlabel("T");
        ylabel("c");
        legend('Muestra de datos', 'f(x) generada')
    end
    
    for k=1:length(errors)
        if(errors(k) == min(errors))
           fprintf("\nEl grado de regresión con menos error (%d) fue: %d\n", min(errors), k);     
        end
    end
  
    fprintf("---------------------------------------------------------\n");
end 

function problemaCuatro()
    ps = [0 5 10 20 30 40; 1.787 1.519 1.307 1.002 0.7975 0.6529]';
    figure(6)
    hold on
    grid on 
    plot(ps(:,1), ps(:,2), 'ob')
    
    %interpolación lineal
    ps1 = [5 10; 1.519 1.307]';
    [fnx1, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps1, 7.5);
    plot(7.5, fnx1, '*r') 
    %interpolación cuadrática
    ps2 = [0 5 10; 1.787 1.519 1.307]';
    [fnx2, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps2, 7.5);
    plot(7.5, fnx2, 'sg')
    %interpolación de Newton
    psN = ps;
    [fnxN, ~] = metodoNumerico.metodoInterpolacionPolinomial(psN, 7.5);
    plot(7.5, fnxN, 'xc')
    
    aproxValues = [fnx1, fnx2];
    
    %regresión cuadrática (polinomio que satisface la parábola solicitada)
    [a, error] = metodoNumerico.metodoRegresionPolinomial(ps, 2);
    
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 4\n");
    fprintf("\nUSANDO INTERPOLACIÓN\n");  
    for i=1:length(aproxValues)
        fprintf("La aproximación obtenida (fx%d) para 7.5 ", i);
        fprintf("con una interpolación de grado %d fue: %.4f\n", i, fnx1);
    end
    fprintf("....\n");
    fprintf("La aproximación obtenida (fx%d) para 7.5 ", length(ps)-1);
    fprintf("con una interpolación de grado %d (Newton) fue: %.4f\n", length(ps)-1, fnxN); 
    fprintf("\nUSANDO REGRESIÓN\n");
    fprintf("El error encontrado en esta solución fue de: %.4f\n", error);
    
    for i=1:length(a)
        fprintf("El valor del coeficiente a%d es de: %.4f\n", (i-1), a(i));
    end
    
    xlabel('T ( C^{ \circ })');
    ylabel('\mu');
    legend("Muestra de datos", "Interpolación lineal", "Interpolación cuadrática", "Interpolación de Newton", "f(x) encontrada con regresión");
    fprintf("---------------------------------------------------------\n");
end

function problemaCinco()
    syms z
    a = 0;
    b = 30;
    fz = ((250 * z) / (6 + z)) * (exp(-z / 10));
    F = matlabFunction(fz);
    
    valorReal = integral(F, a, b);
    valorTrapecio = metodoNumerico.metodoReglaTrapecio(a, b, 5, F);
    valorSimpson13 = metodoNumerico.metodoSimpson13(a, b, 5, F);
    valorSimpson38 = metodoNumerico.metodoSimpson38(a, b, 5, F);

    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 5\n");
    fprintf("El valor real de la integral es: %.3f\n", valorReal);
    fprintf("El valor de la aprox con el método del Trapecio es: %.3f\n", valorTrapecio);
    fprintf("El valor de la aprox con el método de Simpson 1/3 es: %.3f\n", valorSimpson13);
    fprintf("El valor de la aprox con el método de Simpson 3/8 es: %.3f\n", valorSimpson38);
    fprintf("---------------------------------------------------------\n");
end

function problemaReal()
    ps = [0.0 0.2 0.3 0.4 0.5 0.6 0.7; 0.302 0.185 0.106 0.093 0.240 0.579 0.561]';
    figure(7)
    hold on
    grid on 
    plot(ps(:,1), ps(:,2), 'ob')
    
    %interpolación lineal
    ps1 = [0.6 0.7; 0.579 0.561]';
    [fnx1, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps1, 1.0);
    plot(1.0, fnx1, '*r') 
    %interpolación cuadrática
    ps2 = [0.5 0.6 0.7; 0.240 0.579 0.561]';
    [fnx2, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps2, 1.0);
    plot(1.0, fnx2, 'sg')

    aproxValues = [fnx1, fnx2];
    
    %regresión cuadrática (polinomio que satisface la parábola solicitada)
    [a, error] = metodoNumerico.metodoRegresionPolinomial(ps, 6);
    
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA VIDA REAL\n");
    fprintf("\nUSANDO INTERPOLACIÓN\n");  
    for i=1:length(aproxValues)
        fprintf("La aproximación obtenida (fx%d) para 1.0 ", i);
        fprintf("con una interpolación de grado %d fue: %.4f\n", i, aproxValues(i));
    end
    fprintf("\nUSANDO REGRESIÓN\n");
    fprintf("El error encontrado en esta solución fue de: %.4f\n", error);
    
    for i=1:length(a)
        fprintf("El valor del coeficiente a%d es de: %.4f\n", (i-1), a(i));
    end
    
    %title("Magnitud relativa m de una estrella a través del tiempo t");
    xlabel("t");
    ylabel("m");
    legend("Muestra de datos", "Interpolación lineal", "Interpolación cuadrática", "f(x) encontrada con regresión");
    fprintf("---------------------------------------------------------\n");
end