%% practica1.3: (PARTE 3)Metodo de Newton-Raphson
%  newton_adaptada.m
%  Datos: 
%       --> Funcion que queremos Aproximar:         f(x)  
%       
%       --> Punto inicial x0:                       x0
%
%       --> Tolerancia:                             epsilon  
%
%       --> Tabla:                                  TABLA_in 7x6 con zeros  
%
%   Salida:
%       --> Valor Aproximacion:                     zero  
%
%       --> Tabla con numero iteraciones 'n' y 
%           aproximacion en la iteracion n-esima:   TABLA 7x6  


function [zero, TABLA] = newton_adaptada(f,x0,epsilon,TABLA_in)
syms x ;

    x0_aux=x0;
    contador_iteraciones=0;
    while(true)
        contador_iteraciones=contador_iteraciones+1;
        f0=double(subs(f,x,x0_aux));
        df=diff(f);
        df0=double(subs(df,x,x0_aux));
        format long;
        x_aux=(-f0/df0)+x0_aux;
        %Codigo anadido para parte 3 practica 1.3
            TABLA_in(contador_iteraciones+1,1)=contador_iteraciones;
            TABLA_in(contador_iteraciones+1,2)=x_aux;
        if(abs(x_aux-x0_aux)<epsilon)
            zero=x_aux;
            TABLA=TABLA_in;
            break;
        else
            x0_aux=x_aux;
        end  
    end
%FIN FUNCION
end


