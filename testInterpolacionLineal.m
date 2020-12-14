PS = [1 0; 6 1.791759];
fx1 = metodoInterpolacionLineal(PS, 2);
fprintf('fx1 = %.7f\n', fx1);
fprintf('Error cuadrático: %.7f\n', ((log(2) - fx1)^2));

fprintf('---------------------------------------------\n')

PS = [1 0; 4 1.386294];
fx1 = metodoInterpolacionLineal(PS, 2);
fprintf('fx1 = %.7f\n', fx1);
fprintf('Error cuadrático: %.7f\n', ((log(2) - fx1)^2));
