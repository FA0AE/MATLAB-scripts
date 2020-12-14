%{
EJERCICIO REGRESIÓN
 27/OCTUBRE/2020
 AUTOR: FRANCISCO ARIEL ARENAS ENCISO
%}

%PARTE 1
ps = [6 7 11 15 17 21 23 29 29 37 39; 29 21 29 14 21 15 7 7 13 0 3]';
figure(1)
hold on 
grid on
plot(ps(:,1), ps(:,2), 'or')

[a, error] = metodoNumerico.metodoRegresionPolinomial(ps, 1);

fprintf("\n---------------------------------------------------------\n");
fprintf("PROBLEMA 1\n");
fprintf("El error encontrado en esta solución fue de: %.4f\n", error);

for i=1:length(a)
    fprintf("El valor del coeficiente a%d es de: %.4f\n", (i-1), a(i));
end

legend('Puntos', 'f(x) generada')
fprintf("---------------------------------------------------------\n");

%PARTE 2
ps2 = [5:5:50; 17 24 31 33 37 37 40 40 42 41]';
figure(2)
hold on 
grid on
plot(ps2(:,1), ps2(:,2), 'or')

[a, error] = metodoNumerico.metodoRegresionPolinomial(ps2, 2);

fprintf("\n---------------------------------------------------------\n");
fprintf("PROBLEMA 2\n");
fprintf("El error encontrado en esta solución fue de: %.4f\n", error);

for i=1:length(a)
    fprintf("El valor del coeficiente a%d es de: %.4f\n", (i-1), a(i));
end

legend('Puntos', 'f(x) generada')
fprintf("---------------------------------------------------------\n");

%PARTE 3
ps3 = [10:10:80;25 70 380 550 610 1220 830 1450]';
figure(3)
hold on 
grid on 
plot(ps3(:,1), ps3(:,2), 'or')

[a, error] = metodoNumerico.metodoRegresionPolinomial(ps3, 7);

fprintf("\n---------------------------------------------------------\n");
fprintf("PROBLEMA 3\n");
fprintf("Se pudo reducir el error hasta el grado %d ya que hay %d elementos\n",length(ps3(:,1))-1, length(ps3(:,1)))
fprintf("El error encontrado en esta solución fue de: %d\n", error);

for i=1:length(a)
    fprintf("El valor del coeficiente a%d es de: %.4f\n", (i-1), a(i));
end

legend('Puntos', 'f(x) generada')
fprintf("---------------------------------------------------------\n");

