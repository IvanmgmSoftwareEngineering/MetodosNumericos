%% TRIANGULARIZACION SUPERIOR (sin pivote parcial)
%  eliminacion_gaussiana_spp.m
%  AUTOR: IVAN MARTIN GOMEZ
%%
%  Argumentos entrada: 
%       --> Matriz:            A_in (n filas x n columnas)
%       
%       --> Vector:            b_in (n filas x 1 columnas)
%
%  Salida:
%       --> Matriz:            A_resutado (n filas x n columnas)
%       
%       --> Vector:            b_resultado (n filas x 1 columnas)
%
%  Error:
%       --> Error 1: La Matriz A tiene algun elemento de su Diagonal
%                    Principal igual a cero.
%       --> Error 2: El numero de Columnas de la Matriz A debe ser igual al
%                    numero de Filas del Vector b

%   Descripcion: Al ser sin Pivote Parcial la Matriz A, es condicion
%                necesaria para poder aplicar este algoritmo que todos los elementos de
%                la Diagonal Principal de la Matriz A sean distintos de cero.

%----------------------------------------------------------------------------------
function [U, b_resultado] = eliminacion_gaussiana_spp(A_in, b_in)
    %Daclaracion y Especificacion de Variables
        A=A_in;
        b=b_in;
        N=length(b);
        size_A=size(A);
    %Control de Errores de Argumentos
        %Error 2
         if(N~=size_A(2))
            fprintf('Error: las dimensiones de la Matriz A y del Vector b no son validas');
            return;
         end
         %Error 1
         for i=1:N
             if(A(i,i)==0)
                fprintf('Error: tiene al menos un 0 en la posicion (%i,%i) de su Diagonal Principal, por lo que este M?todo No es aplicable',i,i);
                return; 
             end
         end
             
    %FIN Control de Errores de Argumentos
    
    for k=1:N-1
        for i=k+1:N
            pivote = A(i,k)/A(k,k);
            for j=k:N
                A(i,j)=A(i,j) - pivote * A(k,j);
            end
            b(i)=b(i) - pivote * b(k);
        end
    end
    U=A;
    b_resultado=b;
end

