%% rutina1: Polinomio Interpolador de Lagrange

% TITULO: Polinomio Interpolador de Lagrange (PIL)
% AUTOR: IVAN MARTIN GOMEZ
%
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: a --> Extremo Inferior del Intervalo Cerrado
%   ARGUMENTO 2: b --> Extremo Superior del Intervalo Cerrado
%   ARGUMENTO 3: n --> N?mero Puntos del Intervalo Cerrado utilizados en la Iterpolaci?n 
%   ARGUMENTO 4: f --> Funci?n que queremos Aproximar mediante el 
%
% SALIDA:        
%
% ERRORES:
%   ERROR 1: Se comprueba que a < b, en caso contrario se devuelve error.
%   ERROR 2: Se comprueba que n > 0, en caso contrario se devuelve error.
%    
% DESCRIPCION: Esta Rutina1, en primer lugar llamar? a la funci?n PBL(n)
% que devuelve una matriz con cada uno de los Polinomios en Base Lagrange
% particularizados en cada uno de los puntos discretos del intervalo
% cerrado.
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------
% Argumentos de Entrada al Programa (Modificables por el usuario)

    % ARGUMENTO 1: Intervalo Cerrado, dado mediante dos valores enteros, Extremo Inferior
    %              del Intervalo (a) y Extremo Superior del Intervalo (b). [a,b]

        prompt='Introduzca el valor del extremo inferior del Intervalo cerrado (N?mero Entero): ';
        a = input(prompt);
        
        prompt='Introduzca el valor del extremo Superior del Intervalo cerrado (N?mero Entero): ';
        b = input(prompt);
       
       

    % ARGUMENTO 2: N?mero de puntos discretros del Intervalo Cerrado que vamos
    %              a utilizar. En todos los casos tomaremos n puntos Equiespaciados.
    %              Del Intervalo Cerrado [a,b] nos quedamos n Puntos del Intervalo Cerrado [a,b].
    %              [a=xo, x1, x2, ..., b=xn], expresado en la notacion de Matlab (las
    %              primeras posiciones de los vectores se indexan por 1) [a=x1, x2, x3, ..., b=x(n-1)]            
        
        prompt='Introduzca el valor del n?mero de puntos (N?mero Entero > 0): ';
        n = input(prompt);
        

%FIN Argumentos de Entrada al Programa
%-------------------------------------------------------
%-------------------------------------------------------
%Control de Errores en Argumentos de Entrada

    %ERROR 1: Se comprueba que a < b, en caso contrario se devuelve error.
        if (extremo_inf_interval >= extremo_sup_interval)
            error ('El Extremo inferior del Intervalo debe ser mayor que el Extremo Superior del Intervalo')
        end
        
    %ERROR 2: Se comprueba que n > 0, en caso contrario se devuelve error.
            if (numPuntos <= 0)
                error ('El n?mero de puntos para calcular los Polinomios en Base de Lagrange debe ser mayor que cero')
            end

%FIN Control de Errores en Argumentos de Entrada
%-------------------------------------------------------
%-------------------------------------------------------
%Empieza la funcionalidad de la Rutina

    %Tomamos n Equiespaciados dentro del Intervalo Cerrado [a,b] y los
    %almacenamos en un vector fila llamado 'puntos'.

        puntos= linspace(extremo_inf_interval,extremo_sup_interval,numPuntos);







%FIN Rutina