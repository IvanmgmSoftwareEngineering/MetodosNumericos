%% Funcion: M?todo de la Bisecci?n
%  biseccion.m

%  Datos: 
%       --> Funcion que queremos Aproximar:         f(x) = 
%       
%       --> Intervalo Cerrado:                      [a,b] = [ , ]
%
%       --> Tolerancia:                             epsilon = 



function [zero] = biseccion(f,X,epsilon)

syms x;

%Comprobacion de Errores argumentos

if(length(X)~=2)
    fprintf('Error: el Argumento X debe ser un vector de 2 componentes');
    return;
end
if(X(1)>=X(2))
    fprintf('Error: el primer elemento del vector X (X(1)) debe ser mayor que el segundo elemento del vector X (X(2))');
    return; 
end
if((subs(f,x,X(1))>0 && subs(f,x,X(2))>0)||(subs(f,x,X(1))<0 && subs(f,x,X(2))<0))
    fprintf('Error: el M?todo de la Bisecci?n no es aplicable por no haber diferencia de signo en los extremos del intervalo ');
    return; 
end

%Fin comprobacion Errores argumentos

%Empieza funcionalidad de la Funci?n

    % En primer lugar calculamos el n?mero m?nimo de iteracciones n que
    % deber? hacer el m?todo para arrojar una aproximaci?n. Conociendo
    % el valor de n (redondeado al entero superior) nos evitaremos tener
    % que realizar una comprobaci?n  en cada iteraci?n, dicha comprobaci?n
    % que evitamos realizar es la asociada al Cirterio de parada asociado
    % con el valor de Tolerancia epsilon.
    
        n = ceil((log((X(2)-X(1))/epsilon))/log(2));
        
    % Empieza el bucle que calcula en n iteraciones una aproximacion de la
    % raiz de la funci?n f(x)
    
        X_aux=X;
        for i=1:n %Criterio de parada 2
            
            x_medio=(X_aux(1)+X_aux(2))/2;
            
            f_inferior=subs(f,x,X_aux(1));
            f_superior=subs(f,x,X_aux(2));
            f_medio=subs(f,x,x_medio);
            
            %Criterio de parada 1
            if(f_inferior==0)
                    zero=X_aux(1);
                    break;
            end
            if(f_superior==0)
                    zero=X_aux(2);
                    break;
            end
            if(f_superior==0)
                    zero=x_medio;
                    break;
            end
             
            if((f_inferior > 0 && f_medio > 0)||(f_inferior < 0 && f_medio < 0))
                        X_aux(1)=x_medio;
            else
                        X_aux(2)=x_medio;  
            end            
        end
        zero=x_medio;        
%FIN FUNCI?N
end

