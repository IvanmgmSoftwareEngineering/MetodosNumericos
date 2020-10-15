%% FUNCION PPBL: Polinomios en Base de Lagrange

% TITULO: Polinomios en Base de Lagrange (PPBL)
% AUTOR: IVAN MARTIN GOMEZ
%
% SINTAXIS: Lij(n,a,b)
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: n   --> Numero Puntos Discretos del Intervalo Cerrado
%
% SALIDA:        Lij --> Matriz con los valores del Polinomio en Base de Lagrange
%                        particularizados en cada punto discrero del Intervalo Cerrado
%                        Lij = [Lo(xo),Lo(x1),...,Lo(xn);L1(xo),L1(x1),...,L1(xn);...;Ln(xo),Ln(x1),...,Ln(xn)]
%                             = [1,0,0,...,0 ; 0,1,0,...,0 ; 0,0,0,...,1]
%
% ERRORES:
%   ERROR 1: Se comprueba que n >= 2, en caso contrario se devuelve error.
% 
% DESCRIPCI?N: Esta funcion calcula cada uno de los Polinomios en Base de Lagrange (habr? tantos como puntos discretos n) y 
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

function Lij = PPBL(n)
    %Control de Errores en Argumentos de Entrada
        %ERROR 1: Se comprueba que n > 0, en caso contrario se devuelve error.
            if (n <= 1)
                error ('El n?mero de puntos para calcular los Polinomios en Base Lagrange debe ser mayor que cero')
            end
    %FIN Control de Errores en Argumentos de Entrada
%-------------------------------------------------------
%-------------------------------------------------------
    %Empieza funcionalidad funcion

        L=zeros(n,n);

        for i = 1:n+1
            for j = 1:n+1
                if ( i == j)
                    L(i,j) = 1;
                else
                    L(i,j) = 0;
                end
            end
        end
        Lij = L;
end
%   FIN funcionalidad funcion
%-------------------------------------------------------
%------------------------------------------------------- 
%FIN funci?n