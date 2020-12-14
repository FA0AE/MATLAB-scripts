function D = Inversa(A)
    D = Adjunta(A)' ./ det(A);
end