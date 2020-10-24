%% FUNCION PIL: Polinomio Interpolador de Lagrange

% TITULO: Polinomio Interpolador de Lagrange (PIL)
% AUTOR: IVAN MARTIN GOMEZ
%
% SINTAXIS: I(n,X,L)
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: n   --> Numero Puntos Discretos del Intervalo Cerrado
%   ARGUMENTO 2: X   --> Vector fila con n puntos discretos equiespaciados
%   ARGUMENTO 4: L   --> Matriz Polinomios en Base de Lagrange 
%   ARGUMENTO 5: f   --> Funcion que queremos aproximar.
%  
%
% SALIDA:        p   --> Polinomio Interpolador de Lagrange
%                             
%
% ERRORES:
%   ERROR 1: Se comprueba que n >= 2, en caso contrario se devuelve error.
%   
% 
% DESCRIPCION: Esta funcion calcula el Polinomio Interpolador de Lagrange 
%             
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------
%Empieza funcion


function p = PIL(n,X,L,f)

    %Control de Errores en Argumentos de Entrada
        %ERROR 1: Se comprueba que n >= 2, en caso contrario se devuelve error.
            if (n < 1)
                error ('El numero de puntos para calcular los Polinomios en Base Lagrange debe ser mayor que cero')
            end
    %FIN Control de Errores en Argumentos de Entrada
%-------------------------------------------------------
%-------------------------------------------------------
    %Empieza funcionalidad funcion

        
        
        %Calculamos el Polinomio Interpolador de Lagrange 
            syms x;
            inter=sym('0');
            for i=1:n    
                 f_aux=subs(f,x,X(i));
                 inter=inter + f_aux*L(i) ;                                   
            end 
            
            p=inter;
         
     %FIN funcionalidad funcion
end
%FIN funcion