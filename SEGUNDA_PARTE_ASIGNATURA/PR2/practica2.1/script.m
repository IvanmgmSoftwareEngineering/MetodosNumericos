%% PRACTICA2.1(version 01 y 02): METODOS DE 1 PASO (EULER, RUNGE-KUTTA)

%  AUTOR: IVAN MARTIN GOMEZ

%  DESCRIPCION: Resolucion de Problema de Valor Inicial(PVI) de Orden 1 haciendo uso de los Metodo 
%               de Euler Explicito y Euler Implicito. Resolucion de Problema de Valor Inicial(PVI) 
%               de Orden 2 haciendo uso del Metodo de Euler Explicito. Resolucion de Problemas de Valor 
%               Inicial(PVI) de Orden 1 haciendo uso de los Metodos de Runge-Kutta de Orden 2, 3 y 4



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
                solucion_aproximada_Euler_Explicito(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_Euler_Explicito(i)=solucion_aproximada_Euler_Explicito(i-1) + h*(solucion_aproximada_Euler_Explicito(i-1)-tn(i-1)^2 +1);
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error_Euler_Explicito(i)=abs(solucion_exacta(i)-solucion_aproximada_Euler_Explicito(i))/solucion_exacta(i);
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
               plot(tn,solucion_aproximada_Euler_Explicito,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_Euler_Explicito,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
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
                soluciones_aproximada_Euler_Explicito_variamos_paso(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_Euler_Explicito_variamos_paso(j,i)=soluciones_aproximada_Euler_Explicito_variamos_paso(j,i-1) + paso*(soluciones_aproximada_Euler_Explicito_variamos_paso(j,i-1)-tn(i-1)^2 +1);
                end
                figure(2);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_Euler_Explicito_variamos_paso(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores_Euler_Explicito(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_Euler_Explicito_variamos_paso(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores_Euler_Explicito(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
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

clear a b F h i j lgd n0 paso t tn X0 y0 y_exacta yx

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
                solucion_aproximada_Euler_Implicito(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_Euler_Implicito(i)=(solucion_aproximada_Euler_Implicito(i-1) + h*(-tn(i)^2 +1))/(1-h);
                end
%           - Columna 4: Error realmente cometido relativo
                for i=1:length(tn)
                error_Euler_Implicito(i)=abs(solucion_exacta(i)-solucion_aproximada_Euler_Implicito(i))/solucion_exacta(i);
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
               plot(tn,solucion_aproximada_Euler_Implicito,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_Euler_Implicito,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
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
                soluciones_aproximada_Euler_implicito_variamos_paso(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_Euler_implicito_variamos_paso(j,i)=(soluciones_aproximada_Euler_implicito_variamos_paso(j,i-1) + paso*(-tn(i)^2 +1))/(1-paso);
                end
                figure(2);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_Euler_implicito_variamos_paso(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores_Euler_Implicito(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_Euler_implicito_variamos_paso(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores_Euler_Implicito(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
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
            
clear a b F h i j lgd n0 paso t tn X0 y0 y_exacta yx

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
            solucion_exacta_Experimento1(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada_Explicito_Experimento1(1)=y0; % Condicion Inicial
        for i=2:length(tn)
            solucion_aproximada_Explicito_Experimento1(i)=solucion_aproximada_Explicito_Experimento1(i-1) + h*(solucion_aproximada_Explicito_Experimento1(i-1)-tn(i-1)^2 +1);
        end
        for i=1:length(tn)
        errores_Explicito(j,i)=abs(solucion_exacta_Experimento1(i)-solucion_aproximada_Explicito_Experimento1(i))/solucion_exacta_Experimento1(i);
        end
        figure(1);
        plot(tn,solucion_exacta_Experimento1,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        grid on;
        hold on;
        plot(tn,solucion_aproximada_Explicito_Experimento1,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2);
        scatter(tn,solucion_aproximada_Explicito_Experimento1,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
        
        % Experimento 2: h=0.2
        j=2;
        h=0.2; 
        tn=a:h:b;
        for i=1:length(tn)
            solucion_exacta_Experimento2(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada_Explicito_Experimento2(1)=y0; % Condicion Inicial
        for i=2:length(tn)
            solucion_aproximada_Explicito_Experimento2(i)=solucion_aproximada_Explicito_Experimento2(i-1) + h*(solucion_aproximada_Explicito_Experimento2(i-1)-tn(i-1)^2 +1);
        end
        for i=1:length(tn)
        errores_Explicito(j,i)=abs(solucion_exacta_Experimento2(i)-solucion_aproximada_Explicito_Experimento2(i))/solucion_exacta_Experimento2(i);
        end
        figure(1);
        plot(tn,solucion_exacta_Experimento2,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        grid on;
        hold on;
        figure(1);
        plot(tn,solucion_aproximada_Explicito_Experimento2,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        scatter(tn,solucion_aproximada_Explicito_Experimento2,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
       
    
    
        % Experimento 3: h=0.1
        j=3;
        h=0.1; 
        tn=a:h:b;
        for i=1:length(tn)
            solucion_exacta_Experimento3(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada_Explicito_Experimento3(1)=y0; % Condicion Inicial
        for i=2:length(tn)
            solucion_aproximada_Explicito_Experimento3(i)=solucion_aproximada_Explicito_Experimento3(i-1) + h*(solucion_aproximada_Explicito_Experimento3(i-1)-tn(i-1)^2 +1);
        end
        for i=1:length(tn)
        errores_Explicito(j,i)=abs(solucion_exacta_Experimento3(i)-solucion_aproximada_Explicito_Experimento3(i))/solucion_exacta_Experimento3(i);
        end
        figure(1);
        plot(tn,solucion_exacta_Experimento3,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        grid on;
        hold on;
        figure(1);
        plot(tn,solucion_aproximada_Explicito_Experimento3,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        scatter(tn,solucion_aproximada_Explicito_Experimento3,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
        
        
        figure(1);
        title('Euler Explicito');
        xlabel('t');
        axis([a b 0 3]);
        legend('Solucion Exacta h=0.5','Solucion Aproximada h=0.5','3 puntos','Solucion Exacta h=0.2','Solucion Aproximada h=0.2','6 puntos','Solucion Exacta h=0.1','Solucion Aproximada h=0.1','11 puntos'); 
        lgd = legend;
        lgd.FontSize = 14;
        



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
        solucion_aproximada_Implicito_Experimento1(1)=y0; % Condicion Inicial
        for i=2:length(tn)
           solucion_aproximada_Implicito_Experimento1(i)=(solucion_aproximada_Implicito_Experimento1(i-1) + h*(-tn(i)^2 +1))/(1-h);
        end
        for i=1:length(tn)
        errores_Implicito(j,i)=abs(solucion_exacta(i)-solucion_aproximada_Implicito_Experimento1(i))/solucion_exacta(i);
        end
        figure(2);
        plot(tn,solucion_exacta,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        grid on;
        hold on;
        plot(tn,solucion_aproximada_Implicito_Experimento1,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2);
        scatter(tn,solucion_aproximada_Implicito_Experimento1,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
        
        % Experimento 2: h=0.2
        j=2;
        h=0.2; 
        tn=a:h:b;
        for i=1:length(tn)
            solucion_exacta(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada_Implicito_Experimento2(1)=y0; % Condicion Inicial
        for i=2:length(tn)
           solucion_aproximada_Implicito_Experimento2(i)=(solucion_aproximada_Implicito_Experimento2(i-1) + h*(-tn(i)^2 +1))/(1-h);
        end
        for i=1:length(tn)
        errores_Implicito(j,i)=abs(solucion_exacta(i)-solucion_aproximada_Implicito_Experimento2(i))/solucion_exacta(i);
        end
        figure(2);
        plot(tn,solucion_exacta,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        grid on;
        hold on;
        figure(2);
        plot(tn,solucion_aproximada_Implicito_Experimento2,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        scatter(tn,solucion_aproximada_Implicito_Experimento2,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
    
    
        % Experimento 3: h=0.1
        j=3;
        h=0.1; 
        tn=a:h:b;
        for i=1:length(tn)
            solucion_exacta(i)=subs(yx,t,tn(i));
        end
        solucion_aproximada_Implicito_Experimento3(1)=y0; % Condicion Inicial
        for i=2:length(tn)
           solucion_aproximada_Implicito_Experimento3(i)=(solucion_aproximada_Implicito_Experimento3(i-1) + h*(-tn(i)^2 +1))/(1-h);
        end
        for i=1:length(tn)
        errores_Implicito(j,i)=abs(solucion_exacta(i)-solucion_aproximada_Implicito_Experimento3(i))/solucion_exacta(i);
        end
        figure(2);
        plot(tn,solucion_exacta,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        grid on;
        hold on;
        figure(2);
        plot(tn,solucion_aproximada_Implicito_Experimento3,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
        scatter(tn,solucion_aproximada_Implicito_Experimento3,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
        grid on;
        hold on;
        
        figure(2);
        title('Euler Implicito');
        xlabel('t');
        axis([a b 0 3]);
        legend('Solucion Exacta h=0.5','Solucion Aproximada h=0.5','3 puntos','Solucion Exacta h=0.2','Solucion Aproximada h=0.2','6 puntos','Solucion Exacta h=0.1','Solucion Aproximada h=0.1','11 puntos'); 
        lgd = legend;
        lgd.FontSize = 14;

%Limpiamos Workspace
clear h i j lgd t tn y0 yx solucion_exacta a b

          
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
            
            solucion_aproximada_posicion=u;
            solucion_aproximada_velocidad=v;




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
                plot(tn,v,'MarkerEdgeColor',[0.3 0.3 0.3],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            
            soluciones_aproximadas_posicion_variacion_paso=u;
            soluciones_aproximadas_velocidad_variacion_paso=v;

            
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
            axis([a b -20 20]);
            legend('h=0.05','h=0.0225','h=0.0125','h=0.00625','h=0.003125','h=0.0015625','h=0.00078125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            
         

% Apartado c) Hacemos estudio del resultado de la Solucion Aproximada para 
%             variaciones de los Parametros Fisicos.
%               

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
            u_1(1)=y0;
            v_1(1)=y1;
            for i=2:length(tn)
                u_1(i)= u_1(i-1) + h*v_1(i-1);
                v_1(i)= v_1(i-1) + h*((-k*u_1(i-1)-b*abs(v_1(i-1))*v_1(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(5);
            plot(tn,u_1,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('u(t): Posicion de la masa M');
            ylabel('u(t)');
            xlabel('t');
            axis([a b -0.4 0.3]);
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(6);
            plot(tn,v_1,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('v: Velocidad de la masa M');
            ylabel('v(t)');
            xlabel('t');
            axis([a b -1.5 1]); 
            figure(5);
            legend('Experimento 1: b=0.1'); 
            lgd = legend;
            lgd.FontSize = 14;
            figure(6);
            legend('Experimento 1: b=0.1');
            lgd = legend;
            lgd.FontSize = 14;
           
            solucion_aproximada_posicion_Experimento1=u_1;
            solucion_aproximada_velocidad_Experimento1=v_1;
            

% Experimento 2: Modificamos Extremo superior del Intervalo b=100
            b=100;
%       --> Discretizamos el intervalo (0,1)
            tn=a:h:b;
                               
%       --> Metodo de Euler Explicito Vectorial
            u_2(1)=y0;
            v_2(1)=y1;
            for i=2:length(tn)
                u_2(i)= u_2(i-1) + h*v_2(i-1);
                v_2(i)= v_2(i-1) + h*((-k*u_2(i-1)-b*abs(v_2(i-1))*v_2(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(7);
            plot(tn,u_2,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('u(t): Posicion de la masa M');
            ylabel('u(t)');
            xlabel('t');
            axis([a b -0.06 0.15]);
            
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(8);
            plot(tn,v_2,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('v: Velocidad de la masa M');
            ylabel('v(t)');
            xlabel('t');
            axis([a b -0.5 1]);
            figure(7);
            legend('Experimento 2: b=100'); 
            lgd = legend;
            lgd.FontSize = 14;
            figure(8);
            legend('Experimento 2: b=100');
            lgd = legend;
            lgd.FontSize = 14;
            
            solucion_aproximada_posicion_Experimento2=u_2;
            solucion_aproximada_velocidad_Experimento2=v_2;
            
            
% A partir de aqui, todos los Experimentos tendran el mismo valor del
% intervalo I=(a,b), por lo que pondremos todas las graficas en una misma
% Figura.


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
            u_3(1)=y0;
            v_3(1)=y1;
            for i=2:length(tn)
                u_3(i)= u_3(i-1) + h*v_3(i-1);
                v_3(i)= v_3(i-1) + h*((-k*u_3(i-1)-b*abs(v_3(i-1))*v_3(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u_3,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('u(t): Posicion de la masa M');
            ylabel('u(t)');
            xlabel('t');
            axis([a b -0.5 0.5]);
            
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v_3,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            title('v: Velocidad de la masa M');
            ylabel('v(t)');
            xlabel('t');
            axis([a b -1.75 1.5]);
            
            solucion_aproximada_posicion_Experimento3=u_3;
            solucion_aproximada_velocidad_Experimento3=v_3;
            
 % Experimento 4: Modificamos Posicion Inicial de la masa M y0 = 0.1;
            y0=0.1;

                               
%       --> Metodo de Euler Explicito Vectorial
            u_4(1)=y0;
            v_4(1)=y1;
            for i=2:length(tn)
                u_4(i)= u_4(i-1) + h*v_4(i-1);
                v_4(i)= v_4(i-1) + h*((-k*u_4(i-1)-b*abs(v_4(i-1))*v_4(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u_4,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
           
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v_4,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
           
            solucion_aproximada_posicion_Experimento4=u_4;
            solucion_aproximada_velocidad_Experimento4=v_4;
            
 % Experimento 5: Modificamos Velocidad Inicial de la masa M y1 = 0;
            y0=0;
            y1=0;

                               
%       --> Metodo de Euler Explicito Vectorial
            u_5(1)=y0;
            v_5(1)=y1;
            for i=2:length(tn)
                u_5(i)= u_5(i-1) + h*v_5(i-1);
                v_5(i)= v_5(i-1) + h*((-k*u_5(i-1)-b*abs(v_5(i-1))*v_5(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u_5,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v_5,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
            solucion_aproximada_posicion_Experimento5=u_5;
            solucion_aproximada_velocidad_Experimento5=v_5;
                   
 % Experimento 6: Modificamos la masa M6=9;

            y1=1;
            M=9;

                               
%       --> Metodo de Euler Explicito Vectorial
            u_6(1)=y0;
            v_6(1)=y1;
            for i=2:length(tn)
                u_6(i)= u_6(i-1) + h*v_6(i-1);
                v_6(i)= v_6(i-1) + h*((-k*u_6(i-1)-b*abs(v_6(i-1))*v_6(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u_6,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v_6,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
            solucion_aproximada_posicion_Experimento6=u_6;
            solucion_aproximada_velocidad_Experimento6=v_6;
 
 % Experimento 7: Modificamos la masa M6=11;

            M=11;

                               
%       --> Metodo de Euler Explicito Vectorial
            u_7(1)=y0;
            v_7(1)=y1;
            for i=2:length(tn)
                u_7(i)= u_7(i-1) + h*v_7(i-1);
                v_7(i)= v_7(i-1) + h*((-k*u_7(i-1)-b*abs(v_7(i-1))*v_7(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u_7,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v_7,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
            solucion_aproximada_posicion_Experimento7=u_7;
            solucion_aproximada_velocidad_Experimento7=v_7;
                                                          
% Experimento 8: Modificamos la Constante del Amortiguador B8=45;

            M=10;
            B=45;

                               
%       --> Metodo de Euler Explicito Vectorial
            u_8(1)=y0;
            v_8(1)=y1;
            for i=2:length(tn)
                u_8(i)= u_8(i-1) + h*v_8(i-1);
                v_8(i)= v_8(i-1) + h*((-k*u_8(i-1)-b*abs(v_8(i-1))*v_8(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u_8,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v_8,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            
            solucion_aproximada_posicion_Experimento8=u_8;
            solucion_aproximada_velocidad_Experimento8=v_8;
            
% Experimento 9: Modificamos la Constante del Amortiguador B9=55;

            B=55;

                               
%       --> Metodo de Euler Explicito Vectorial
            u_9(1)=y0;
            v_9(1)=y1;
            for i=2:length(tn)
                u_9(i)= u_9(i-1) + h*v_9(i-1);
                v_9(i)= v_9(i-1) + h*((-k*u_9(i-1)-b*abs(v_9(i-1))*v_9(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u_9,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v_9,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;  
            
            solucion_aproximada_posicion_Experimento9=u_9;
            solucion_aproximada_velocidad_Experimento9=v_9;

% Experimento 10: Modificamos la Constante del Muelle k10=180;
            B=50;
            k=180;

                               
%       --> Metodo de Euler Explicito Vectorial
            u_10(1)=y0;
            v_10(1)=y1;
            for i=2:length(tn)
                u_10(i)= u_10(i-1) + h*v_10(i-1);
                v_10(i)= v_10(i-1) + h*((-k*u_10(i-1)-b*abs(v_10(i-1))*v_10(i-1))/M);
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u_10,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v_10,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;  
            
            solucion_aproximada_posicion_Experimento10=u_10;
            solucion_aproximada_velocidad_Experimento10=v_10;
            
% Experimento 11: Modificamos la Constante del Muelle k11=220;

            k=220;

                               
%       --> Metodo de Euler Explicito Vectorial
            u_11(1)=y0;
            v_11(1)=y1;
            for i=2:length(tn)
                u_11(i)= u_11(i-1) + h*v_11(i-1);
                v_11(i)= v(i-1) + h*(-k*u_11(i-1)-b*abs(v_11(i-1))*v_11(i-1))/M;
            end

%       --> Representamos Graficamente la Solucion Aproximada u(t)
            figure(9);
            plot(tn,u_11,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
%       --> Representamos Graficamente la Solucion Aproximada del 
%           Cambio de Variable v(t)=u'(t)
            figure(10);
            plot(tn,v_11,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;  
            
            figure(9);
            legend('Experimento 3: u(0)=-0.1','Experimento 4: u(0)=0.1','Experimento 5: v(0)=0','Experimento 6: M=9','Experimento 7: M=11','Experimento 8: B=45','Experimento 9: B=55','Experimento 10: k=180','Experimento 11: k=220'); 
            lgd = legend;
            lgd.FontSize = 9;
            figure(10);
            legend('Experimento 3: u(0)=-0.1','Experimento 4: u(0)=0.1','Experimento 5: v(0)=0','Experimento 6: M=9','Experimento 7: M=11','Experimento 8: B=45','Experimento 9: B=55','Experimento 10: k=180','Experimento 11: k=220'); 
            lgd = legend;
            lgd.FontSize = 9;
            
            solucion_aproximada_posicion_Experimento11=u_11;
            solucion_aproximada_velocidad_Experimento11=v_11;
                    

%Limpiamos workspace
clear a b B h i j k paso lgd M tn y0 y1 u v u_1 v_1 u_2 v_2 u_3 v_3 u_4 v_4 u_5 v_5 u_6 v_6 u_7 v_7 u_8 v_8 u_9 v_9 u_10 v_10 u_11 v_11                
   
   
   
   


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
yx=-0.5*t^4+4*t^3-10*t^2+8.5*t+1;
f= -2*t^3+12*t^2-20*t+8.5;

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
                fty(1)=subs(f,t,tn(1));
                for i=2:length(tn)
                    fty(i)=subs(f,t,tn(i));% Lo ponemos aqui porque se utiliza para la iteracion acutal
                    solucion_aproximada_RK2_v1(i)=solucion_aproximada_RK2_v1(i-1)+(h/2)*(fty(i-1)+fty(i));  
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
               axis([a b 1 3.7]);
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
                fty(1)=subs(f,t,tn(1));
                for i=2:length(tn)
                    fty(i)=subs(f,t,tn(i));
                    soluciones_aproximada_variamos_paso_RK2_v1(j,i)=soluciones_aproximada_variamos_paso_RK2_v1(j,i-1)+(paso/2)*(fty(i-1)+fty(i));  
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
                    errores_v1(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_RK2_v1(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores_v1(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia RK2 version Henun');
            xlabel('t');
            axis([a b 1 3.7]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo RK2 version Henun');
            xlabel('t');
            axis([a b 0 0.15]);
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
                fty(1)=subs(f,t,tn(1)+h/2);
                for i=2:length(tn)
                    solucion_aproximada_RK2_v2(i)=solucion_aproximada_RK2_v2(i-1)+h*fty(i-1); 
                    fty(i)=subs(f,t,tn(i)+h/2); % Lo ponemos aqui porque se utiliza para la siguiente iteracion
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
               figure(4);
               % Dibujamos Solucion Excata
               plot(X0,y_exacta,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Solucion Exacta VS Solucion Aproximada RK2 version Punto Medio');
               xlabel('t');
               axis([a b 1 3.7]);
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
            figure(5);
            j=1;
            clear tn;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso_RK2_v2(j,1)=y0; % Condicion Inicial
                fty(1)=subs(f,t,tn(1)+paso/2);
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_RK2_v2(j,i)=soluciones_aproximada_variamos_paso_RK2_v2(j,i-1)+paso*fty(i-1); 
                    fty(i)=subs(f,t,tn(i)+paso/2); % Lo ponemos aqui porque se utiliza para la siguiente iteracion
                end
                
                figure(5);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso_RK2_v2(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores_v2(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_RK2_v2(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(6);
                plot(tn,errores_v2(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(5);
            title('Estudio Convergencia RK2 version Punto Medio');
            xlabel('t');
            axis([a b 0 3.7]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(6);
            title('Error relativo RK2 version Punto Medio');
            xlabel('t');
            axis([a b 0 0.15]);
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
                fty(1)=subs(f,t,tn(1));
                fty2(1)=subs(f,t,tn(1)+3*h/4);
                for i=2:length(tn)
                    solucion_aproximada_RK2_v3(i)=solucion_aproximada_RK2_v3(i-1)+h*(fty(i-1)/3 +2*fty(i-1)/3); 
                    fty(i)=subs(f,t,tn(i)); % Lo ponemos aqui porque se utiliza para la siguiente iteracion
                    fty2(i)=subs(f,t,tn(i)+3*h/4); % Lo ponemos aqui porque se utiliza para la siguiente iteracion
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
               figure(7);
               % Dibujamos Solucion Excata
               plot(X0,y_exacta,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Solucion Exacta VS Solucion Aproximada RK2 version Ralston');
               xlabel('t');
               axis([a b 0 6]);
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
            figure(8);
            j=1;
            clear tn;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                
                soluciones_aproximada_variamos_paso_RK2_v3(j,1)=y0; % Condicion Inicial
                fty(1)=subs(f,t,tn(1));
                fty2(1)=subs(f,t,tn(1)+3*paso/4);
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_RK2_v3(j,i)=soluciones_aproximada_variamos_paso_RK2_v3(j,i-1)+paso*(fty(i-1)/3 +2*fty(i-1)/3); 
                    fty(i)=subs(f,t,tn(i)); % Lo ponemos aqui porque se utiliza para la siguiente iteracion
                    fty2(i)=subs(f,t,tn(i)+3*paso/4); % Lo ponemos aqui porque se utiliza para la siguiente iteracion
                end
                figure(8);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_variamos_paso_RK2_v3(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores_v3(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_RK2_v3(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(9);
                plot(tn,errores_v3(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(8);
            title('Estudio Convergencia RK2 version Ralston');
            xlabel('t');
            axis([a b 0 6]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(9);
            title('Error relativo RK2 version Ralston');
            xlabel('t');
            axis([a b 0 1]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;

%Limpiamos workspace
clear a b f F fty fty2 h i j lgd n0 paso t tn X0 y0 y_exacta yx

%% Apartado b): Metodo Runge-Kutta Orden 3 y 4 version clasica
close all;
clear all;
clc;

% Definimos variables simbolicas
syms t;
yx=-0.5*t^4+4*t^3-10*t^2+8.5*t+1;
f= -2*t^3+12*t^2-20*t+8.5;

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
                k1_RK3(1)=subs(f,t,tn(1));
                k2_RK3(1)=subs(f,t,tn(1)+h/2);
                k3_RK3(1)=subs(f,t,tn(1)+h);
                for i=2:length(tn)
                    solucion_aproximada_RK3(i)=solucion_aproximada_RK3(i-1)+h*(k1_RK3(i-1)/6+2*k2_RK3(i-1)/3+k3_RK3(i-1)/6);
                    k1_RK3(i)=subs(f,t,tn(i));
                    k2_RK3(i)=subs(f,t,tn(i)+h/2);
                    k3_RK3(i)=subs(f,t,tn(i)+h);
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error_RK3(i)=abs(solucion_exacta(i)-solucion_aproximada_RK3(i))/solucion_exacta(i);
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
               % Dibujamos Solucion Exacta
               plot(X0,y_exacta,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Solucion Exacta VS Solucion Aproximada RK3 version Clasica');
               xlabel('t');
               axis([a b 1 3.6]);
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
            clear tn;
            while j<7
                
                tn=a:paso:b; % Discretizamos
                
                % Obtenemos el valor de la Solucion Exacta
                for i=1:length(tn)
                    soluciones_exactas_variamos_paso(j,i)=subs(yx,t,tn(i));
                end
                % Obtenemos Aproximacion
                soluciones_aproximada_variamos_paso_RK3(j,1)=y0; % Condicion Inicial
                ks1_RK3(j,1)=subs(f,t,tn(1));
                ks2_RK3(j,1)=subs(f,t,tn(1)+paso/2);
                ks3_RK3(j,1)=subs(f,t,tn(1)+paso);
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_RK3(j,i)=soluciones_aproximada_variamos_paso_RK3(j,i-1)+paso*(ks1_RK3(j,i-1)/6+2*ks2_RK3(j,i-1)/3+ks3_RK3(j,i-1)/6);
                    ks1_RK3(j,i)=subs(f,t,tn(i)); % Lo ponemos aqui porque este valor se utiliza en la siguiente iteracion
                    ks2_RK3(j,i)=subs(f,t,tn(i)+paso/2); % Lo ponemos aqui porque este valor se utiliza en la siguiente iteracion
                    ks3_RK3(j,i)=subs(f,t,tn(i)+paso); % Lo ponemos aqui porque este valor se utiliza en la siguiente iteracion
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
                    errores_RK3(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_RK3(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores_RK3(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia RK3 version Clasica');
            xlabel('t');
            axis([a b 1 3.5]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125','Aproximacion h=0.015625'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo RK3 version Clasica');
            xlabel('t');
            axis([a b 0 0.0001]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125','Aproximacion h=0.015625'); 
            lgd = legend;
            lgd.FontSize = 14;
            
%   --> Runge-Kutta Orden 4 (RK4 Clasico)<--
 
%       --> Resolvemos el problema
            clear tn;
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
                k1_RK4(1)=subs(f,t,tn(1));
                k2_RK4(1)=subs(f,t,tn(1)+h/2);
                k3_RK4(1)=subs(f,t,tn(1)+h/2);
                k4_RK4(1)=subs(f,t,tn(1)+h);
                for i=2:length(tn)
                    solucion_aproximada_RK4(i)=solucion_aproximada_RK4(i-1)+h*(k1_RK4(i-1)/6+2*k2_RK4(i-1)/6+2*k3_RK4(i-1)/6+k4_RK4(i-1)/6);
                    k1_RK4(i)=subs(f,t,tn(i));
                    k2_RK4(i)=subs(f,t,tn(i)+h/2);
                    k3_RK4(i)=subs(f,t,tn(i)+h);
                    k4_RK4(i)=subs(f,t,tn(i)+h);
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                    error_RK4(i)=abs(solucion_exacta(i)-solucion_aproximada_RK4(i))/solucion_exacta(i);
                end



%       --> Representamos Graficamente: la Aproximacion obtenido mediante 
%           el Metodo RK4 version Clasica y la Solucion Exacta
               clear y_exacta;
               format long;
               n0=100;
               X0=linspace(a,b,n0);
               F=zeros(1,n0);
               for i=1:n0
                y_exacta(i)=subs(yx,t,X0(i));
               end
               figure(4);
               % Dibujamos Solucion Exacta
               plot(X0,y_exacta,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Solucion Exacta VS Solucion Aproximada RK4 version Clasica');
               xlabel('t');
               axis([a b 1 3.5]);
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
                ks1_RK4(j,1)=subs(f,t,tn(1));
                ks2_RK4(j,1)=subs(f,t,tn(1)+paso/2);
                ks3_RK4(j,1)=subs(f,t,tn(1)+paso/2);
                ks4_RK4(j,1)=subs(f,t,tn(1)+paso);
                for i=2:length(tn)
                    soluciones_aproximada_variamos_paso_RK4(j,i)=soluciones_aproximada_variamos_paso_RK4(j,i-1)+paso*(ks1_RK4(j,i-1)/6+2*ks2_RK4(j,i-1)/6+2*ks3_RK4(j,i-1)/6+ks4_RK4(j,i-1)/6);
                    ks1_RK4(j,i)=subs(f,t,tn(i));
                    ks2_RK4(j,i)=subs(f,t,tn(i)+paso/2);
                    ks3_RK4(j,i)=subs(f,t,tn(i)+paso);
                    ks4_RK4(j,i)=subs(f,t,tn(i)+paso);
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
                    errores_RK4(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_RK4(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(6);
                plot(tn,errores_RK4(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(5);
            title('Estudio Convergencia RK4 version Clasica');
            xlabel('t');
            axis([a b 1 3.5]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125','Aproximacion h=0.015625'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(6);
            title('Error relativo RK4 version Clasica');
            xlabel('t');
            axis([a b 0 0.075]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125','Aproximacion h=0.015625'); 
            lgd = legend;
            lgd.FontSize = 14;
                
            
%Limpiamos workspace
clear a b f F h i j lgd n0 paso t tn X0 y0 y_exacta yx
       
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
                    solucion_aproximada_Euler_Explicito(i)=solucion_aproximada_Euler_Explicito(i-1) + h*(-2*tn(i-1)^3+12*tn(i-1)^2-20*tn(i-1)+8.5);
                end
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error_Euler_Explicito(i)=abs(solucion_exacta(i)-solucion_aproximada_Euler_Explicito(i))/solucion_exacta(i);
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
               axis([a b 1 6]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_Euler_Explicito,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_Euler_Explicito,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
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
                    soluciones_aproximada_variamos_paso_Euler_explicito(j,i)=soluciones_aproximada_variamos_paso_Euler_explicito(j,i-1) + paso*(-2*tn(i-1)^3+12*tn(i-1)^2-20*tn(i-1)+8.5);
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
                    errores_Euler_Explicito(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_variamos_paso_Euler_explicito(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(3);
                plot(tn,errores_Euler_Explicito(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(2);
            title('Estudio Convergencia Euler Explicito');
            xlabel('t');
            axis([a b 1 6]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(3);
            title('Error relativo Euler Explicito');
            xlabel('t');
            axis([a b 0 1]);
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
              
                solucion_aproximada_Euler_Implicito(1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    solucion_aproximada_Euler_Implicito(i)=solucion_aproximada_Euler_Implicito(i-1) + h*(-2*tn(i-1)^3+12*tn(i-1)^2-20*tn(i-1)+8.5);
                end
                
%           - Columna 4: Error realmente cometido relativo: diferencia en
%                        valor absoluto del valor extaco de la solucion y del valor de
%                        la aproximacion
                for i=1:length(tn)
                error_Euler_Implicito(i)=abs(solucion_exacta(i)-solucion_aproximada_Euler_Implicito(i))/solucion_exacta(i);
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
               axis([a b 1 6]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(tn,solucion_aproximada_Euler_Implicito,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(tn,solucion_aproximada_Euler_Implicito,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
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
                soluciones_aproximada_Euler_implicito_variamos_paso(j,1)=y0; % Condicion Inicial
                for i=2:length(tn)
                    soluciones_aproximada_Euler_implicito_variamos_paso(j,i)=soluciones_aproximada_Euler_implicito_variamos_paso(j,i-1) + paso*(-2*tn(i-1)^3+12*tn(i-1)^2-20*tn(i-1)+8.5);
                end
                
                figure(5);
                grid on;
                hold on;
                % Dibujamos Aproximacion
                plot(tn,soluciones_aproximada_Euler_implicito_variamos_paso(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                % Obtenemos el Error
                for i=1:length(tn)
                    errores_Euler_Implicito(j,i)=abs(soluciones_exactas_variamos_paso(j,i)-soluciones_aproximada_Euler_implicito_variamos_paso(j,i))/soluciones_exactas_variamos_paso(j,i);
                end
                % Dibujamos el Error
                figure(6);
                plot(tn,errores_Euler_Implicito(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
                
                paso=paso/2; %% Reducimos el paso a la mitad para la siguiente Iteracion
                j=j+1;
            end
            figure(5);
            title('Estudio Convergencia Euler Implicito');
            xlabel('t');
            axis([a b 1 6]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
            figure(6);
            title('Error relativo Euler Implicito');
            xlabel('t');
            axis([a b 0 1]);
            legend('Aproximacion h=0.5','Aproximacion h=0.25','Aproximacion h=0.125','Aproximacion h=0.0625','Aproximacion h=0.03125'); 
            lgd = legend;
            lgd.FontSize = 14;
            
   %Limpiamos Workspace
   clear a b F h i j lgd n0 paso t tn X0 y0 y_exacta yx
%% PROBLEMA_2Bis: Resolver PVI orden 1 con EDO Lineal Orden 1 no Homogenea con Coeficientes Constantes mediante Metodo Runge-Kutta orden 3 y 4 (Metodo de Familia RK3 clasico y Metodo de Familia RK4 clasico)

%  Datos: 
%           |--> EDO:                    y'=y-*t^2+1
%   (PVI) = |--> Intervalo:              (0,1)
%           |--> Condicion Inicial:      y(0)=1/2            

%            --> Paso discretizacion:    h=0.5
%            --> Solucion Exacta:        y(t)=(t+1)^2 - 0.5*e^t

%----------------------------------------------------------------------------------
%% Metodo Runge-Kutta Orden 3 (version clasica)
close all;
clear all;
clc;

%Definimos variables simbolicas
syms t
f=-t^2+1;
yx=(t+1)^2 - 0.5*exp(t);


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
%           - Valores exactos de la Solucion
                for i=1:length(tn)
                    soluciones_exactas(j,i)=subs(yx,t,tn(i));
                end                
%           
%           -  Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo RK3 version Clasica
                soluciones_aproximada_RK3(j,1)=y0; % Condicion Inicial
                ks1_RK3(j,1)=subs(f,t,tn(1));
                ks2_RK3(j,1)=soluciones_aproximada_RK3(j,1)+h*ks1_RK3(j,1)/2-(tn(1)+h/2)^2+1;
                ks3_RK3(j,1)=soluciones_aproximada_RK3(j,1)-h*ks1_RK3(j,1)+2*h*ks2_RK3(j,1)-(tn(1)+h)^2+1;
                for i=2:length(tn)
                    soluciones_aproximada_RK3(j,i)=soluciones_aproximada_RK3(j,i-1)+h*(ks1_RK3(j,i-1)/6+2*ks2_RK3(j,i-1)/3+ks3_RK3(j,i-1)/6);
                    ks1_RK3(j,i)=subs(f,t,tn(i));
                    ks2_RK3(j,i)=soluciones_aproximada_RK3(j,i)+h*ks1_RK3(j,i)/2-(tn(i)+h/2)^2+1;
                    ks3_RK3(j,i)=soluciones_aproximada_RK3(j,i)-h*ks1_RK3(j,i)+2*h*ks2_RK3(j,i)-(tn(i)+h)^2+1;
                end

%       --> Representamos Graficamente: la Aproximacion obtenida mediante
%           el Metodo RK3 version Clasica

               % Dibujamos Soluciones Aproximadas
               figure(1);
               plot(tn,soluciones_aproximada_RK3(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               grid on;
               hold on;
               %scatter(tn,soluciones_aproximada_RK3(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               %grid on;
               %hold on;
               % Obtenemos el Error
                for i=1:length(tn)
                    errores_RK3(j,i)=abs(soluciones_exactas(j,i)-soluciones_aproximada_RK3(j,i))/soluciones_exactas(j,i);
                end
                % Dibujamos el Error
                figure(2);
                plot(tn,errores_RK3(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
               j=j+1;
            end
            format long;
            n0=100;
            X0=linspace(a,b,n0);
            F=zeros(1,n0);
            for i=1:n0
             y_exacta(i)=subs(yx,t,X0(i));
            end
            figure(1);
            % Dibujamos Solucion Exacta
            plot(X0,y_exacta,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            figure(1);
            title('RK3 clasico');
            xlabel('t');
            axis([a b 0.4 3.5]);
            legend('h=0.5','h=0.2','h=0.1','h=0.05','h=0.01','Exacta'); 
            lgd = legend;
            lgd.FontSize = 14;
            figure(2);
            title('Error relativo RK3 version clasica');
            xlabel('t');
            axis([a b 0 0.4]);
            legend('h=0.5','h=0.2','h=0.1','h=0.05','h=0.01'); 
            lgd = legend;
            lgd.FontSize = 14;
%Limpiamos Worspace
clear a b f F h i j lgd n0 t tn X0 y0 y_exacta yx

%% Metodo Runge-Kutta Orden 4 (version clasica)
close all;
clear all;
clc;

%Definimos variables simbolicas
syms t
f=-t^2+1;
yx=(t+1)^2 - 0.5*exp(t);

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
%           - Valores exactos de la Solucion
                for i=1:length(tn)
                    soluciones_exactas(j,i)=subs(yx,t,tn(i));
                end
%           
%           -  Valores Aproximados de la Solucion obtenidos al
%                        aplicar el Metodo RK4 version Clasica
                soluciones_aproximada_RK4(j,1)=y0; % Condicion Inicial
                ks1_RK4(j,1)=subs(f,t,tn(1));
                ks2_RK4(j,1)=soluciones_aproximada_RK4(j,1)+h*ks1_RK4(j,1)/2-(tn(1)+h/2)^2+1;
                ks3_RK4(j,1)=soluciones_aproximada_RK4(j,1)+h*ks2_RK4(j,1)/2-(tn(1)+h/2)^2+1;
                ks4_RK4(j,1)=soluciones_aproximada_RK4(j,1)+h*ks3_RK4(j,1)-(tn(1)+h)^2+1;
                for i=2:length(tn)
                    soluciones_aproximada_RK4(j,i)=soluciones_aproximada_RK4(j,i-1)+h*(ks1_RK4(j,i-1)/6+2*ks2_RK4(j,i-1)/6+2*ks3_RK4(j,i-1)/6+ks4_RK4(j,i-1)/6);
                    ks1_RK4(j,i)=subs(f,t,tn(i));
                    ks2_RK4(j,i)=soluciones_aproximada_RK4(j,i)+h*ks1_RK4(j,i)/2-(tn(i)+h/2)^2+1;
                    ks3_RK4(j,i)=soluciones_aproximada_RK4(j,i)+h*ks2_RK4(j,i)/2-(tn(i)+h/2)^2+1;
                    ks4_RK4(j,i)=soluciones_aproximada_RK4(j,i)+h*ks3_RK4(j,i)-(tn(i)+h)^2+1;
                end




%       --> Representamos Graficamente: la Aproximacion obtenido mediante
%           el Metodo RK4 version Clasica

               
               % Dibujamos Soluciones Aproximadas
               figure(1);
               plot(tn,soluciones_aproximada_RK4(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               grid on;
               hold on;
               %scatter(tn,soluciones_aproximada_RK4(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               %grid on;
               %hold on;
               % Obtenemos el Error
                for i=1:length(tn)
                    errores_RK4(j,i)=abs(soluciones_exactas(j,i)-soluciones_aproximada_RK4(j,i))/soluciones_exactas(j,i);
                end
                % Dibujamos el Error
                figure(2);
                plot(tn,errores_RK4(j,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
                grid on;
                hold on;
               j=j+1;
            end
            format long;
            n0=100;
            X0=linspace(a,b,n0);
            F=zeros(1,n0);
            for i=1:n0
             y_exacta(i)=subs(yx,t,X0(i));
            end
            figure(1);
            % Dibujamos Solucion Exacta
            plot(X0,y_exacta,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
            grid on;
            hold on;
            figure(1);
            title('RK4 clasico');
            xlabel('t');
            axis([a b 0.5 2.75]);
            legend('h=0.5','h=0.2','h=0.1','h=0.05','h=0.01','Exacta'); 
            lgd = legend;
            lgd.FontSize = 14;
            figure(2);
            title('Error relativo RK4 version clasica');
            xlabel('t');
            axis([a b 0 0.15]);
            legend('h=0.5','h=0.2','h=0.1','h=0.05','h=0.01'); 
            lgd = legend;
            lgd.FontSize = 14;
            
%Limpiamos Worspace
clear a b f F h i j lgd n0 t tn X0 y0 y_exacta yx
         



