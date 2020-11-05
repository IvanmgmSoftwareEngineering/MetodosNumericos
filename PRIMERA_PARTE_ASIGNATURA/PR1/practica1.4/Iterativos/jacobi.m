%% Jacobi (Metodo Iterativo)
%  jacobi.m
%  AUTOR: IVAN MARTIN GOMEZ
%%
%  Argumentos entrada: 
%       --> Matriz:                      A_in (n filas x n columnas)
%       
%       --> Vector:                      b_in (n filas x 1 columnas)
%
%       --> Tolerancia:                  delta 
%
%       --> Aproximacion Inicial:        x_0  
%
%  Salida: 
%       --> Matriz:                      x (k filas x n columnas). Matriz
%                                                                  con las k aproximaciones
%       --> Error:                       e (k filas x 1 columna). Vector Error de cada iteracion. Se calcula comparando el valor de la
%                                                                 aproximacion actual con el valor de la aproximacion anterior
%  Error:
%       --> Error 1: La Matriz A tiene algun elemento de su Diagonal
%                    Principal igual a cero.
%       --> Error 2: El numero de Columnas de la Matriz A debe ser igual al
%                    numero de Filas del Vector b

%   Descripcion: Esta funcion obtiene una aproximacion en una numero maximo
%                de Iteraciones k

%----------------------------------------------------------------------------------



function [x,e_1,e_2] = jacobi(A_in,b_in,delta,x_0_in,x_sol_in)
    %Daclaracion y Especificacion de Variables
        A=A_in;
        b=b_in;
        x_0=x_0_in;
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
       x_out(1,:)=x_0;
       contador=2;
       error_2=x_0;
       while(error_2<delta)
        suma=0;
        for i=1:N
            for j=1:N
                if(i~=j)
                    suma=suma+A(i,j)*x_out(contador-1,j);
                end
            end
        end
        for i=1:N
                x_out(contador,i)=(b(i)-suma)/A(i,i); 
                error_1=abs(x_out(contador)-x_sol_in);
                error_2=abs(x_out(contador)-x_out(contador-1));
        end
        contador=contador+1;
       end
       x=x_out;
       e1=error_1;
       e2=error_2;
    

end

