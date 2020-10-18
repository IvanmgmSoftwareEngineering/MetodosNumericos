%% FUNCION PIL: Polinomio Interpolador de Lagrange

% TITULO: Polinomio Interpolador de Lagrange (PIL)
% AUTOR: IVAN MARTIN GOMEZ
%
% SINTAXIS: I(n,X,L)
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: n   --> Numero Puntos Discretos del Intervalo Cerrado
%   ARGUMENTO 2: X   --> Vector fila con n puntos discretos equiespaciados
%   ARGUMENTO 4: L   --> Matriz Polinomios en Base de Lagrange 
%  *ARGUMENTO 5: f   --> Funcion que queremos aproximar. El * indica que
%                        no es un Argumento de entrada propiamente dicho porque 
%                        no se le pasa como Argumento de entrada a la funcion PIL.m.
%                        La intencion es que mas adelante, cuando hagamos uso
%                        de Matlab Simbilico, esta funcion f que deseamos aproximar
%                        sea un Argumento de entrada de la funcion PIL.m.
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
% DESCRIPCION: Esta funcion calcula el Polinomio Interpolador de Lagrange, despues particulariza 
%              en cada uno de los n puntos discretos del Intervalo Cerrado,
%              ,obteniendo asi un vector fila. Notar que los
%              pasos anteriormente citados ("...calcula el 
%              Polinomio Interpolador de Lagrange" y "particulariza..."), 
%              no se llevan a acabo propiamente dicho en esta funcion. Esta
%              funcion no utiliza Matlab Simbolico por lo que haremos uso
%              de la definicion de Polinomio Interpolador de Lagrange para obtener sus
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