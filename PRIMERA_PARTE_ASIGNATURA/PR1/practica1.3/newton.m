%% practica1.3: Metodo de Newton-Raphson

%  Datos: 
%       --> Funcion que queremos Aproximar:         f(x)  
%       
%       --> Punto inicial x0:                       x0
%
%       --> Tolerancia:                             epsilon  



function [zero] = newton(f,x0,epsilon)
syms x ;

    x0_aux=x0;
    contador_iteraciones=0;
    while(true)
        contador_iteraciones=contador_iteraciones+1;
        f0=double(subs(f,x,x0_aux));
        df=diff(f);
        df0=double(subs(df,x,x0_aux));
        x_aux=(-f0/df0)+x0_aux;
    
        if(abs(x_aux-x0_aux)<epsilon)
            zero=x_aux;
            contador_iteraciones
            break;
        else
            x0_aux=x_aux;
        end  
    end
%FIN FUNCION
end

