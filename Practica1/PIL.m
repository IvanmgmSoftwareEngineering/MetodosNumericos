%% FUNCION PIL: Polinomio Interpolador de Lagrange

% TITULO: Polinomio Interpolador de Lagrange (PIL)
% AUTOR: IVAN MARTIN GOMEZ
%
% SINTAXIS: I(n,X,L)
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: n   --> N?mero Puntos Discretos del Intervalo Cerrado
%   ARGUMENTO 2: X   --> Vector fila con n puntos discretos
%   ARGUMENTO 4: L   --> Matriz Polinomios en Base de Lagrange 
%  *ARGUMENTO 5: f   --> Funci?n que queremos aproximar. El * indica que
%                        no es un Argumento de entrada propiamente dicho porque 
%                        no se le pasa como Argumento de entrada a la funci?n PIL.m.
%                        La intenci?n es que m?s adelante, cuando hagamos uso
%                        de Matlab Simb?lico, esta funci?n f que deseamos aproximar
%                        sea un Argumento de entrada de la funci?n PIL.m.
%  
%
% SALIDA:        In  --> Matriz con los valores del Polinomio Interpolador de Lagrange
%                        particularizados en cada punto del Intervalo Cerrado
%                        In = [In(xo),In(x1),...,In(xn)]
%                             
%
% ERRORES: -
%   
% 
% DESCRIPCI?N: Esta funci?n calcula el Polinomio Interpolador de Lagrange, despu?s particulariza 
%              en cada uno de los n puntos discretos del Intervalo Cerrado,
%              ,obteniendo as? un vector fila. Notar que los
%              pasos anteriormente citados ("...calcula el 
%              Polinomio Interpolador de Lagrange" y "particulariza..."), 
%              no se llevan a acabo propiamente dicho en esta funci?n. Esta
%              funci?n no utiliza Matlab Simb?lico por lo que haremos uso
%              de la definici?n de Polinomio Interpolador de Lagrange para obtener sus
%              valores.
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------
%Empieza funci?n


function I = PIL(n,X,L)
    %Empieza funcionalidad funcion

        
        
        %Calculamos el Polinomio Interpolador de Lagrange y
        %particularizamos en cada uno de los puntos discretos
        
            F=zeros(1,n);
            
            for i=1:n
                for j=1:n
                    if (i==j)
                        F(i)=L(i,j)*(exp(-X(i)) + cos(4*X(i)/pi));
                    end
                end
            end 
            
            I=F; 
     %FIN funcionalidad funcion
end
%FIN funci?n