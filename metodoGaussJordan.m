function [x]=metodoGaussJordan(A,b)    
     %Matriz extendida    
     M=[A b];        
     %Primer for es para visitar los elementos de la diagonal    
     for i=1:size(A,1)        
     %Dividir la fila para que el elemento de la diagonal nos de 1        
         if M(i,i)~=1            
            M(i,:)=M(i,:)./M(i,i);            
            disp(M)        
         end
     %Segundo for es para convertir los elementos que no estan en la        
     %diagonal en 0        
         for j=1:size(A,1)            
             if i~=j               
                M(j,:)=M(j,:)-M(j,i)*M(i,:);                
                disp(M)            
             end
         end
     end
     x=M(:,end); 
     %Regresar el resultado   
end 