function M = Menor(A, i, j)
    M = A;
    M(i,:) = [];  % <- Seleccionano la fila i asignando una matriz vacía
    M(:,j) = [];  % <- Seleccionano la columna j asignando una matriz vacía
end