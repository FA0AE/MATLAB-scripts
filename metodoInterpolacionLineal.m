
%% Interpolación lineal

%Función para interpolar un punto $$x\in(x_0,x_1)$

%% Parámetros de entrada
% PS: Una matriz de puntos $$PS = \pmatrix{x_0 & f(x_0) \cr x_1 & f(x_1)}$
% x: Un escalar del cual se quiere apróximar el valor de su función $$x\in(x_0,x_1)$

%% Parámetros de salida
% f1x: Valor de la función interpolada de $$x$

%% Código de la función
function f1x = metodoInterpolacionLineal(PS, x)
       b0 = PS(1, 2);
       b1 = (PS(2, 2) - PS(1, 2)) / (PS(2, 1) - PS(1, 1));
       f1x = b0 + (b1 * (x - PS(1, 1)));
end