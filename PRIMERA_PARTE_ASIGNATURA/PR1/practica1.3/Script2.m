%% Script2: Metodo de Newton-Raphson
%  DESCRIPCION: Obtener punto donde corta al eje de abscisas
%  AUTOR: IVAN MARTIN GOMEZ

%% practica1.3:

%  Datos: 
%       --> Funcion que queremos Aproximar:      f(x) = x*sin(x^2/2)+exp(-x)
%       
%       --> intervalo Cerrado:                   [a,b]
%
%       --> Tolerancia:                          epsilon  


%----------------------------------------------------------------------------------
close all;
clear all;
clc;

%       --> Especificamos Funcion f(x)= x*sin(x^2/2)+exp(-x) de la cual
%           queremos encontrar una aproximaci?n de una de sus raices

                
                syms x;               
                f =  x*sin(x^2/2)+exp(-x) ;
                y= @(x) x*sin(x.^2/2)+exp(-x);
                
%       --> Especificamos el intervalo cerrado [a,b].
%               
                a=2;
                b=3;
                
%       --> Especificamos Tolerancia
%               
                epsilon=3*(b-a)/4;
                
%------------------------------------------------------------------------------------       

        
            
%       --> MANERA 2) fzero(funcion, punto) 
%                           Donde el punto
%                           debe ser un punto x0 que previamente
%                           hayamos estimado con el Metodo grafico.

                       x0_aleatroio=rand()*(b-a)+a; %Pertenece al intervalo [a,b]
                       tStart2=tic();
                       R_ref_newton=fzero(y,x0_aleatroio)
                       duracion_ejecucion2=toc(tStart2)       
            
%   --> Paso 1) Obtenemos el valor de la aproximacion utilizando el Metodo
%               de Newton-Raphson
                       tStart=tic();
                       R_newton=newton(f,x0_aleatroio,epsilon)
                       duracion_ejecucion=toc(tStart) 
                       
%   --> Paso 2) Obtenemos el error: Error=|R_newton - R_ref_newton|

                        Error=abs(R_newton-R_ref_newton)


