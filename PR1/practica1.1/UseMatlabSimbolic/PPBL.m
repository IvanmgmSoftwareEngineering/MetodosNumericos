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
%                        Li = [Lo, L1, ..., Ln]. Recordar que c?mo en
%                        Matlab se empizan a indexar los vectores en 1,
%                        entonces sustituiremos el sub?ndice 0 por 1 y el
%                        sub?ndice n por n+1
%                             
%
% ERRORES:
%   ERROR 1: Se comprueba que n >= 2, en caso contrario se devuelve error.
% 
% DESCRIPCION: Esta funcion calcula cada uno de los Polinomios en Base de Lagrange (habr? tantos como puntos discretos n) y 
%              los almacena en diferentes filas de un vector columna [Lo;L1;...;Ln], despues particulariza cada
%              uno de los polinomios obtenidos antes en cada uno de los n
%              puntos discretos, obteniendo asi una matriz. Notar que los
%              pasos anteriormente citados ("...calcula cada uno de los 
%              Polinomios en Base de Lagrange" y "particulariza..."), 
%              no se llevan a acabo propiamente dicho en esta funci?n. Esta
%              funcion no utiliza Matlab Simbolico por lo que haremos uso
%              de la definicion de Polinomios en Base de Lagrange para obtener sus
%              valores. Por lo dicho antes, esta funcion solo necesita como
%              Argumento de entrada el numero de puntos discretos n.
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------
%Empieza funci?n

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
        sim L
        for i = 1:n+1 
            
            L(i)=sym('1');
            for j = 1:n+1
                if(i~=j)
                L(i) = L(i) * (x - X(j))/(X(i)-X(j));  
                end
            end
        end
        Li = L;
end
%   FIN funcionalidad funcion
%-------------------------------------------------------
%------------------------------------------------------- 
%FIN funci?n