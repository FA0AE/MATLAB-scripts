function [xs,fxs,i]=metodoPuntoFijo(x0,f,g,iter,tol) 
%Ayudar en el performance del m todo  diff�    
xs=zeros(1,iter+1);    
fxs=xs;    
xs(1)=x0;    
fxs(1)=f(x0);    
    for i=1:iter %primer criterio de paro #iteraciones        
    %Segundo criterio de paro        
    if abs(fxs(i))<tol            
        xs=xs(1:i);            
        fxs=fxs(1:i);            
        return        
    end
    xs(i+1)=g(xs(i));        
    fxs(i+1)=f(xs(i+1));    
    end
end