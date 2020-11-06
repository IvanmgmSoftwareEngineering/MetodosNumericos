%% SUSTITUCION REGRESIVA [INVERSA => usamos U(upper)]
%  sustitucion_regresiva_inversa.m
%  AUTOR: IVAN MARTIN GOMEZ

%%
%  Argumentos entrada: 
%       --> Matriz:            U (n filas x n columnas)
%       
%       --> Vector:            b_in (n filas x 1 columnas)
%
%  Salida:     
%       --> Vector:            x_resultado (n filas x 1 columnas)
%
%  Error:
%       --> Error 1: La Matriz U debe ser Diagonal Superior
%       --> Error 2: El numero de Columnas de la Matriz U debe ser igual al
%                    numero de Filas del Vector b

%   Descripcion: Al ser sin Pivote Parcial la Matriz A, es condicion
%                necesaria para poder aplicar este algoritmo que todos los elementos de
%                la Diagonal Principal de la Matriz A sean distintos de cero.

%----------------------------------------------------------------------------------

function x_out = sustitucion_regresiva_inversa( U,b_in )
    %Daclaracion y Especificacion de Variables
        A=U;
        b=b_in;
        N=length(b);
        size_A=size(A);
    %Control de Errores de Argumentos
        %Error 2
         if(N~=size_A(2))
            fprintf('Error: las dimensiones de la Matriz A y del Vector b no son validas\n');
            return;
         end
         %Error 1
         for i=1:N
             for j=1:N
                if(A(i,j)>=10^-10)
                    if(i>j)
                        fprintf('Error: Este Metodo no es aplicable. La Matriz U debe ser Diagonal Superior.\n');
                        return; 
                    end
                end
             end
         end
             
    %FIN Control de Errores de Argumentos
        
        x(N) = b(N)/A(N,N);
        for i=N-1:-1:1
            suma=0;
            for j=i+1:N
                suma = suma + A(i,j) * x(j);
            end
            x(i) = (b(i)-suma)/A(i,i);
        end
        x_out=x;
    

end

