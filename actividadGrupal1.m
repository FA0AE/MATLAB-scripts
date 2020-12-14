%Delcaración de costantes
L=12;
r=1.3;
V=12.4;

%Declaración de variables
syms h

%Declaración de la función
f = L * ((0.5*pi*(r^2)) - ((r^2)*asin(h/r)) - h*sqrt((r^2)-(h^2))) - V;
df = diff(f);
fh = matlabFunction(f);
dfh = matlabFunction(df);

%Declaración de métodos
[xs1, fxs1, i1]=metodoBiseccion(0,1, fh, 50, 1e-6);
[xs2, fxs2, i2]=metodoFalsaPosicion(0,1, fh, 50, 1e-6);
[xs3, fxs3, i3]=metodoNewton(0,fh, dfh, 50, 1e-6);

fprintf("Las iteraciones con Bisección fueron: %d\n", i1);
fprintf("Las iteraciones con Falsa Posición fueron: %d\n", i2);
fprintf("Las iteraciones con Newton fueron: %d\n", i3);

%Se da el valor de la profundidad con la fórmula r-xs3(end)
profundidad = r-xs3(i3);
fprintf("La profundidad del agua es: %d\n", profundidad);

%Gráfica de error (el error es fxn)
figure(1)
hold on 
grid on 

%error del método de Bisección
plot(1:i1, fxs1, 'r-');
%error del método de Fasa Posición
plot(1:i2, fxs2, 'b-');
%error del método de Newton
plot(1:i3, fxs3, 'g-');

%Elementos de la gráfica
legend("Error Bisección","Error Falsa Posición","Error Newton");
xlabel("# de iteraciones");
ylabel("f(h)");

%El mejor método es Newton porque realiza menos iteraciones para conseguir
%un buen resultado acotado por la tolerancia dada. Sin embargo, éste puede
%fallar en ciertos momentos ya que puede divergir o la derivada necesaria
%no podría ser obtenida. 
