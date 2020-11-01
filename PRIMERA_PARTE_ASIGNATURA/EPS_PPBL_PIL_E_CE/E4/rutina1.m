%% rutina1: Polinomio Interpolador de Lagrange

% TITULO: Polinomio Interpolador de Lagrange (PIL)
% AUTOR: IVAN MARTIN GOMEZ

% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: n   --> Numero Puntos Discretos del Intervalo Cerrado
%   ARGUMENTO 2: a   --> Extremo Inferior Intervalo Cerrado. Lo toma del
%                        Workspace
%   ARGUMENTO 3: b   --> Extremo Superior Intervalo Cerrado. Lo toma del
%                        Workspace
%
% ERRORES:
%   ERROR 1: Se comprueba que a < b, en caso contrario se devuelve error.
%   ERROR 2: Se comprueba que n > 0, en caso contrario se devuelve error.
%    
% DESCRIPCION: Esta rutina1.m, llamara a la funcion PBL(n)
%              que devuelve una matriz con cada uno de los Polinomios en Base Lagrange
%              particularizados en cada uno de los n puntos discretos del intervalo
%              cerrado [a,b].
%              A continuacion, llamara a la funcion PIL(n,a,b,Lij)
%              que devuelve un vector fila con el resultado de
%              particularizar cada uno de los n puntos discretos del
%              intervalo cerrado [a,b] en el Polinomio Interpolador de
%              Lagrange.
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------
%Control de Errores en Argumentos de Entrada

    %ERROR 1: Se comprueba que a < b, en caso contrario se devuelve error.
        if (a >= b)
            error ('El Extremo inferior del Intervalo debe ser mayor que el Extremo Superior del Intervalo')
        end
        
    %ERROR 2: Se comprueba que n > 0, en caso contrario se devuelve error.
            if (n <= 0)
                error ('El numero de puntos para calcular los Polinomios en Base de Lagrange debe ser mayor que cero')
            end

%FIN Control de Errores en Argumentos de Entrada
%-------------------------------------------------------
%-------------------------------------------------------
%Empieza la funcionalidad de la Rutina

    %Tomamos n Puntos Equiespaciados dentro del Intervalo Cerrado [a,b] y los
    %almacenamos en un vector fila llamado 'X'.
       
        X=linspace(a,b,n);

    %Llamamos a la funcion PPBL.m para obtener los Polinomios en Base de
    %Lagrange
    
        L=PPBL(n,X);
        
    
        
    %Llamamos a la funcion PIL.m para obtener el Polinomio Interpolador de
    %Lagrange
    
        p=PIL(n,X,L,f);
        
                                           
        
        
     %Llamamos a la funcion Error.m para obtener la expresion del Error y 
     %la Cota de Error.
        abs_gr=[];
        abs_hr=[];
        [error,cotaError,g,h,abs_gr,abs_hr]=Error(n,X,f);
    
        


        






%FIN Rutina