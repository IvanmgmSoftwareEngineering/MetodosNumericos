%% PRACTICA2.1(version 01): METODOS DE 1 PASO (EULER, RUNGE-KUTTA)
%  DESCRIPCION: Resolucion de Problemas de Valor Inicial(PVI) haciendo uso
%  del Metodo de Euler Explicito y el Metodo de Euler Implicito
%  AUTOR: IVAN MARTIN GOMEZ

%% PROBLEMA_1: PVI orden 1

%  Datos: 
%           |--> EDO:                    y'= y -t^2 +1
%   (PVI) = |--> Intervalo:              (0,1)
%           |--> Condicion Inicial:      y(0)=0.5            

%            --> Paso discretizacion:    h=0.2
%            --> Solucion Exacta:        y(t)=(t+1)^2 - 0.5e^t

%----------------------------------------------------------------------------------
close all;
clear all;
clc;

% Definimos variables simb?licas
syms t yn;
yx=(t+1)^2-0.5*exp(t);

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.2; % Paso
y0=0.5; % Condicion Inicial

%       --> Discretizamos el intervalo (0,1)

            tn=a:h:b;
            
                               
% Apartado a): Metodo de Euler Explicito

%       --> Resolvemos el problema

%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           - Columna 1: Puntos discretos del soporte
%           - Columna 2: Valores exactos de la Solucion
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
                    %solucion_exacta(i)=subs(yx,t,tn(i))
                end
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo de Euler Explicito
                solucion_aproximada(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada(i)=solucion_aproximada(i-1) + h*(solucion_aproximada(i-1)-tn(i-1)^2 +1);
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error(i)=abs(solucion_exacta(i)-solucion_aproximada(i));
                end



%       --> Representamos Graficamente: la Aproximacion obtenido mediante el
%           Metodod de Euler Explicito y la Solucion Exacta

               format long;
               n0=100;
               X0=linspace(a,b,n0);
               F=zeros(1,n0);
               for i=1:n0
                y_exacta(i)=subs(yx,t,X0(i));
               end
               figure(1);
               % Dibujamos Solucion Excata
               plot(X0,y_exacta,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Soluci?n Exacta VS Soluci?n Aproximada');
               xlabel('t');
               axis([a b 0 3]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Soluci?n Exacta','Soluci?n Aproximada'); 
               lgd = legend;
               lgd.FontSize = 14;

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas pequenhos (con graficas de: la Aproximacion
%           obtenida a traves del Metodo de Euler Explicito y el Error
%           cometido)
            paso=h;
            figure(2);
            j=1;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
                    %solucion_exacta(i)=subs(yx,t,tn(i))
                end
                % Obtenemos Aproximacion
                solucion_aproximada(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada(i)=solucion_aproximada(i-1) + paso*(solucion_aproximada(i-1)-tn(i-1)^2 +1);
                end
                figure(2);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    error(i)=abs(solucion_exacta(i)-solucion_aproximada(i));
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,error,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                
            
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia');
            xlabel('t');
            axis([a b 0 3]);
            legend('Aproximaci?n h=0.2','Aproximaci?n h=0.1','Aproximaci?n h=0.05','Aproximaci?n h=0.025','Aproximaci?n h=0.0125','Aproximaci?n h=0.00625'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo');
            xlabel('t');
            axis([a b 0 0.2]);
            legend('Aproximaci?n h=0.2','Aproximaci?n h=0.1','Aproximaci?n h=0.05','Aproximaci?n h=0.025','Aproximaci?n h=0.0125','Aproximaci?n h=0.00625'); 
            lgd = legend;
            lgd.FontSize = 14;


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
%           hacia valores mas pequenhos (con graficas de: la Aproximacion
%           obtenida a traves del Metodo de Euler Implicito y el Error
%           cometido)

% Apartado c): Comparamos para distintos valores del Paso de discretizacion (h), 
%             las Solucion aproximada y la Solucion exacta para ambos Metodos.        
                   
          
 %% PROBLEMA_3: PVI orden 2

%  Datos: 
%           |--> EDO:                    10u"+ 50|u'|u' + 200u = 0 
%   (PVI) = |--> Intervalo:              (0,0.1)
%           |--> Condicion Inicial 1:    u(0)=0   
%           |--> Condicion Inicial 2:    u'(0)=1            

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
%             hacia valores mas pequenhos (con graficas de: la Aproximacion
%             obtenida a traves del Metodo de Euler Explicito y el Error
%             cometido)
         

% Apartado c) Hacemos estudio del resultado de la Solucion Aproximada para 
%             variaciones de los Parametros Fisicos. Hacemos tabla con las
%             siguientes columnas:
%               Columna 1: Masa (M)
%               Columna 2: Constante Amortiguador (B)
%               Columna 3: Constante Muelle (k)
%               Columna 4: Intervalo T=(a,b)
%               Columna 5: Condicion Inicial 1: Posicion Inicial masa
%               Columna 6: Condicion Inicial 2: Velocidad Inicial masa

                   
          
                          

                   
   
   
   
   



