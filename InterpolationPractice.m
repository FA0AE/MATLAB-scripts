%{
EJERCICIO INTERPOLACIÓN
 27/OCTUBRE/2020
 AUTOR: FRANCISCO ARIEL ARENAS ENCISO
%}

%PARTE 1
ps = [1 2 3 5 7 8; 3 6 19 99 291 444]';
figure(1)
hold on
grid on 
plot(ps(:,1), ps(:,2), '-ob')

%Interpolación lineal
ps1 = [3 5; 19 99]';
[fnx, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps1, 4);
plot(4, fnx, '*r') 
%interpolación cuádratica
ps2 = [2 3 5; 6 19 99]';
[fnx2, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps2, 4);
plot(4, fnx2, 'sk') 
%interpolación cúbica
ps3 = [2 3 5 7; 6 19 99 291]';
[fnx3, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps3, 4);
plot(4, fnx3, 'xc') 
%interpolación grado 4
ps4 = [1 2 3 5 7; 3 6 19 99 291]';
[fnx4, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps4, 4);
plot(4, fnx4, '+g')

aproxValues = [fnx, fnx2, fnx3, fnx4];
    
fprintf("\n---------------------------------------------------------\n");
fprintf("PROBLEMA 1\n");
for i=1:length(aproxValues)
   fprintf("La aproximación obtenida (fx%d) para 4 ", i);
   fprintf("con una interpolación de grado %d fue: %.4f\n", i, aproxValues(i));
end
legend("Muestra de datos", "Interpolación grado 1", "Interpolación grado 2", "Interpolación grado 3", "Interpolación grado 4");
fprintf("---------------------------------------------------------\n");

%PARTE 2
ps = [0 8 16 24 32 40; 14.621 11.843 9.870 8.418 7.305 6.413]';
figure(2)
hold on
grid on 
plot(ps(:,1), ps(:,2), '-ob')

%Interolación lineal
ps1 = [24 32; 8.418 7.305]';
[fnx, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps1, 27);
plot(27, fnx, '*r')  
%interpolación de Newton
psN = ps;
[fnxN, ~] = metodoNumerico.metodoInterpolacionPolinomial(psN, 27);
plot(27, fnxN, 'sg')

aproxValues = [fnx, fnxN];

fprintf("\n---------------------------------------------------------\n");
fprintf("PROBLEMA 2\n");
j = 1;
for i=1:length(aproxValues)
   fprintf("La aproximación obtenida (fx%d) para 27 ", i);
   fprintf("con una interpolación de grado %d fue: %.4f\n", j, aproxValues(i));
   j = length(ps);
end
legend("Muestra de datos", "Interpolación lineal", "Interpolación de Newton");
fprintf("---------------------------------------------------------\n");
