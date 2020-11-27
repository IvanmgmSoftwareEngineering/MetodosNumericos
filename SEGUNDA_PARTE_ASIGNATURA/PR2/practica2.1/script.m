%% PRACTICA2.1(versi?n 1): METODOS DE 1 PASO (EULER, RUNGE-KUTTA)
%  DESCRIPCION: Resoluci?n de Problemas de Valor Inicial(PVI) haciendo uso
%  de el Metodo de Euler Explicito y el Metodo de Euler Implicito
%  AUTOR: IVAN MARTIN GOMEZ

%% PROBLEMA_1: PVI orden 1

%  Datos: 
%           |--> EDO:                    y'= y -t^2 +1
%   (PVI) = |--> Intervalo:              (0,1)
%           |--> Condici?n Inicial:      y(0)=0.5            

%            --> Paso discretizacion:    h=0.2
%            --> Soluci?n Exacta:        y(t)=(t+1)^2 - 0.5e^t

%----------------------------------------------------------------------------------
close all;
clear all;
clc;

%       --> Discretizamos el intervalo (0,1)
                               
% Apartado a): Metodo de Euler Explicito

%       --> Resolvemos el problema

%       --> Elaboramos Tabla de datos con las siguientes columnas
%           - Columna 1: Puntos discretos del soporte
%           - Columna 2: Valores exactos de la Soluci?n
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo de Euler Explicito
%           - Columna 4: Error realmente cometido relativo

%       --> Representamos Graficamente: la Aproximacion obtenido mediante el
%           Metodod de Euler Explicito y la Solcion Exacta

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas peque?os (con graficas de: la Aproximacion
%           obtenida a traves del Metodo de Euler Explicito y el Error
%           cometido)


% Apartado b): Metodo de Euler Implicito 
         
%       --> Resolvemos el problema

%       --> Elaboramos Tabla de datos con las siguientes columnas
%           - Columna 1: Puntos discretos del soporte
%           - Columna 2: Valores exactos de la Soluci?n
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo de Euler Implicito
%           - Columna 4: Error realmente cometido relativo

%       --> Representamos Graficamente: la Aproximacion obtenido mediante el
%           Metodod de Euler Implicito y la Solcion Exacta

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas peque?os (con graficas de: la Aproximacion
%           obtenida a traves del Metodo de Euler Implicito y el Error
%           cometido)

% Apartado c): Comparamos para distintos valores del Paso de discretizacion (h), 
%             las Solucion aproximada y la Solucion exacta para ambos Metodos.        
                   
          
 %% PROBLEMA_3: PVI orden 2

%  Datos: 
%           |--> EDO:                    10u"+ 50|u'|u' + 200u = 0 
%   (PVI) = |--> Intervalo:              (0,0.1)
%           |--> Condici?n Inicial 1:    u(0)=0   
%           |--> Condici?n Inicial 2:    u'(0)=1            

%            --> Paso discretizacion:    h=0.05
%----------------------------------------------------------------------------------
close all;
clear all;
clc;

%       --> Discretizamos el intervalo (0,0.1)
                               
% Apartado a): Metodo de Euler Explicito Vectorial

%       --> Hacemos Cambio de Variable: para pasar de un PVI con una EDO de
%           Orden dos y dos Condiciones Iniciales, a dos PVIs Acoplados de
%           Orden 1 con una Condicion Inicial cada uno de ellos

%       --> Resolvemos los dos PVIs de Orden 1 haciendo uso del Metodo de
%           Euler Explicito

%       --> Representamos Graficamente la Solucion Aproximada u(t)

%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable u'(t)


% Apartado b) Estudiamos la Convergencia: variamos el Paso de discretizacion
%             hacia valores mas peque?os (con graficas de: la Aproximacion
%             obtenida a traves del Metodo de Euler Explicito y el Error
%             cometido)
         

% Apartado c) Hacemos estudio del resultado de la Solucion Aproximada para 
%             variaciones de los Parametros Fisicos. Hacemos tabla con las
%             siguientes columnas:
%               Columna 1: Masa (M)
%               Columna 2: Constante Amortiguador (B)
%               Columna 3: Constante Muelle (k)
%               Columna 4: Intervalo
%               Columna 5: Condicion Inicial 1: Posicion Inicial masa
%               Columna 6: Condicion Inicial 2: Velocidad Inicial masa

                   
          
                          

                   
   
   
   
   



