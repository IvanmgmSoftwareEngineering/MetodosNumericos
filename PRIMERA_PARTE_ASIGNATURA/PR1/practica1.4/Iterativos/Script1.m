%% PRACTICA 1.4: RESOLUCION DE SISTEMAS DE ECUCACIONES LINEALES
%  RESOLUCION DE SISTEMAS DE ECUACIONES LINEALES POR JACOBI y GAUSS-SEIDEL (Metodo Iterativo)
%  EJERCICIO 1
%  Script1.m
%  AUTOR: IVAN MARTIN GOMEZ
%
%  Notas:
%       Nota 1: Parten de una Solucion inicial (mala) y van dando pasos
%               buscando la solucion correcta
%       Nota 2: Tienen asociado un error de truncamiento
%       Nota 3: Se usan para matrices en las que la mayoria de elementos de
%               A son nulos (matrices "sparse")
%       Nota 4: Se usan para matrices grandes (n>>1000)
%       Nota 5: Algoritmos sencillos de implementar

%% EJERCICIO: Ax=b

%  Datos: 
%       --> Matriz A:                  A (n filas x n columnas). Matriz de Coeficientes
%       
%       --> Vector x_sol:              x (n filas x 1 columnas). Solucion exacta          
%
%       --> Vector b:                  b (n filas x 1 columnas). Matriz terminos Independientes
%
%       --> Vector x_0:                x_0 (n filas x 1 columnas). Aproximacion Inicial
%
%       --> Tolerancia:                tolerancia. 
%


%   --> Descripcion: Obtener una aproximacion del vector x utilizando el Metodo
%                    de Jacobi. Busca la Solucion del Sistema Lineal del tipo: x_k = B * x_k-1 + C donde:
%                                                                                                   B = D^-1*[A-D]
%                    Obtener una aproximacion del vector x utilizando el Metodo
%                    de Gauss-Seidel.                                                                                C = D^-1*b     donde:
%                                                                                                                      D= d_ii=a_ii y d_ij=0 (si i~=j) 
%   --> Normas de Vectores:
%           - Norma 'p' de Vector 'v=[v_1 v_2 ... v_i ... v_n]': ||v||p = (sumatorio (desde 1 hasta n)[|v_i|^p])^(1/p)
%           - Norma 'inf' de Vector 'v=[v_1 v_2 ... v_i ... v_n]': ||v||inf = max{|v_i|} 
%
%   --> Nomas de Matrices:
%           - Norma inducida por Norma 'p' de Vector 'v=[v_1 v_2 ... v_i ...v_n]' : ||A||p = max{||Av||p/||v||p}
%           - Norma 1: ||A||1 = max{sumatorio (desde 1 hasta n)|a_ij|} (sumamos todos los elementos de una misma columna y asi con cada columna, finalmente nos quedamos con el maximo de entre todas las columnas)
%           - Norma inf: ||A||inf = ... (sumamos todos los elementos de una misma fila y asi con cada fila, finalmente nos quedamos con el maximo de entre todas las filas)
%           - Norma 2: (Tambien conocida como norma Euclidea): ||A||2 = sqrt(rho_a A_T A) donde:
%                                                                                           rho_a= max{|lambda_i|}
%                                                                                           lambda_i= autovalores de la Matriz A
%                                                                                           (nota: para obtener los autovalores de una Matriz A resolvemos: det(A -lambda*I)=0)
%   --> El Error de la aproximacion lo podremos obtener a traves de dos vias:
%           - Via 1: Si!! conocemos la Solucion ==> error_k= |x_sol - x_k|
%           - Via 2: No!! conocemos la Solucion ==> 2 opciones:
%               - Opcion 1: error_k= |x_k-1 - x_k|
%               - Opcion 2: r_k= Ax_k - b
%
%   --> Criterios de parada:
%           - Criterio de Parada 1: Numero maximo de Iteraciones (Parada de
%                                 emergencia por si el Criterio de Parada 2 falla (hay funciones que tienen
%                                 MUY lentamente a cero)
%           - Criterio de Parada 2: Tolerancia delta; if(||error_k|| < delta) ==> STOP  
%           - Criterio de Parada 3: Tolerancia delta: if(||r_k|| < delta) ==> STOP
%
%   --> Condiciones de Convergencia: 
%           - Condicion 1: Comprobar si A es estrictamente Diagonal Dominante por filas
%           - Condicion 2: rho(B) = Radio Espectral < 1. donde:
%                                                         B = D^-1*[A-D]
%                                                         rho(B)=max{|lambda_i|}. No confundir estos lambdas con los de
%                                                         antes, estos lambdas son los autovalores asociados a la Matriz B
%
%   --> Condicion necesaria para poder aplicar el Metodo: A(i,i) ~= 0 para todo i desde 1 hasta n
%----------------------------------------------------------------------------------
close all;
clear all;
clc;
format long;



        % Introduciomos los datos del Ejercicio
        
            A=[3 -0.1 -0.2;0.1 7 -0.3;0.3 -0.2 10]
            b=[7.85;-19.3;71.4]
            x_sol=[3 -2.5 7];
            tolerancia=10^-11;
            x_0= [0 0 0];
            
% RESOLVEMOS POR JACOBI

        % Llamamos a la funcion jacobi.m
            tStart=tic; % Tomamos captura de la hora actual
            [x_aproximaciones_jacobi, error_1_jacobi, error_2_jacobi] = jacobi(A,b,tolerancia,x_0,x_sol)
            tiempo_jacobi=toc(tStart)% Tomamos captura de la hora actual y calculamos la diferecnia
            tolerancia %Imprimimos por vantana de comandos el valor de la Tolerancia

        % Donde:
            % error_1_jacobi: es el error calculado con la Solucion Exacta (x_sol)   
            % error_2_jacobi: es el error calculado con la Iteracion anterior 
                
        
% FIN JACOBI 
% ----------------------------------------------------------------------------             
% ----------------------------------------------------------------------------             
% RESOLVEMOS POR GAUSS-SEIDEL                 
            % Llamamos a la funcion gauss_seidel.m
               tStart=tic; % Tomamos captura de la hora actual
               [x_aproximaciones_gauss, error_1_gauss, error_2_gauss] = gauss_seidel(A,b,tolerancia,x_0,x_sol)
               tiempo_gauss_seidel=toc(tStart)% Tomamos captura de la hora actual y calculamos la diferecnia
               tolerancia %Imprimimos por vantana de comandos el valor de la Tolerancia
        
            % Donde:
                % error_1_gauss: es el error calculado con la Solucion Real (x_sol)
                % error_2_gauss: es el error calculado con la Iteracion anterior 

% FIN GAUSS-SEIDEL   
% ----------------------------------------------------------------------------             
% ----------------------------------------------------------------------------             
           
                    
                    