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
                error ('El n?mero de puntos para calcular los Polinomios en Base de Lagrange debe ser mayor que cero')
            end

%FIN Control de Errores en Argumentos de Entrada
%-------------------------------------------------------
%-------------------------------------------------------
%Empieza la funcionalidad de la Rutina

    
    
        
    %Seleccionamos los puntos del Intervalo Cerrado [a,b] que seran
    %utilizados en cada una de la Aproximaciones
        if(formula_Rectangulo_Izquierdo==1)
            X=[a];
        elseif(formula_Rectangulo_Derecho==1)
            X=[b];
        elseif (formula_Rectangulo_Medio==1)
            X=[(a+b)/2];
        elseif (formula_Rectangulo_Compuesta_delta_cte==1)
            X=X1;
        elseif (formula_Trapecio==1)
            X=[a b];
        elseif (formula_Trapecio_Compuesta_delta_cte==1)
            X=X1;
        end
       
        
    %Obtenemos las Aproximaciones de las Integrales
        if(formula_Rectangulo_Izquierdo==1)
            I_rec(1) = abs(subs(f,x,X(1))*(b-a));
        elseif(formula_Rectangulo_Derecho==1)
            I_rec(2) = abs(subs(f,x,X(1))*(b-a));
        elseif (formula_Rectangulo_Medio==1)
            I_rec(3) = abs(subs(f,x,X(1))*(b-a));
        elseif (formula_Rectangulo_Compuesta_delta_cte==1)
            deltaX=X(2)-X(1);
            I_rec(4)=0;
            for i=1:99              
                I_rec(4) = I_rec(4) + abs(rec_F(i)*(deltaX));
            end       
        elseif (formula_Trapecio==1)
            I_trap(1)=(max([subs(f,x,a) subs(f,x,b)])-min([subs(f,x,a) subs(f,x,b)]))*(b-a)/2 + min([subs(f,x,a) subs(f,x,b)])*(b-a);
        elseif (formula_Trapecio_Compuesta_delta_cte==1)
            deltaX=X(2)-X(1);
            I_trap(2)=0;
            for i=1:99              
                I_trap(2) = I_trap(2) + (max([trap_F(i) trap_F(i+1)])-min([trap_F(i) trap_F(i+1)]))*deltaX/2 + min([trap_F(i) trap_F(i+1)])*deltaX;
            end
        end
    
        


        






%FIN Rutina