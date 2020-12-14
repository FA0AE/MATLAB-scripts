function B = Adjunta(A)
    B = zeros(size(A,1), size(A,1));
    
    for i=1:size(A,1)       %Se recorren filas
        for j =1:size(A,1)  %Se recorren columnas
            B(i,j) = (-1) ^ (i+j) * det(Menor(A, i,j)); %Fórmula
        end
    end
    
end