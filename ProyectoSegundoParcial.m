% Francisco Ariel Arenas Enciso 
% A01369122
% Actividad Integradora 2

% main() Function
function ProyectoSegundoParcial()    
    % Llamadas a las funciones que resuelven los problemas 
    problemaUno();
    problemaDos();  
    problemaTres();
    problemaCuatro();
    problemaCinco();
end 

function problemaUno()
    ps = [0.25 0.75 1.25 1.5 2.0; -0.45 -0.6 0.7 1.88 6.0]';
    figure(1)
    hold on
    grid on 
    plot(ps(:,1), ps(:,2), 'ob')
     
    %interpolación lineal
    ps1 = [0.75 1.25; -0.6 0.7]';
    [fnx1, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps1, 1.15);
    plot(1.15, fnx1, '*r') 
    %interpolación cuádratica
    ps2 = [0.75 1.25 1.5; -0.6 0.7 1.88]';
    [fnx2, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps2, 1.15);
    plot(1.15, fnx2, 'sk') 
    %interpolación cúbica
    ps3 = [0.25 0.75 1.25 1.5; -0.45 -0.6 0.7 1.88]';
    [fnx3, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps3, 1.15);
    plot(1.15, fnx3, '+c') 
    %interpolación grado 4
    ps4 = ps;
    [fnx4, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps4, 1.15);
    plot(1.15, fnx4, 'xg') 
    legend("Muestra de datos", "Interpolación grado 1", "Interpolación grado 2", "Interpolación grado 3", "Interpolación grado 4");
    
    aproxValues = [fnx1, fnx2, fnx3, fnx4];
    
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 1\n");
    for i=1:length(aproxValues)
        fprintf("La aproximación obtenida (fx%d) para 1.15 ", i);
        fprintf("con una interpolación de grado %d fue: %.4f\n", i, aproxValues(i));
    end
    fprintf("---------------------------------------------------------\n");
end 

function problemaDos()
    ps = [88.9 108.5 104.1 139.7 127 94 116.8 99.1; 14.6 16.7 15.3 23.2 19.5 16.1 18.1 16.6]';
    figure(2)
    hold on 
    grid on
    plot(ps(:,1), ps(:,2), 'or')

    [a, error] = metodoNumerico.metodoRegresionPolinomial(ps, 1);

    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 2\n");
    fprintf("El error encontrado en esta solución fue de: %.4f\n", error);

    for i=1:length(a)
        fprintf("El valor del coeficiente a%d es de: %.4f\n", (i-1), a(i));
    end

    legend('Muestra de datos', 'f(x) generada')
    fprintf("---------------------------------------------------------\n");
end

function problemaTres()
    ps = [0 100 200 400 600 800 1000; 0 0.82436 1.00000 0.73576 0.40601 0.19915 0.09158]';
    figure(3)
    hold on
    grid on 
    plot(ps(:,1), ps(:,2), 'ob')
     
    %interpolación cúbica
    ps3 = [200 400 600 800; 1.00000 0.73576 0.4601 0.19915]';
    [fnx3, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps3, 450);
    plot(450, fnx3, '*r') 
    %interpolación grado 4
    ps4 = [100 200 400 600 800; 0.82436 1.00000 0.73576 0.4601 0.19915]';
    [fnx4, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps4, 450);
    plot(450, fnx4, 'sk') 
    %interpolación grado 5
    ps5 = [0 100 200 400 600 800; 0 0.82436 1.00000 0.73576 0.4601 0.19915]';
    [fnx5, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps5, 450);
    plot(450, fnx5, '+c') 
    %interpolación grado 6
    ps6 = ps;
    [fnx6, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps6, 450);
    plot(450, fnx6, 'xg') 
    legend("Muestra de datos", "Interpolación grado 3", "Interpolación grado 4", "Interpolación grado 5", "Interpolación grado 6");
    
    aproxValues = [fnx3, fnx4, fnx5, fnx6];
    
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 3\n");
    for i=1:length(aproxValues)
        fprintf("La aproximación obtenida (fx%d) para 450 ", i);
        fprintf("con una interpolación de grado %d fue: %.4f\n", i+2, aproxValues(i));
    end
    fprintf("---------------------------------------------------------\n");
end

function problemaCuatro()
    ps = [1.8 2 2.2 2.4 2.6; 0.5815 0.5767 0.556 0.5202 0.4708]';
    figure(4)
    hold on
    grid on 
    plot(ps(:,1), ps(:,2), 'ob')
    
    %interpolación lineal
    ps1 = [2 2.2; 0.5767 0.556]';
    [fnx1, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps1, 2.1);
    plot(2.1, fnx1, '*r') 
    %Interpolación cuadrada
    ps2 = [2 2.2 2.4; 0.5767 0.556 0.5202]';
    [fnx2, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps2, 2.1);
    plot(2.1, fnx2, '+c')
    %Interpolación cúbica
    ps3 = [1.8 2 2.2 2.4; 0.5767 0.5767 0.556 0.5202]';
    [fnx3, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps3, 2.1);
    plot(2.1, fnx3, 'xg') 
    %Interpolación de Newton
    ps4 = ps;
    [fnx4, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps4, 2.1);
    plot(2.1, fnx4, 'sk') 
    legend("Muestra de datos", "Interpolación lineal", "Interpolación cuadrada", "Interpolación cúbica", "Interpolación de Newton");
    
    aproxValues = [fnx1, fnx2, fnx3, fnx4];
    
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 4\n");
    for i=1:length(aproxValues)
        fprintf("La aproximación obtenida (fx%d) para 2.1 ", i);
        fprintf("con una interpolación de grado %d fue: %.4f\n", i, aproxValues(i));
    end
    fprintf("---------------------------------------------------------\n");
end

function problemaCinco()
    ps = [0 5 10 20 30 40; 1.787 1.519 1.307 1.002 0.7975 0.6529]';
    figure(5)
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
    fprintf("PROBLEMA 5\n");
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
    
    legend("Muestra de datos", "Interpolación lineal", "Interpolación cuadrática", "Interpolación de Newton", "f(x) encontrada con regresión");
    fprintf("---------------------------------------------------------\n");
end