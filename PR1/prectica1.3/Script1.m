%% Script1: Metodo de la Bisectriz
%  DESCRIPCION: Obtener punto donde una funcion se anula
%  AUTOR: IVAN MARTIN GOMEZ

%% practica1.3:

%  Datos: 
%       --> Funcion que queremos Aproximar:         f(x) =
%       
%       --> Intervalo Cerrado:                      [a,b] = [ , ]
%
%       --> Tolerancia:                             epsilon = 


%----------------------------------------------------------------------------------
close all;
clear all;
clc;

%       --> Especificamos Funcion f(x)= cos(5*x +2)*x^2 que queremos 
%           Aproximar mediante el Polinomio
%           Interpolador de Lagrange
                
                syms x;               
                f = diff(- exp(-x) - (4*sin((4*x)/pi))/pi);
                
%       --> Especificamos el intervalo cerrado [a,b].
%               
                a=0;
                b=2;
                
%       --> Especificamos Tolerancia
%               
                epsilon=0.1;
                
%------------------------------------------------------------------------------------       

            
            X=linspace(a,b,100);
            for i=1:100
                F(i)=subs(f,x,X(i));
            end
            figure(1);
            plot(X,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
            grid on;
            hold on;
            axis([a b -5 5]);
            %scatter([a pi/2 3*pi/2 b],[subs(f,x,a) subs(f,x,pi/2) subs(f,x,3*pi/2) subs(f,x,b)],'MarkerEdgeColor',[0.5 0.5 0.5],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
            grid on;
            hold on;
            
            Zeros = MB(a,b,f,epsilon);

            if(length(Zeros)==0)
                funcion=char(f);
                fprintf('La funcion f(x) = %s no tiene ningun cero en el intervalo [%d,%d]\n',funcion,a,b);
                
            elseif (length(Zeros)==1)
                funcion=char(f);
                fprintf('La funcion f(x) = %s  tiene 1 cero en el intervalo [%d,%d]\n',funcion,a,b);
                fprintf('------ Cero en el punto x = %d\n',Zeros);

            else
                funcion=char(f);
                fprintf('La funcion f(x) = %s  tiene %i ceros en el intervalo [%d,%d]\n',funcion,length(Zeros),a,b);
                for i=1:length(Zeros)
                    fprintf('------ Cero %i en el punto x = %d\n',i,Zeros(i));
                end
                
            end

%                 plot([x1_out x2_out],[0 0],'MarkerEdgeColor',[0.3 0.3 0.3],'LineWidth',2);
%                 grid on;
%                 hold on;
%             
%                 plot([x1_out(1) x2_out(1)],[0 0],'MarkerEdgeColor',[0.3 0.3 0.3],'LineWidth',2);
%                 grid on;
%                 hold on; 
%                 plot([x1_out(2) x2_out(2)],[0 0],'MarkerEdgeColor',[0.3 0.3 0.3],'LineWidth',2);
%                 grid on;
%                 hold on;
            
            
