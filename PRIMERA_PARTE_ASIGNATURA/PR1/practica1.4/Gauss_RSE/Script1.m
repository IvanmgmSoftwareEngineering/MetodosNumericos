%% RESOLUCION DE SISTEMAS DE ECUACIONES POR GAUSS (Metodo Directo)
%  Script1.m
%  Notas Metodos Exactos:
%       - Nota 1: No tienen errores de truncamiento
%       - Nota 2: Son usados cuando la mayoria de elemntos de A son
%                 distintos de cero
%       - Nota 3: Son usados cuando la dimensi?n de A no es demasiaado
%                 grande (n<<1000, es decir, n<=100)
%       - Nota 4: Suelen ser Algoritmos dif?ciles de implementar
%       - Nota 5: Concepto de Pivote Parcial: asociado al proceso de
%                 Triangularizacion superior; consiste en el intercambio de filas de
%                 la Matriz A y el vector b, en el caso de encontrarnos un cero en
%                 uno de los elementos de la Diagonal Prinipal de A.
%       - Nota 6: Gauss = Triangularizacion Superior (sin Pivote Parcial ? con Pivote Parcial) (U) 
%                         + Sustitucion Regresiva Inversa. Recordar que con
%                         Pivote Parcial la Matriz A SI puede tener algun 0
%                         en su Diagonal Principal y el metodo se puede
%                         aplicar. Recordar que sin Pivote Parcial la
%                         Matriz A debe tener todos los elementos de su
%                         Diagonal Principal distintos de 0, en caso
%                         contrario el metodo NO sera aplicable.
%       - Nota 7: Gauss = Triangularizacion Inferior (L) + Sustitucion
%                         Progresiva Directa
%       - Nota 6: Otro Ejemplo de Metodo Directo son:
%             - Ejemplo 1: FACTORIZACION L-U: ofrece la ventaja frente a
%                          Gauss que si variamos el Vector b no es necesario volver a
%                          Triangularizar. Los pasos para aplicar el Metodo
%                          son:
%                           - Paso 1: Triangularizacion Superior para
%                                     obtener Upper (U)
%                           - Paso 2: Obtenemos Lower (L) a partir de la
%                                     transformaciones elementales llevadas a cabo
%                                     para obtener Upper
%                           - Paso 3: Ly=b mediante Sustitucion Progresiva
%                                     (Directa)
%                           - Paso 4: Ux=b mediante Sustitucion Regresiva
%                                     (Inversa)
%
%             
%  AUTOR: IVAN MARTIN GOMEZ

%% EJERCICIO: Ax=b

%  Datos: 
%       --> Matriz A:         A (n filas x n columnas)
%       
%       --> Vector x:         x (n filas x 1 columnas)          
%
%       --> Vector b:         b (n filas x 1 columnas)

%   Descripcion: Obtener el vector x utilizando el Metodo de Gauss. Para
%                resolverlo lo hacemos en dos pasos:
%                   - Paso 1: Triangularizaci?n Superior (tambine conocida como Eliminacion Gaussiana) de la Matriz A
%                   - Paso 2: Aplicamos una Sustitucion Regresiva

%----------------------------------------------------------------------------------
close all;
clear all;
clc;
format short;

        %Introduciomos los datos del Ejercicio
        
            A=[3 -0.1 -0.2;0.1 7 -0.3;0.3 -0.2 10]
            b=[7.85;-19.3;71.4]

        %Paso 1) Triangularizacion Superior (Eliminacion Gaussiana)
            [U b_ats]=eliminacion_gaussiana_spp(A,b);
             U %Upper
             b_ats %b asociada a triangular superior
        %Paso 2) Sustitucion Regresiva
            x_solucion=sustitucion_regresiva_inversa(U,b_ats)
        %Paso 3) Verificar resultado
            fprintf('-Sustituimos en el Sistema de Ecuaciones la Solucion obtenida-\n');
            N=length(b);
            if(abs(dot(A(1,:),x_solucion)-b(1))<10^-12)
                fprintf('--> ec 1 OK!!\n');
            else
                fprintf('--> ec 1 Error!!\n');
            end
            if(abs(dot(A(2,:),x_solucion)-b(2))<10^-12)
                fprintf('--> ec 2 OK!!\n');
            else
                fprintf('--> ec 2 Error!!\n');
            end
            if(abs(dot(A(3,:),x_solucion)-b(3))<10^-12)
                fprintf('--> ec 3 OK!!\n');
            else
                fprintf('--> ec 3 Error!!\n');
            end
            
                    
                    

