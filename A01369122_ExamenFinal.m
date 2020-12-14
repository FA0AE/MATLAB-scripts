% Francisco Ariel Arenas Enciso
% A01369122
% Examen Final

% main() Function
function A01369122_ExamenFinal()    
    % Llamadas a las funciones que resuelven los problemas   
    problemaUno();
    problemaDos();
    problemaTres();
    problemaCuatro();
    problemaCinco();
    problemaSeis();
end 

function problemaUno()
    syms H
    q = (sqrt(0.0002)*((20*H)^(5/3))) / (0.03 * ((20 + (2*H))^(2/3))) - 6;
    dq = diff(q);
    Q = matlabFunction(q);
    dQ = matlabFunction(dq);
    [xs, fxs, i] = metodoNumerico.metodoNewton(10, Q, dQ, 30, 1e-4);
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 1\n");
    fprintf("Error: %d\n", abs(fxs(end)));
    fprintf("H: %d\n", xs(end));
    fprintf("Iteraciones: %d\n", i)
    fprintf("\n---------------------------------------------------------\n");
end

function problemaDos()
    A = [1 -3 12; 4 1 -1; 2 7 1];
    b = [31 3 19]';
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 2\n");
    adjunta = metodoNumerico.adjunta(A)
    inversa = metodoNumerico.inversa(A)
    sol = inversa*b;
    for i=1:length(sol)
        fprintf("El valor de x%d es: %.2f\n", i, sol(i))
    end
    fprintf("\n---------------------------------------------------------\n");
end

function problemaTres()
    ps = [10 20 30 40 50 60 70 80 90; 35 35.6 36.25 36.9 37.5 38.1 38.8 39.4 40]';
    
    %interpolación grado 3
    ps3 = [10 20 30 40; 35 35.6 36.25 36.9]';
    [fnx3, ~] = metodoNumerico.metodoInterpolacionPolinomial(ps3, 25);
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 3\n");
    fprintf("La aproximación con interpolación de grado 3 fue: %.5f", fnx3);
    fprintf("\n---------------------------------------------------------\n");
end 

function problemaCuatro()
    ps = [1 2 3 4 5 6; 10 10.9 9.5 15 12.8 13.9]';
    [a, error] = metodoNumerico.metodoRegresionPolinomial(ps, 5);
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 4\n");
    fprintf("El error encontrado en esta solución fue de: %d\n", error);
    
    for i=1:length(a)
        fprintf("El valor del coeficiente a%d es de: %.4f\n", (i-1), a(i));
    end
    fprintf("---------------------------------------------------------\n");
end

function problemaCinco()
    syms x
    b = pi/2;
    a = 0;
    f = ((sin(x))^3) * ((cos(x))^4);
    fx = matlabFunction(f);
    
    valorReal = integral(fx, a, b);
    n = metodoNumerico.buscarNaproxIntegral(a,b,10,fx,@metodoNumerico.metodoSimpson38,1e-4,valorReal);
    valorSimpson38 = metodoNumerico.metodoSimpson38(a, b, n, fx);
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 5\n");
    fprintf("El valor real de la integral es: %d\n", valorReal);
    fprintf("El número de segentos principales creados para esta aproximación fue: %d\n", n)
    fprintf("El valor de la aprox con el método de Simpson 3/8 es: %d\n", valorSimpson38);
    fprintf("---------------------------------------------------------\n");
end

function problemaSeis()
    syms v(t)
    v(t) = dsolve(diff(v)==(9.81) - ((12.5 / 68.1) * v), v(0)==0);
    vt = matlabFunction(v);
    
    syms f(t, v)
    f(t,v) = (9.81) - ((12.5 / 68.1) * v);
    df = matlabFunction(f);
    
    [ts,vs,error] = metodoNumerico.metodoRK4(0,1,13,1.0,df,vt);
    fprintf("\n---------------------------------------------------------\n");
    fprintf("PROBLEMA 6\n");
    fprintf("El valor aproximado es: %d\n", vs(end));
    fprintf("El error de esta aproximación es de: %d\n", error);
    fprintf("---------------------------------------------------------\n");
end

