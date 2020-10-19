%% PRACTICA 1
%  AUTOR: IVAN MARTIN GOMEZ

%% PRACTICA 1.1: Polinomios en Base de Lagrange (PPBL) y Polinomio Interpolador de Lagrange (PIL)
%
%  Uso: Ejecute desde la Ventana de Comandos el siguiente mandato: Script1.m 
%        
%       --> Especificamos el intervalo cerrado [a,b].
%               
                a=0;
                b=pi/2;
                
%       --> Especificamos Funcion f(x)= cos(x) que queremos 
%           Aproximar mediante el Polinomio
%           Interpolador de Lagrange
                syms x;
                
                f = cos(x);

%       CASO 0) Dibujamos la funcion f(x)= cos(x) en un numero
%               suficientemente grande de puntos del Intervalo Cerrado [0,pi/2] para
%               utilizarlo como modelo de la funcion real en dicho
%               intervalo.
               
               format long;
               n=1000;
               X0=linspace(a,b,n);
               F=zeros(1,n);
               for i=1:n
                F(i)=subs(f,x,X0(i));
               end
               figure(1);
               subplot(1,2,1);
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Funcion y Polinomio Interpolador Lagrange');
               xlabel('x');
               axis([a b -1 2.5]);
               grid on;
               hold on;
         
% %       CASO 1) Cuatro puntos ==> n = 4 [0,pi/6,pi/3,pi/2]
% %
                  n=4;
                  rutina1; 
%                %Calculo el Error cometido |f(x)-I(x)|
%                 
%                 
%                %Dibujo Polinomio Interpolador de Lagrange
                    
                    plot(X,I,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2, 'Marker','*','MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',21);               
                    legend('f(x) = cos(x)','Aproximacion n=4'); 
                    lgd = legend;
                    lgd.FontSize = 18;
                    
                 %Dibujo Error: E(x)=1/!n * g(x) * h(x)
                   
                   n=1000;
                   X0=linspace(a,b,n);
                   E=zeros(1,n);
                   C=zeros(1,n);
                   for i=1:n
                        E(i)=abs(subs(e,x,X0(i)));
                        C(i)=double(cota);
                   end
                   
                   subplot(1,2,2);
                   plot(X0,E,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2);
                   title('Error y Cota de Error');
                   xlabel('x');
                   axis([a b 0 0.004]);
                   grid on;
                   hold on;
                   
                   plot(X0,C,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);               
                   legend('E(x)','Cota de Error'); 
                   lgd = legend;
                   lgd.FontSize = 18;
                   
   



