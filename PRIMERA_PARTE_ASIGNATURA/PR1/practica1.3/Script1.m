%% Script1: Metodo de la Bisectriz
%  DESCRIPCION: Obtener punto donde corta al eje de abscisas
%  AUTOR: IVAN MARTIN GOMEZ

%% practica1.3:

%  Datos: 
%       --> Funcion:         f(x) = x*sin(x^2/2)+exp(-x)
%       
%       --> Intervalo Cerrado:                      [a,b] = [ , ]
%
%       --> Tolerancia:                             epsilon = 


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
                epsilon=(b-a)/5;
                
%------------------------------------------------------------------------------------       

%   --> Paso 1) Dibujamos la funcion f(x) en un intervalo [a,b], lo suficientemente 
%               grande como para poder dar una primera aproximacion de las
%               raices de la funcion mediante el metodo grafico. Notar que
%               mediante este metodo iremos haciendo zoom en las regiones
%               donde intuimos visualmente que el funcion f(x) corta al eje de
%               abscisas.

                X=linspace(a,b,1000);
                F=zeros(1,1000);
                for i=1:1000
                    F(i)=subs(f,x,X(i));
                end
                figure(1);
                plot(X,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
                title('f(x)');
                xlabel('x');
                axis([a b -10 10]);
                grid on;
                hold on;
                
%   --> Paso 2) Obtenemos el valor de referencia utilizando la funcion
%               fzero(). Notar que la funcion fzero(), se puede utlizar de dos maneras:

%       --> MANERA 1) fzero(funcion, intervalo finito)
%                           Donde el intervalo
%                           finito debe contener una raiz en algun punto x0 que previamente
%                           hayamos estimado con el M?todo gr?fico. Esta
%                           manera sera la m?s indicada para comparar los
%                           resultados obtenidos mediante el Metodo de la
%                           Biseccion

                        tStart1=tic();
                        R_ref_bisec=fzero(y,[a b]);
                        duracion_ejecucion1=toc(tStart1);

%   --> Paso 3) Obtenemos el valor de la aproximacion utilizando el Metodo
%               de la Biseccion
                        tStart=tic();
                        R_biseccion=biseccion(f,[a b],epsilon);
                        duracion_ejecucion=toc(tStart);
                       
%   --> Paso 4) Obtenemos el error: Error=|R_biseccion - R_ref_bisec|

                        Error=abs(R_biseccion-R_ref_bisec);




                    
                       


           
            
            
            
            
