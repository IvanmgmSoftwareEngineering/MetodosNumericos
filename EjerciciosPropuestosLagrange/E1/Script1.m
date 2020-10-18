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
                
%       --> Especificamos Funcion f(x)= e^(-x) + cos(4x/pi) que queremos 
%           Aproximar mediante el Polinomio
%           Interpolador de Lagrange
                syms x;
                
                f = cos(x);

%       --> Especificamos el numero de puntos n discretos que utilizaremos
%           para obtener el Polinomio Interpolador de Lagrange.
%           Haremos un estudio para varios valores de n.
%           Notar que en la teoria el valor de n NO se corresponde exactamente
%           con el numero de puntos(en teoria n = numero Puntos - 1),
%           pero en nuestro caso debido a las caracteristicas internas de
%           Matlab(Matlab indexa la primera posicion de los vectores por el valor 1 y no el cero),
%           el valor que toma n SI se corresponde con el numero de puntos 
%           (en la practica n = numero de puntos).
%
%       --> Aclaraciones: Lo que hace Matlab para dibujar es tomar dos
%           puntos vecinos(entre medias no hay ningun otro punto) y unirlos
%           mediante una recta. Al dibujar la funcion que queremos aproximar le
%           decimos que dibuje un numero suficientemente grande de puntos (ej:1000) como
%           para que a la vista del ojo humano, la linea recta sea lo
%           suficientemente pequena como para no distinguirla, esto dota de curvatura 
%           al dibujo en el caso de ser la funcion que queremos aproximar una
%           funcion con cierta curvatura.

%       --> Lo que se pretende con las Aproximaciones es utilizar un numero
%           mucho menor de puntos para obtener resultados 'suficientemente' buenos
%           como para poder utilizar la Aproximacion en lugar de la funcion
%           que estamos aproximando. De esta forma pasamos de evaluar la
%           funcion real, por ejemplo, en 1000 puntos, a evaluar la Aproximacion de la
%           funcion real en solo 5 puntos obteniendo un error que, segun el
%           contexto, sea lo suficientemente pequeno como para justificar la
%           el uso de Aproximacion en sustitucion al uso de la funcion real
%           por el Ahorro computacional que supone pasar de evaluar 1000
%           puntos en la funcion real a evaluar solo 5 puntos en la
%           Aproximacion. Cuanto mas exigente sea el problema particular que estamos
%           tratando menor sera el Error que se permita cometer y en
%           consecuencia necesitaremos aproximaciones mejores, lo que trae
%           coomo consecuencia la utilizacion de un mayor n?mero de
%           puntos para obtener una Aproximacion lo suficientemente buena,
%           y esto conllevara un mayor coste computacional frente a una
%           Aproximacion que haga uso de un menor numero de puntos.
%
%       --> En este caso al no estar utilizando Matlab simbolico, no tiene
%           sentido calcular el Error cometido ya que los valores del Polinomio
%           de Interprlacion de Lagrange particularizados en los puntos
%           discretos del Intervalo cerrado [a,b] toman el mismo valor que la
%           funcion f(x) que estamos aproximando, por lo que el error en esos
%           puntos da como resultado cero, lo interesante del error es
%           estudiarlo en puntos difrentes a los puntos discretos que hemos
%           utilizado para obtener la aproximacion a traves del Polinimo de
%           Interpolacion de Lagrange. Mas adelante, cuando obtengamos una
%           expresion explicita en funcion de una variable independiente 'x'
%           para los Polinomios en Base de Lagrange que a su vez seran
%           utilizados para obtener una expresion explicita en funcion de una
%           variable independiente 'x' para el Polinomio de Interpolaci?n de
%           Lagrang(lo anterior se hace con Matlab Simbolico), 
%           podremos haciendo uso de dicha expresion, sustituir en ella todos y
%           cada uno de los puntos que hemos utilizado para representar la
%           funcion f(x), y de esta forma calculando el |f(x) - I(x)| podremos
%           obtener el error cometido en cada uno de los puntos, calculando el
%           maximo de todos ellos obtendremos la Cota de Error.
%        
%           
%   
%       CASO 0) Dibujamos la funcion f(x)= e^(-x) + cos(4x/pi) en un n?mero
%               suficientemente grande de puntos del Intervalo Cerrado [a,b] para
%               utilizarlo como modelo de la funcion real en dicho
%               intervalo.
%                format long;
%                n=1000;
%                X0=linspace(a,b,n);
%                F=zeros(1,n);
%                for i=1:n
%                 F(i)=exp(-X0(i)) + cos(4*X0(i)/pi);
%                end
%                figure(1);
%                plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%                title('Funcion y Polinomio Interpolador Lagrange');
%                xlabel('x');
%                axis([a b -1 2.5]);
%                grid on;
%                hold on;
         
% %       CASO 1) Dos puntos ==> n = 2
% %
                  n=4;
                  rutina1; 
%                %Calculo el Error cometido |f(x)-I(x)|
%                 F=zeros(1,n);
%                 for i=1:n
%                     F(i)=exp(-X(i)) + cos(4*X(i)/pi);
%                 end
%                 E=abs(F - I);
%                 CotaError1=max(E)
%                 
%                %Dibujo
%                 plot(X,I,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2, 'Marker','*','MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',21);
%                
%                
%        
% %       CASO 2) Tres puntos ==> n = 3
% 
%                n=3;
%                rutina1; 
%                %Calculo el Error cometido |f(x)-I(x)|
%                 F=zeros(1,n);
%                 for i=1:n
%                     F(i)=exp(-X(i)) + cos(4*X(i)/pi);
%                 end
%                 E=abs(F - I);
%                 CotaError2=max(E)
%                 
%                %Dibujo
%                plot(X,I,'LineWidth',2,'Marker','*','MarkerSize',18,'MarkerFaceColor',[0.3 0.3 0.3]); 
%                
% %       CASO 3) Cuatro puntos ==> n = 4
% 
%                n=4;
%                rutina1; 
%                %Calculo el Error cometido |f(x)-I(x)|
%                 F=zeros(1,n);
%                 for i=1:n
%                     F(i)=exp(-X(i)) + cos(4*X(i)/pi);
%                 end
%                 E=abs(F - I);
%                 CotaError3=max(E)
%                 
%                %Dibujo
%                plot(X,I,'MarkerEdgeColor',[0.4 0.4 0.4],'LineWidth',2,'Marker','*','MarkerSize',15,'MarkerFaceColor',[0.4 0.4 0.4]); 
% 
% %       CASO 4) Cinco puntos ==> n = 5
% 
%                n=5;
%                rutina1;
%                %Calculo el Error cometido |f(x)-I(x)|
%                 F=zeros(1,n);
%                 for i=1:n
%                     F(i)=exp(-X(i)) + cos(4*X(i)/pi);
%                 end
%                 E=abs(F - I);
%                 CotaError3=max(E)
%                 
%                %Dibujo
%                plot(X,I,'MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',2,'Marker','*','MarkerSize',12,'MarkerFaceColor',[0.5 0.5 0.5]); 
% 
% %       CASO 5) Seis puntos ==> n = 6
% 
%                n=6;
%                rutina1; 
%                %Calculo el Error cometido |f(x)-I(x)|
%                 F=zeros(1,n);
%                 for i=1:n
%                     F(i)=exp(-X(i)) + cos(4*X(i)/pi);
%                 end
%                 E=abs(F - I);
%                 CotaError5=max(E)
%                 
%                %Dibujo
%                plot(X,I,'MarkerEdgeColor',[0.6 0.6 0.6],'LineWidth',2,'Marker','*','MarkerSize',9,'MarkerFaceColor',[0.6 0.6 0.6]); 
%  
% %       CASO 6) Siete puntos ==> n = 7
% 
%                n=7;
%                rutina1;  
%                %Calculo el Error cometido |f(x)-I(x)|
%                 F=zeros(1,n);
%                 for i=1:n
%                     F(i)=exp(-X(i)) + cos(4*X(i)/pi);
%                 end
%                 E=abs(F - I);
%                 CotaError6=max(E)
%                 
%                %Dibujo
%                plot(X,I,'MarkerEdgeColor',[0.7 0.7 0.7],'LineWidth',2,'Marker','*','MarkerSize',6,'MarkerFaceColor',[0.7 0.7 0.7]); 
%                legend('f(x) = exp(-x) + cos(4x/pi)','Aproximacion n=2','Aproximacion n=3',...
%                'Aproximacion n=4','Aproximacion n=5','Aproximacion n=6','Aproximacion n=7'); 
%                lgd = legend;
%                lgd.FontSize = 18;
%            
% %        



