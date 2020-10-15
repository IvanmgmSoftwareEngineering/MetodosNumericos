%% PRACTICA 1
%  AUTOR: IVAN MARTIN GOMEZ

%% PRACTICA 1.1: Polinomios en Base de Lagrange (PPBL) y Polinomio Interpolador de Lagrange (PIL)
%
%  Uso: Ejecute desde la Ventana de Comandos el siguiente mandato: Script1.m 
%        
%       --> Especificamos el intervalo cerrado [a,b].
%               
                a=0;
                b=2;
                
%       --> Especificamos Funci?n f(x)= e^(-x) + cos(4x/pi) que queremos 
%           Aproximar mediante el Polinomio
%           Interpolador de Lagrange. Esta funci?n hay que especificarla dentro
%           del Fichero de tipo funci?n llamado PIL.m. M?s adelante cuando trabajemos
%           con Matlab simb?lico quiz?s se pueda especificar desde aqu?.

%       --> Especificamos el n?mero de puntos n discretos que utilizaremos
%           para obtener el Polinomio Interpolador de Lagrange.
%           Haremos un estudio para varios valores de n.
%           Notar que en la teor?a el valor de n NO se corresponde exactamente
%           con el n?mero de puntos(en teor?a n = n?mero Puntos - 1),
%           pero en nuestro caso debido a las caracter?sticas internas de
%           Matlab(Matlab indexa la primera posici?n de los vectores por el valor 1 y no el cero),
%           el valor que toma n SI se corresponde con el n?mero de puntos 
%           (en la pr?ctica n = n?mero de puntos).
%
%       --> Aclaraciones: Lo que hace Matlab para dibujar es tomar dos
%           puntos vecinos(entre medias no hay ning?n otro punto) y unirlos
%           mediante una recta. Al dibujar la funci?n que queremos aproximar le
%           decimos que dibuje un n?mero suficientemente grande de puntos (ej:1000) como
%           para que a la vista del ojo humano, la l?nea recta sea lo
%           suficientemente peque?a c?mo para no distinguirla, esto dota de curvatura 
%           al dibujo en el caso de ser la funci?n que queremos aproximar una
%           funci?n con cierta curvatura.

%       --> Lo que se pretende con las Aproximaciones es utilizar un n?mero
%           mucho menor de puntos para obtener resultados 'suficientemente' buenos
%           c?mo para poder utilizar la Aproximaci?n en lugar de la funci?n
%           que estamos aproximando. De esta forma pasamos de evaluar la
%           funcion real, por ejemplo, en 1000 puntos, a evaluar la Aproximaci?n de la
%           funci?n real en s?lo 5 puntos obteniendo un error que, seg?n el
%           contexto, sea lo suficientemente peque?o como para justificar la
%           el uso de Aproximaci?n en sustituci?n al uso de la funci?n real
%           por el Ahorro computacional que supone pasar de evaluar 1000
%           puntos en la funci?n real a evaluar s?lo 5 puntos en la
%           Aproximaci?n. Cuanto m?s exigente sea el problema particular que estamos
%           tratando menor ser? el Error que se permita cometer y en
%           consecuencia necesitaremos aproximaciones mejores, lo que trae
%           coomo consecuencia la utilizaci?n de un mayor n?mero de
%           puntos para obtener una Aproximaci?n lo suficientemente buena,
%           y esto conllevar? un mayor coste computacional frente a una
%           Aproximaci?n que haga uso de un menor n?mero de puntos.
%           
%           
%           

%
%       --> En este caso al no estar utilizando Matlab simb?lico, no tiene
%           sentido calcular el Error cometido ya que los valores del Polinomio
%           de Interprlaci?n de Lagrange particularizados en los puntos
%           discretos del Intervalo cerrado [a,b] toman el mismo valor que la
%           funci?n f(x) que estamos aproximando, por lo que el error en esos
%           puntos der?a como resultado cero, lo interesante del error es
%           estudiarlo en puntos difrentes a los puntos discretos que hemos
%           utilizado para obtener la aproximaci?n a trav?s del Polinimo de
%           Interpolaci?n de Lagrange. M?s adelante, cuando obtengamos una
%           expresi?n explicita en funci?n de una variable independiente 'x'
%           para los Polinomios en Base de Lagrange que a su vez ser?n
%           utilizados para obtener una expresi?n expl?cita en funci?n de una
%           variable independiente 'x' para el Polinomio de Interpolaci?n de
%           Lagrang(lo anterior se hace con Matlab Simb?lico), 
%           podremos haciendo uso de dicha expresi?n, sustituir en ella todos y
%           cada uno de los puntos que hemos utilizado para representar la
%           funci?n f(x), y de esta forma calculando el |f(x) - I(x)| podremos
%           obtener el error cometido en cada uno de los puntos, calculando el
%           m?ximo de todos ellos obtendremos la Cota de Error.
%        
%           
%   
%       CASO 0) Dibujamos la funci?n f(x)= e^(-x) + cos(4x/pi) en un n?mero
%               suficientemente grande de puntos del Intervalo Cerrado [a,b] para
%               utilizarlo como modelo de la funci?n real en dicho
%               intervalo.
               n=1000;
               X0=linspace(a,b,n);
               F=zeros(1,1000);
               for i=1:n
                F(i)=exp(-X0(i)) + cos(4*X0(i)/pi);
               end
               figure(1);
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Funcion y Polinomio Interpolador Lagrange');
               xlabel('x');
               axis([a b -1 2.5]);
               grid on;
               hold on;
         
%       CASO 1) Dos puntos ==> n = 2
%
               n=2;
               rutina1;   
               plot(X,I,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2, 'Marker','*','MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',21); 
       
%       CASO 2) Tres puntos ==> n = 3

               n=3;
               rutina1;   
               plot(X,I,'MarkerEdgeColor',[0.3 0.3 0.3],'LineWidth',2,'Marker','*','MarkerSize',18,'MarkerFaceColor',[0.3 0.3 0.3]); 
               
%       CASO 3) Cuatro puntos ==> n = 4

               n=4;
               rutina1;   
               plot(X,I,'MarkerEdgeColor',[0.4 0.4 0.4],'LineWidth',2,'Marker','*','MarkerSize',15,'MarkerFaceColor',[0.4 0.4 0.4]); 

%       CASO 4) Cinco puntos ==> n = 5

               n=5;
               rutina1;   
               plot(X,I,'MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',2,'Marker','*','MarkerSize',12,'MarkerFaceColor',[0.5 0.5 0.5]); 

%       CASO 5) Seis puntos ==> n = 6

               n=6;
               rutina1;   
               plot(X,I,'MarkerEdgeColor',[0.6 0.6 0.6],'LineWidth',2,'Marker','*','MarkerSize',9,'MarkerFaceColor',[0.6 0.6 0.6]); 
 
%       CASO 6) Siete puntos ==> n = 7

               n=7;
               rutina1;   
               plot(X,I,'MarkerEdgeColor',[0.7 0.7 0.7],'LineWidth',2,'Marker','*','MarkerSize',6,'MarkerFaceColor',[0.7 0.7 0.7]); 
               legend('f(x) = exp(-x) + cos(4x/pi)','Aproximacion n=2','Aproximacion n=3',...
               'Aproximacion n=4','Aproximacion n=5','Aproximacion n=6','Aproximacion n=7'); 
           
%        
%%


