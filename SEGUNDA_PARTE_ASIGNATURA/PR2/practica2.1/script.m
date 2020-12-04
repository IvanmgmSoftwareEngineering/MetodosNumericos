%% PRACTICA2.1(version 01 y 02): METODOS DE 1 PASO (EULER, RUNGE-KUTTA)

%  AUTOR: IVAN MARTIN GOMEZ

%  DESCRIPCION: Resoluci?n de Problema de Valor Inicial(PVI) de Orden 1 haciendo uso de los M?todo 
%               de Euler Expl?cito y Euler Impl?cito. Resoluci?n de Problema de Valor Inicial(PVI) 
%               de Orden 2 haciendo uso del M?todo de Euler Expl?cito. Resoluci?n de Problemas de Valor 
%               Inicial(PVI) de Orden 1 haciendo uso de los M?todos de Runge-Kutta de Orden 2, 3 y 4



%% PROBLEMA_1: Resolver PVI orden 1 con Metodos de Euler Explicito e Implicito

%  Datos: 
%           |--> EDO:                    y'= y -t^2 +1
%   (PVI) = |--> Intervalo:              (0,1)
%           |--> Condicion Inicial:      y(0)=0.5            

%            --> Paso discretizacion:    h=0.2
%            --> Solucion Exacta:        y(t)=(t+1)^2 - 0.5e^t

%----------------------------------------------------------------------------------
%% Apartado a): Metodo de Euler Explicito
close all;
clear all;
clc;

% Definimos variables simbolicas
syms t;
yx=(t+1)^2-0.5*exp(t);

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.2; % Paso
y0=0.5; % Condicion Inicial

       
                               


%       --> Resolvemos el problema

%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           - Columna 1: Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           - Columna 2: Valores exactos de la Solucion
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
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
                error(i)=abs(solucion_exacta(i)-solucion_aproximada(i))/solucion_exacta(i);
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
               title('Solucion Exacta VS Solucion Aproximada');
               xlabel('t');
               axis([a b 0 3]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada'); 
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
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso(j,i)=soluciones_aproximada_variamos_paso(j,i-1) + paso*(soluciones_aproximada_variamos_paso(j,i-1)-tn(i-1)^2 +1);
                end
                figure(2);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia');
            xlabel('t');
            axis([a b 0 3]);
            legend('Aproximacion h=0.2','Aproximacion h=0.1','Aproximacion h=0.05','Aproximacion h=0.025','Aproximacion h=0.0125','Aproximacion h=0.00625'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo');
            xlabel('t');
            axis([a b 0 0.1]);
            legend('Aproximacion h=0.2','Aproximacion h=0.1','Aproximacion h=0.05','Aproximacion h=0.025','Aproximacion h=0.0125','Aproximacion h=0.00625'); 
            lgd = legend;
            lgd.FontSize = 14;


%% Apartado b): Metodo de Euler Implicito 
         
close all;
clear all;
clc;

% Definimos variables simbolicas
syms t;
yx=(t+1)^2-0.5*exp(t);

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.2; % Paso
y0=0.5; % Condicion Inicial

%       --> Elaboramos Tabla de datos con las siguientes columnas
%           - Columna 1: Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           - Columna 2: Valores exactos de la Solucion
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
                end
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo de Euler Implicito
                solucion_aproximada(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada(i)=(solucion_aproximada(i-1) + h*(-tn(i)^2 +1))/(1-h);
                end
%           - Columna 4: Error realmente cometido relativo
                for i=1:length(tn)
                error(i)=abs(solucion_exacta(i)-solucion_aproximada(i))/solucion_exacta(i);
                end

%       --> Representamos Graficamente: la Aproximacion obtenido mediante el
%           Metodod de Euler Implicito y la Solcion Exacta
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
               title('Solucion Exacta VS Solucion Aproximada');
               xlabel('t');
               axis([a b 0 3]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada'); 
               lgd = legend;
               lgd.FontSize = 14;

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas pequenhos (con graficas de: la Aproximacion
%           obtenida a traves del Metodo de Euler Implicito y el Error
%           cometido)
            paso=h;
            figure(2);
            j=1;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso(j,i)=(soluciones_aproximada_variamos_paso(j,i-1) + paso*(-tn(i)^2 +1))/(1-paso);
                end
                figure(2);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; % Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia');
            xlabel('t');
            axis([a b 0 3]);
            legend('Aproximacion h=0.2','Aproximacion h=0.1','Aproximacion h=0.05','Aproximacion h=0.025','Aproximacion h=0.0125','Aproximacion h=0.00625'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo');
            xlabel('t');
            axis([a b 0 0.1]);
            legend('Aproximacion h=0.2','Aproximacion h=0.1','Aproximacion h=0.05','Aproximacion h=0.025','Aproximacion h=0.0125','Aproximacion h=0.00625'); 
            lgd = legend;
            lgd.FontSize = 14;

%% Apartado c): Comparamos para distintos valores del Paso de discretizacion (h), 
%             las Solucion aproximada y la Solucion exacta para ambos Metodos.  

close all;
clear all;
clc;

% Definimos variables simbolicas
syms t;
yx=(t+1)^2-0.5*exp(t);

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.2; % Paso
y0=0.5; % Condicion Inicial

    % Euler Explicito
        j=1;
        % Experimento 1: h=0.5
        h=0.5; 
        tn=a:h:b;
        for i=1:length(tn)
            solucion_exacta(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada(1)=y0; % Condicion Inicial
        for i=2:length(tn)
            solucion_aproximada(i)=solucion_aproximada(i-1) + h*(solucion_aproximada(i-1)-tn(i-1)^2 +1);
        end
        for i=1:length(tn)
        errores(j,i)=abs(solucion_exacta(i)-solucion_aproximada(i))/solucion_exacta(i);
        end
        figure(1);
        plot(tn,solucion_exacta,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        grid on;
        hold on;
        plot(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2);
        scatter(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
        
        % Experimento 2: h=0.2
        j=2;
        h=0.2; 
        tn=a:h:b;
        for i=1:length(tn)
            solucion_exacta(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada(1)=y0; % Condicion Inicial
        for i=2:length(tn)
            solucion_aproximada(i)=solucion_aproximada(i-1) + h*(solucion_aproximada(i-1)-tn(i-1)^2 +1);
        end
        for i=1:length(tn)
        errores(j,i)=abs(solucion_exacta(i)-solucion_aproximada(i))/solucion_exacta(i);
        end
        figure(1);
        plot(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        scatter(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
    
    
        % Experimento 3: h=0.1
        j=3;
        h=0.1; 
        tn=a:h:b;
        for i=1:length(tn)
            solucion_exacta(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada(1)=y0; % Condicion Inicial
        for i=2:length(tn)
            solucion_aproximada(i)=solucion_aproximada(i-1) + h*(solucion_aproximada(i-1)-tn(i-1)^2 +1);
        end
        for i=1:length(tn)
        errores(j,i)=abs(solucion_exacta(i)-solucion_aproximada(i))/solucion_exacta(i);
        end
        figure(1);
        plot(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        scatter(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
        
        figure(1);
        title('Euler Explicito');
        xlabel('t');
        axis([a b 0 3]);
        legend('Solucion Exacta','h=0.5','3 puntos','h=0.2','6 puntos','h=0.1','11 puntos'); 
        lgd = legend;
        lgd.FontSize = 14;
        
clear all;
clc;

% Definimos variables simbolicas
syms t;
yx=(t+1)^2-0.5*exp(t);

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.2; % Paso
y0=0.5; % Condicion Inicial
        
        % Euler Implicito
        j=1;
        % Experimento 1: h=0.5
        h=0.5; 
        tn=a:h:b;
        for i=1:length(tn)
            solucion_exacta(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada(1)=y0; % Condicion Inicial
        for i=2:length(tn)
           solucion_aproximada(i)=(solucion_aproximada(i-1) + h*(-tn(i)^2 +1))/(1-h);
        end
        for i=1:length(tn)
        errores(j,i)=abs(solucion_exacta(i)-solucion_aproximada(i))/solucion_exacta(i);
        end
        figure(2);
        plot(tn,solucion_exacta,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        grid on;
        hold on;
        plot(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2);
        scatter(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
        
        % Experimento 2: h=0.2
        j=2;
        h=0.2; 
        tn=a:h:b;
        for i=1:length(tn)
            solucion_exacta(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada(1)=y0; % Condicion Inicial
        solucion_aproximada(1)=y0; % Condicion Inicial
        for i=2:length(tn)
           solucion_aproximada(i)=(solucion_aproximada(i-1) + h*(-tn(i)^2 +1))/(1-h);
        end
        for i=1:length(tn)
        errores(j,i)=abs(solucion_exacta(i)-solucion_aproximada(i))/solucion_exacta(i);
        end
        figure(2);
        plot(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        scatter(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
    
    
        % Experimento 3: h=0.1
        j=3;
        h=0.1; 
        tn=a:h:b;
        for i=1:length(tn)
            solucion_exacta(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada(1)=y0; % Condicion Inicial
        solucion_aproximada(1)=y0; % Condicion Inicial
        for i=2:length(tn)
           solucion_aproximada(i)=(solucion_aproximada(i-1) + h*(-tn(i)^2 +1))/(1-h);
        end
        for i=1:length(tn)
        errores(j,i)=abs(solucion_exacta(i)-solucion_aproximada(i))/solucion_exacta(i);
        end
        figure(2);
        plot(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        scatter(tn,solucion_aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
        
        figure(2);
        title('Euler Implicito');
        xlabel('t');
        axis([a b 0 3]);
        legend('Solucion Exacta','h=0.5','3 puntos','h=0.2','6 puntos','h=0.1','11 puntos'); 
        lgd = legend;
        lgd.FontSize = 14;

                   
          
%% PROBLEMA_3: Resolver PVI orden 2 con Metodo de Euler Explicito

%  Datos: 
%           |--> EDO:                    10u"+ 50|u'|u' + 200u = 0 
%   (PVI) = |--> Intervalo:              (0,1)
%           |--> Condicion Inicial 1:    u(0)=0   
%           |--> Condicion Inicial 2:    u'(0)=1            

%            --> Paso discretizacion:    h=0.05
%----------------------------------------------------------------------------------
close all;
clear all;
clc;

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.05; % Paso
y0=0; % Condicion Inicial 1: posicion inicial
y1=1; % Condicion Inicial 2: velocidad inicial
M=10; % Masa
B=50; % Constante del Amortiguador
k=200; % Constante Elastica del muelle

%       --> Discretizamos el intervalo (0,1)
            tn=a:h:b;
                               
% Apartado a): Metodo de Euler Explicito Vectorial
            
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(1);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            scatter(tn,u,'MarkerEdgeColor',[0.3 0.3 0.3],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
            grid on;
            hold on;
            title('u(t): Posicion de la masa M');
            xlabel('t');
            axis([a b -0.4 0.3]);
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(2);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            scatter(tn,v,'MarkerEdgeColor',[0.3 0.3 0.3],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
            grid on;
            hold on;
            title('v: Velocidad de la masa M');
            xlabel('t');
            axis([a b -1.5 1]);


% Apartado b) Estudiamos la Convergencia: variamos el Paso de discretizacion
%             hacia valores mas pequenhos (con graficas de: la Aproximacion
%             obtenida a traves del Metodo de Euler Explicito y el Error
%             cometido)
            paso=h;
            figure(3);
            j=1;
            while j<8
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos Aproximacion
                u(1)=y0;
                v(1)=y1;
                for i=2:length(tn)
                    u(i)= u(i-1) + h*v(i-1);
                    v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
                end
                figure(3);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                figure(4);
                grid on;
                hold on;
                % Dibujamos Aproximacion v(t)
                plot(tn,u,'MarkerEdgeColor',[0.3 0.3 0.3],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(3);
            title('Estudio Convergencia u(t): posicion de la masa M');
            xlabel('t');
            axis([a b -4 4]);
            legend('h=0.05','h=0.0225','h=0.0125','h=0.00625','h=0.003125','h=0.0015625','h=0.00078125'); 
            lgd = legend;
            lgd.FontSize = 14;
            figure(4);
            title('Estudio Convergencia v(t): velocidad de la masa M');
            xlabel('t');
            axis([a b -4 4]);
            legend('h=0.05','h=0.0225','h=0.0125','h=0.00625','h=0.003125','h=0.0015625','h=0.00078125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            
         

% Apartado c) Hacemos estudio del resultado de la Solucion Aproximada para 
%             variaciones de los Parametros Fisicos.
%               
clear all;
% Experimento 1: Modificamos Extremo superior del Intervalo b=0.1

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.05; % Paso
y0=0; % Condicion Inicial 1: posicion inicial
y1=1; % Condicion Inicial 2: velocidad inicial
M=10; % Masa
B=50; % Constante del Amortiguador
k=200; % Constante Elastica del muelle

            b=0.1;
%       --> Discretizamos el intervalo (0,1)
            tn=a:h:b;
                               
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(5);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('u(t): Posicion de la masa M');
            xlabel('t');
            axis([a b -0.4 0.3]);
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(6);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('v: Velocidad de la masa M');
            xlabel('t');
            axis([a b -1.5 1]); 
           
            

% Experimento 2: Modificamos Extremo superior del Intervalo b=100
            b=100;
%       --> Discretizamos el intervalo (0,1)
            tn=a:h:b;
                               
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(7);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('u(t): Posicion de la masa M');
            xlabel('t');
            axis([a b -0.06 0.15]);
            
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(8);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('v: Velocidad de la masa M');
            xlabel('t');
            axis([a b -0.5 1]);
            
            
            
% A partir de aqui, todos los Experimentos tendran el mismo valor del
% intervalo I=(a,b), por lo que pondremos todas las gr?ficas en una misma
% Figura.
clear all;

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.05; % Paso
y0=0; % Condicion Inicial 1: posicion inicial
y1=1; % Condicion Inicial 2: velocidad inicial
M=10; % Masa
B=50; % Constante del Amortiguador
k=200; % Constante Elastica del muelle
            
%       --> Discretizamos el intervalo (0,1)
            tn=a:h:b;
% Experimento 3: Modificamos Posicion Inicial de la masa M y0 = -0.1;
            y0=-0.1;
         
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('u(t): Posicion de la masa M');
            xlabel('t');
            axis([a b -0.5 0.5]);
            
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('v: Velocidad de la masa M');
            xlabel('t');
            axis([a b -1.75 1.5]);
            
            
 % Experimento 4: Modificamos Posicion Inicial de la masa M y0 = 0.1;
            y0=0.1;

                               
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
           
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
           
                   
 % Experimento 5: Modificamos Velocidad Inicial de la masa M y1 = 0;
            y0=0;
            y1=0;

                               
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
                   
 % Experimento 6: Modificamos la masa M6=9;

            y1=1;
            M=9;

                               
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
 
 % Experimento 7: Modificamos la masa M6=11;

            M=11;

                               
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
                                                          
% Experimento 8: Modificamos la Constante del Amortiguador B8=45;

            M=10;
            B=45;

                               
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
% Experimento 9: Modificamos la Constante del Amortiguador B9=55;

            B=55;

                               
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;          

% Experimento 10: Modificamos la Constante del Muelle k10=180;
            B=50;
            k=180;

                               
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;  
            
% Experimento 11: Modificamos la Constante del Muelle k10=220;

            k=220;

                               
%       --> Metodo de Euler Explicito Vectorial
            u(1)=y0;
            v(1)=y1;
            for i=2:length(tn)
                u(i)= u(i-1) + h*v(i-1);
                v(i)= v(i-1) + h*((-k*u(i-1)-b*abs(v(i-1))*v(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;  
            
            figure(9);
            legend('Experimento 3: u(0)=-0.1','Experimento 4: u(0)=0.1','Experimento 5: v(0)=0','Experimento 6: M=9','Experimento 7: M=11','Experimento 8: B=45','Experimento 9: B=55','Experimento 10: k=180','Experimento 11: k=220'); 
            lgd = legend;
            lgd.FontSize = 14;
            figure(10);
            legend('Experimento 3: u(0)=-0.1','Experimento 4: u(0)=0.1','Experimento 5: v(0)=0','Experimento 6: M=9','Experimento 7: M=11','Experimento 8: B=45','Experimento 9: B=55','Experimento 10: k=180','Experimento 11: k=220'); 
            lgd = legend;
            lgd.FontSize = 14;
                    

                   
   
   
   
   


%% PROBLEMA_2: Resolver PVI orden 1 mediante Metodo Runge-Kutta orden 2, 3 y 4

%  Datos: 
%           |--> EDO:                    y'=-2*t^3+12*t^2-20*t+8.5
%   (PVI) = |--> Intervalo:              (0,1)
%           |--> Condicion Inicial:      y(0)=1            

%            --> Paso discretizacion:    h=0.5
%            --> Solucion Exacta:        y(t)=-0.5*t^4+4*t^3-10*t^2+8.5*t+1

%----------------------------------------------------------------------------------
%% Apartado a): Metodos Runge-Kutta Orden 2 (tres versiones clasicas: Hunen, Punto Medio y Ralston)
close all;
clear all;
clc;

% Definimos variables simbolicas
syms t;
yx=-0.5*t^4+4*t^3-10*t^2+8.5*t+1

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.5; % Paso
y0=1; % Condicion Inicial


%VERSION CLASICA 1: Henun
%       --> Resolvemos el problema

%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           - Columna 1: Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           - Columna 2: Valores exactos de la Solucion
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
                end
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo de RK2 Hunen
                solucion_aproximada_RK2_v1(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_RK2_v1(i)=;
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error(i)=abs(solucion_exacta(i)-solucion_aproximada_RK2_v1(i))/solucion_exacta(i);
                end



%       --> Representamos Graficamente: la Aproximacion obtenido mediante 
%            el Metodo de RK2 Hunen y la Solucion Exacta

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
               title('Solucion Exacta VS Solucion Aproximada RK2 version Henun');
               xlabel('t');
               axis([a b 0 3]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_RK2_v1,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_RK2_v1,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada RK2 version Henun'); 
               lgd = legend;
               lgd.FontSize = 14;

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas pequenhos (con graficas de: la Aproximacion
%           obtenida a traves de el Metodo de RK2 Hunen y el Error
%           cometido)
            paso=h;
            figure(2);
            j=1;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso_RK2_v1(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_RK2_v1(j,i)=;%Cuidado con el pado aqui es 'paso' y no 'h'
                end
                figure(2);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso_RK2_v1(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_RK2_v1(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia RK2 version Henun');
            xlabel('t');
            axis([a b 0 3]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo RK2 version Henun');
            xlabel('t');
            axis([a b 0 0.1]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
%VERSION CLASICA 2: Punto Medio
%       --> Resolvemos el problema

%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           - Columna 1: Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           - Columna 2: Valores exactos de la Solucion
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
                end
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo de RK2 Punto Medio
                solucion_aproximada_RK2_v2(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_RK2_v2(i)=;
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error(i)=abs(solucion_exacta(i)-solucion_aproximada_RK2_v2(i))/solucion_exacta(i);
                end



%       --> Representamos Graficamente: la Aproximacion obtenido mediante 
%           el Metodo de RK2 Punto Medio

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
               title('Solucion Exacta VS Solucion Aproximada RK2 version Punto Medio');
               xlabel('t');
               axis([a b 0 3]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_RK2_v2,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_RK2_v2,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada RK2 version Punto Medio'); 
               lgd = legend;
               lgd.FontSize = 14;

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas pequenhos (con graficas de: la Aproximacion
%           obtenida a traves de el Metodo de RK2 Punto Medio y el Error
%           cometido)
            paso=h;
            figure(2);
            j=1;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso_RK2_v2(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_RK2_v2(j,i)=;%Cuidado con el pado aqui es 'paso' y no 'h'
                end
                figure(2);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso_RK2_v2(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_RK2_v2(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia RK2 version Punto Medio');
            xlabel('t');
            axis([a b 0 3]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo RK2 version Punto Medio');
            xlabel('t');
            axis([a b 0 0.1]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
%VERSION CLASICA 3: Ralston
%       --> Resolvemos el problema

%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           - Columna 1: Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           - Columna 2: Valores exactos de la Solucion
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
                end
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo de RK2 Ralston
                solucion_aproximada_RK2_v3(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_RK2_v3(i)=;
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error(i)=abs(solucion_exacta(i)-solucion_aproximada_RK2_v3(i))/solucion_exacta(i);
                end



%       --> Representamos Graficamente: la Aproximacion obtenido mediante 
%           el Metodo de RK2 Ralston y la Solucion Exacta

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
               title('Solucion Exacta VS Solucion Aproximada RK2 version Ralston');
               xlabel('t');
               axis([a b 0 3]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_RK2_v3,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_RK2_v3,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada RK2 version Ralston'); 
               lgd = legend;
               lgd.FontSize = 14;

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas pequenhos (con graficas de: la Aproximacion
%           obtenida a traves de el Metodo de RK2 Ralston y el Error
%           cometido)
            paso=h;
            figure(2);
            j=1;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso_RK2_v3(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_RK2_v3(j,i)=;%Cuidado con el pado aqui es 'paso' y no 'h'
                end
                figure(2);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso_RK2_v3(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_RK2_v3(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia RK2 version Ralston');
            xlabel('t');
            axis([a b 0 3]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo RK2 version Ralston');
            xlabel('t');
            axis([a b 0 0.1]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;

%% Apartado b): Metodo Runge-Kutta Orden 3 y 4 version clasica
close all;
clear all;
clc;

% Definimos variables simbolicas
syms t;
yx=-0.5*t^4+4*t^3-10*t^2+8.5*t+1;

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.5; % Paso
y0=1; % Condicion Inicial

%   --> Runge-Kutta Orden 3<--

%       --> Resolvemos el problema

%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           - Columna 1: Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           - Columna 2: Valores exactos de la Solucion
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
                end
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo RK3 version Clasica
                solucion_aproximada_RK3(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_RK3(i)=;
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error(i)=abs(solucion_exacta(i)-solucion_aproximada_RK3(i))/solucion_exacta(i);
                end



%       --> Representamos Graficamente: la Aproximacion obtenido mediante 
%           el Metodo RK3 version Clasica y la Solucion Exacta

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
               title('Solucion Exacta VS Solucion Aproximada RK3 version Clasica');
               xlabel('t');
               axis([a b 0 3]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_RK3,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_RK3,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada RK3 version Clasica'); 
               lgd = legend;
               lgd.FontSize = 14;

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas pequenhos (con graficas de: la Aproximacion
%           obtenida a traves de el Metodo RK3 version Clasica y el Error
%           cometido)
            paso=h;
            figure(2);
            j=1;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso_RK3(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_RK3(j,i)=;%Cuidado con el pado aqui es 'paso' y no 'h'
                end
                figure(2);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso_RK3(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_RK3(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia RK3 version Clasica');
            xlabel('t');
            axis([a b 0 3]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo RK3 version Clasica');
            xlabel('t');
            axis([a b 0 0.1]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
%   --> Runge-Kutta Orden 4 <--
 
%       --> Resolvemos el problema

%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           - Columna 1: Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           - Columna 2: Valores exactos de la Solucion
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
                end
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo RK4 version Clasica
                solucion_aproximada_RK4(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_RK4(i)=;
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error(i)=abs(solucion_exacta(i)-solucion_aproximada_RK4(i))/solucion_exacta(i);
                end



%       --> Representamos Graficamente: la Aproximacion obtenido mediante 
%           el Metodo RK4 version Clasica y la Solucion Exacta

               format long;
               n0=100;
               X0=linspace(a,b,n0);
               F=zeros(1,n0);
               for i=1:n0
                y_exacta(i)=subs(yx,t,X0(i));
               end
               figure(4);
               % Dibujamos Solucion Excata
               plot(X0,y_exacta,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Solucion Exacta VS Solucion Aproximada RK4 version Clasica');
               xlabel('t');
               axis([a b 0 3]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_RK4,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_RK4,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada RK4 version Clasica'); 
               lgd = legend;
               lgd.FontSize = 14;

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas pequenhos (con graficas de: la Aproximacion
%           obtenida a traves de el Metodo RK4 version Clasica y el Error
%           cometido)
            paso=h;
            figure(5);
            j=1;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso_RK4(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_RK4(j,i)=;%Cuidado con el pado aqui es 'paso' y no 'h'
                end
                figure(5);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso_RK4(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_RK4(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(6);
                plot(tn,errores(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(5);
            title('Estudio Convergencia RK4 version Clasica');
            xlabel('t');
            axis([a b 0 3]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(6);
            title('Error relativo RK4 version Clasica');
            xlabel('t');
            axis([a b 0 0.1]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
       
%% Apartado c): Comparar Metodos RK2 Henun, RK2 Punto Medio, RK2 Ralston, RK3 Clasico y RK4 Clasico para diferentes valores del Paso h
%               Obtenemos datos apartados anterirores

%% Apartado d): Resolvemos este Problema por Euler Explicito y Euler implicito y los comparamos con todos los RK's que hemos hecho

close all;
clear all;
clc;

% Definimos variables simbolicas
syms t;
yx=-0.5*t^4+4*t^3-10*t^2+8.5*t+1;

% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.5; % Paso
y0=1; % Condicion Inicial

%   --> Euler Explicito<--

%       --> Resolvemos el problema

%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           - Columna 1: Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           - Columna 2: Valores exactos de la Solucion
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
                end
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo de Euler Explicito
                solucion_aproximada_Euler_Explicito(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_Euler_Explicito(i)=;
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error(i)=abs(solucion_exacta(i)-solucion_aproximada_Euler_Explicito(i))/solucion_exacta(i);
                end



%       --> Representamos Graficamente: la Aproximacion obtenido mediante 
%           el Metodo RK3 version Clasica y la Solucion Exacta

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
               title('Solucion Exacta VS Solucion Aproximada Euler Explicito');
               xlabel('t');
               axis([a b 0 3]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_RK3,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_RK3,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada Euler Explicito'); 
               lgd = legend;
               lgd.FontSize = 14;

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas pequenhos (con graficas de: la Aproximacion
%           obtenida a traves de el Metodo Euler Explicito y el Error
%           cometido)
            paso=h;
            figure(2);
            j=1;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso_Euler_explicito(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_Euler_explicito(j,i)=;%Cuidado con el pado aqui es 'paso' y no 'h'
                end
                figure(2);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso_Euler_explicito(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_Euler_explicito(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia Euler Explicito');
            xlabel('t');
            axis([a b 0 3]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo Euler Explicito');
            xlabel('t');
            axis([a b 0 0.1]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
%   --> Euler Implicito <--
 
%       --> Resolvemos el problema

%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           - Columna 1: Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           - Columna 2: Valores exactos de la Solucion
                for i=1:length(tn)
                    solucion_exacta(i)=subs(yx,t,tn(i));
                end
%           - Columna 3: Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo Euler Implicito
                solucion_aproximada_Euler_implicito(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_Euler_implicito(i)=;
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error(i)=abs(solucion_exacta(i)-solucion_aproximada_Euler_implicito(i))/solucion_exacta(i);
                end



%       --> Representamos Graficamente: la Aproximacion obtenido mediante 
%           el Metodo Euler Implicito y la Solucion Exacta

               format long;
               n0=100;
               X0=linspace(a,b,n0);
               F=zeros(1,n0);
               for i=1:n0
                y_exacta(i)=subs(yx,t,X0(i));
               end
               figure(4);
               % Dibujamos Solucion Excata
               plot(X0,y_exacta,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Solucion Exacta VS Solucion Aproximada Euler Implicito');
               xlabel('t');
               axis([a b 0 3]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_RK4,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_RK4,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada Euler Implicito'); 
               lgd = legend;
               lgd.FontSize = 14;

%       --> Estudiamos la Convergencia: variamos el Paso de discretizacion
%           hacia valores mas pequenhos (con graficas de: la Aproximacion
%           obtenida a traves de el Metodo Euler Implicito y el Error
%           cometido)
            paso=h;
            figure(5);
            j=1;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso_Euler_implicito(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_Euler_implicito(j,i)=;%Cuidado con el pado aqui es 'paso' y no 'h'
                end
                figure(5);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso_Euler_implicito(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_Euler_implicito(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(6);
                plot(tn,errores(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(5);
            title('Estudio Convergencia Euler Implicito');
            xlabel('t');
            axis([a b 0 3]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(6);
            title('Error relativo Euler Implicito');
            xlabel('t');
            axis([a b 0 0.1]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
%% PROBLEMA_2Bis: Resolver PVI orden 1 con EDO Lineal Orden 1 no Homogenea con Coeficientes Constantes mediante Metodo Runge-Kutta orden 3 y 4 (Metodo de Familia RK3 clasico y Metodo de Familia RK4 clasico)

%  Datos: 
%           |--> EDO:                    y'=y-*t^2+1
%   (PVI) = |--> Intervalo:              (0,1)
%           |--> Condicion Inicial:      y(0)=1/2            

%            --> Paso discretizacion:    h=0.5
%            --> Solucion Exacta:        y(t)=-0.5*t^4+4*t^3-10*t^2+8.5*t+1

%----------------------------------------------------------------------------------
%% Metodos Runge-Kutta Orden 3 (version clasica)
close all;
clear all;
clc;


% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.5; % Paso
y0=1/2; % Condicion Inicial

%   --> Runge-Kutta Orden 3<-- Metodo clasico RK3 de Familia de Metodos RK3
            
%       --> Resolvemos el problema
            j=1;
            while(j<6)
                if(j==1)
                    h=0.5;
                elseif(j==2)
                    h=0.2;
                elseif(j==3)
                    h=0.1;
                elseif(j==4)
                    h=0.05;
                elseif(j==5)
                    h=0.01;
                end
                    
%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           -  Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           
%           -  Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo RK3 version Clasica
                solucion_aproximada_RK3(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_RK3(j,i)=;
                end

%       --> Representamos Graficamente: la Aproximacion obtenido mediante
%           el Metodo RK3 version Clasica

               format long;
               n0=100;
               X0=linspace(a,b,n0);
               F=zeros(1,n0);
               for i=1:n0
                y_exacta(i)=subs(yx,t,X0(i));
               end
               figure(1);
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_RK3(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               grid on;
               hold on;
               scatter(tn,solucion_aproximada_RK3(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               grid on;
               hold on;
               j=j+1;
            end
            figure(1);
            title('RK3 clasico');
            xlabel('t');
            axis([a b 0 3]);
            legend('h=0.5','h=0.2','h=0.1','h=0.05','h=0.01'); 
            lgd = legend;
             lgd.FontSize = 14;

%% Metodos Runge-Kutta Orden 4 (version clasica)
close all;
clear all;
clc;


% Definimos varibales Problema
a=0; % Extremo Inferior Intervalo
b=1; % Extremo Superior Intervalo
h=0.5; % Paso
y0=1/2; % Condicion Inicial

%   --> Runge-Kutta Orden 4<--Metodo clasico RK4 (El mas popular) de Familia de Metodos RK4
            
%       --> Resolvemos el problema
            j=1;
            while(j<6)
                if(j==1)
                    h=0.5;
                elseif(j==2)
                    h=0.2;
                elseif(j==3)
                    h=0.1;
                elseif(j==4)
                    h=0.05;
                elseif(j==5)
                    h=0.01;
                end
                    
%       --> Recopilamos datos para elaborar la Tabla de datos con las siguientes columnas
%           -  Discretizamos el intervalo (0,1)
                tn=a:h:b;
%           
%           -  Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo RK4 version Clasica
                solucion_aproximada_RK4(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_RK4(j,i)=;
                end




%       --> Representamos Graficamente: la Aproximacion obtenido mediante
%           el Metodo RK4 version Clasica

               format long;
               n0=100;
               X0=linspace(a,b,n0);
               F=zeros(1,n0);
               for i=1:n0
                y_exacta(i)=subs(yx,t,X0(i));
               end
               figure(1);
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_RK4(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               grid on;
               hold on;
               scatter(tn,solucion_aproximada_RK4(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               grid on;
               hold on;
               j=j+1;
            end
            figure(1);
            title('RK4 clasico');
            xlabel('t');
            axis([a b 0 3]);
            legend('h=0.5','h=0.2','h=0.1','h=0.05','h=0.01'); 
            lgd = legend;
            lgd.FontSize = 14;



