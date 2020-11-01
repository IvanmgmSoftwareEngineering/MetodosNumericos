%% practica1.3: Metodo de la Secante

%  Datos: 
%       --> Funcion que queremos Aproximar:         f(x)  
%       
%       --> Vector inicial :                        X
%
%       --> Tolerancia:                             epsilon  



function [zero] = secante(f,X,epsilon)
syms x ;

    X_aux=X;
    contador_iteraciones=0;
    while(true)
        contador_iteraciones=contador_iteraciones+1;
        f0=double(subs(f,x,X_aux(1)));
        f1=double(subs(f,x,X_aux(2)));
        df1=double(subs((f1-f0)/(X_aux(2)-X_aux(1))));
        x_n=X_aux(2)-f1*df1^-1;
    
        if(abs(x_n-X_aux(2))<epsilon)
            zero=x_n;
            contador_iteraciones
            break;
        else
            X_aux(1)=X_aux(2);
            X_aux(2)=x_n;
        end  
    end
%FIN FUNCION
end

