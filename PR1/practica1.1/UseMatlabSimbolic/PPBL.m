%% FUNCION PPBL: Polinomios en Base de Lagrange

% TITULO: Polinomios en Base de Lagrange (PPBL)
% AUTOR: IVAN MARTIN GOMEZ
%
% SINTAXIS: Lij(n,a,b)
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: n   --> Numero Puntos Discretos del Intervalo Cerrado
%   ARGUMENTO 2: X   --> Vector fila con n puntos discretos equiespaciados
%
% SALIDA:        Li --> Vector con los valores del Polinomio en Base de Lagrange                  
%                        Li = [Lo, L1, ..., Ln] en Simbolico. Recordar que como en
%                        Matlab se empizan a indexar los vectores en 1,
%                        entonces sustituiremos el subindice 0 por 1 y el
%                        subundice n por n+1
%                             
%
% ERRORES:
%   ERROR 1: Se comprueba que n >= 2, en caso contrario se devuelve error.
% 
% DESCRIPCION: Esta funcion calcula cada uno de los Polinomios en Base de Lagrange  
%              
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------
%Empieza funcion

function Li = PPBL(n,X)
    %Control de Errores en Argumentos de Entrada
        %ERROR 1: Se comprueba que n >= 2, en caso contrario se devuelve error.
            if (n <= 1)
                error ('El n?mero de puntos para calcular los Polinomios en Base Lagrange debe ser mayor que cero')
            end
    %FIN Control de Errores en Argumentos de Entrada
%-------------------------------------------------------
%-------------------------------------------------------
    %Empieza funcionalidad funcion
        syms x;
        for i = 1:n     
            L(i)=sym('1');
            for j = 1:n
                if(i~=j)
                    L(i) = L(i) * (x - X(j))/(X(i)-X(j));  
                end
            end
        end
        Li = L;
        
%       for i = 1:n 
%           for j = 1:n                
%               Laux(i,j)=subs(L(i),x,X(j));                 
%           end
%       end
        
        %spy(Laux,'+',20);
end
%   FIN funcionalidad funcion
%-------------------------------------------------------
%------------------------------------------------------- 
%FIN funcion