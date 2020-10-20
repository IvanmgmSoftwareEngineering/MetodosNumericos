%% PRACTICA 1
%  AUTOR: IVAN MARTIN GOMEZ

%% PRACTICA 1.1: Integracion Numerica
%           --> a) Programar 3 formulas del Rectangulo
%           --> b) Programar la Formula del Trapecio
%           --> c) Programar la Formula de Simpson 1/3
%
%  Datos: 
%       --> Funcion que queremos Aproximar:         f(x) = cos(-1 + x^2)
%       
%       --> Intervalo Cerrado:                      [0,2*pi]


%       --> Especificamos Funcion f(x)= cos(-1 + x^2) 
                close all;
                clear all;
                clc;
                syms x;               
                f = cos(-1 + x^2);
                
%       --> Especificamos el intervalo cerrado [a,b].
%               
                a=0;
                b=2*pi;
%

%  Apartado a) Por definicion de las Formulas del Rectangulo Izquiero, Derecho y
%              Medio solo se utiliza un punto. Para comparar la calidad de
%              las Aproximaciones hechas con cada una de las tres formulas
%              utilizaremos la Formula del Rectangulo Compuesto con m_rec = 100
%              puntos

                m_rec=100;

      %DIBUJOS
%       --> Dibujamos la funcion f(x)= cos(-1 + x^2)  en un numero
%           suficientemente grande de puntos del Intervalo Cerrado [a,b] para
%           utilizarlo como modelo de la funcion real en dicho
%           intervalo.

               format short;
               n=1000;
               X0=linspace(a,b,n);
               F=zeros(1,n);
               for i=1:n
                F(i)=subs(f,x,X0(i));
               end
               figure(1);
               %subplot(1,2,1)
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('f(x)= cos(-1 + x^2)');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;
%       --> Dibujamos Rectangulo Compuestos delta=cte     
%           Dibujamos 100 puntos que seran la altura de cada uno de los
%           Rectangulos que utilizaremos para obtener la Aproximacion a treves
%           de la Formula del Rectangulo Compuesto

               figure(2);
               subplot(2,2,1)
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Rectangulo Compuesto 100 puntos');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;
                
               format short;
               n=m_rec;
               X1=linspace(a,b,n);
               for i=1:n
                rec_F(i)=subs(f,x,X1(i));
               end

               
               scatter(X1,rec_F,40,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               for i=1:n-1
                    X2=[X1(i) X1(i+1)];
                    F_aux=[rec_F(i) rec_F(i)];
                    plot(X2,F_aux,'MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',2);
               end

               for i=2:n-1
                    plot([X1(i) X1(i)],[0 rec_F(i-1)],'MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',2);
               end

               for i=2:n-1
                    plot([X1(i) X1(i)],[rec_F(i-1) rec_F(i)],':','MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',2);
               end
              
%       --> Dibujamos Rectangulo Izquierdo
               subplot(2,2,2)
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Rectangulo Izquierdo (1 punto)');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;

               scatter(a,subs(f,x,a),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               area([a b],[subs(f,x,a),subs(f,x,a)]);
%       --> Dibujamos Rectangulo Derecho
               subplot(2,2,3)
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Rectangulo Derecho (1 punto)');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;

               scatter(b,subs(f,x,b),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               area([a b],[subs(f,x,b),subs(f,x,b)]);
%       --> Dibujamos Rectangulo Medio
               subplot(2,2,4)
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Rectangulo Medio (1 punto)');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;

               scatter((b-a)/2,subs(f,x,(b-a)/2),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               area([a b],[subs(f,x,(b-a)/2),subs(f,x,(b-a)/2)]);
         
%CALCULAMOS   
%       --> Calculamos Aproximaciones a traves de las Formulas Rectangulo
%           Izquierdo, Derecho y Medio
                % Obtenemos Aproximacion Formula Punto Extremo Izquierdo
                formula_Rectangulo_Izquierdo=1;
                formula_Rectangulo_Derecho=0;
                formula_Rectangulo_Medio=0;
                formula_Rectangulo_Compuesta_delta_cte=0;
                formula_Rectangulo_Compuesta_delta_no_cte=0;
                rutina1;
                % Obtenemos Aproximacion Formula Punto Extremo Izquierdo
                formula_Rectangulo_Izquierdo=0;
                formula_Rectangulo_Derecho=1;
                formula_Rectangulo_Medio=0;
                formula_Rectangulo_Compuesta_delta_cte=0;
                formula_Rectangulo_Compuesta_delta_no_cte=0;
                rutina1;
                % Obtenemos Aproximacion Formula Punto Extremo Izquierdo
                formula_Rectangulo_Izquierdo=0;
                formula_Rectangulo_Derecho=0;
                formula_Rectangulo_Medio=1;
                formula_Rectangulo_Compuesta_delta_cte=0;
                formula_Rectangulo_Compuesta_delta_no_cte=0;
                rutina1;

%       --> Calculamos Aproximacion a traves de la Formula Rectangulo
%           Compuesta con m=100 puntos deltaX constante
                formula_Rectangulo_Izquierdo=0;
                formula_Rectangulo_Derecho=0;
                formula_Rectangulo_Medio=0; 
                formula_Rectangulo_Compuesta_delta_cte=1;
                formula_Rectangulo_Compuesta_delta_no_cte=0;
                rutina1;

%       --> Calculamos Aproximacion a traves de la Formula Rectangulo
%           Compuesta con m=100 puntos deltaX NO constante. Mirando el
%           comportamiento de la funcion nos damos cuenta que eligiendo mas
%           inteligentemente cada uno de los 100 puntos, quizas podamos
%           obtener una mejor aproximacion que para el caso de tomar 100
%           puntos equiespaciados.
%           Quizas el mejor criterio para elegir la distancia entre dos
%           puntos consecutivos sea teniendo en cuenta la frecuencia de la
%           funcion que estamos aproximando.
%           En este caso en particular nos damos cuenta que la frecuencia
%           de la funcion que estamos aproximando f(x) = cos(-1 + x^2)
%           aumenta a medida que avanzamos por el eje de abcisas x.
%           Teniendo en cuenta que estamos utilizando rectangualos, quizas
%           el mejor criterio que podemos utilizar para selecionar el ancho 
%           de cada uno de los rectangulos sea el siguiente: a mayor
%           frecuencia menor longitud de la base del rectangulo.

%                 formula_Rectangulo_Izquierdo=0;
%                 formula_Rectangulo_Derecho=0;
%                 formula_Rectangulo_Medio=0; 
%                 formula_Rectangulo_Compuesta_delta_cte=0;
%                 formula_Rectangulo_Compuesta_delta_no_cte=1;
%                 rutina1;
%             
            formula_Rectangulo_Izquierdo=0;
            formula_Rectangulo_Derecho=0;
            formula_Rectangulo_Medio=0; 
            formula_Rectangulo_Compuesta_delta_cte=0;
            formula_Rectangulo_Compuesta_delta_no_cte=0;


%FIN APARTADO a)


%  Apartado b) Por definicion de la Formula del Trapecio solo utilizamos 2
%  puntos para la Aproximacion. Para comparar la calidad de la Aproximacion
%  utilizaremos la Formula del Trapecio Compuesta para m_trap = 100 puntos.

                m_trap=100;

      %DIBUJOS       
%       --> Dibujamos Trapecio Compuesto       
%           Dibujamos 100 puntos sobre la funcion f(x), estos puntos seran
%           utilizados para obtener los trapecios que utilizaremos en la
%           Formula del Trapecio Compuesto con deltaX constante.

               figure(3);
               subplot(1,2,1)
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Trapecio Compuesto deltaX=cte 100 puntos');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;
                
               format short;
               n=m_trap;
               X1=linspace(a,b,n);
               for i=1:n
                trap_F(i)=subs(f,x,X1(i));
               end

               
               scatter(X1,trap_F,40,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               for i=1:n-1
                    X2=[X1(i) X1(i+1)];
                    F_aux=[trap_F(i) trap_F(i+1)];
                    plot(X2,F_aux,'MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',2);
               end

               for i=1:n
                    plot([X1(i) X1(i)],[0 trap_F(i)],'MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',2);
               end
                
                
              
%       --> Dibujamos Trapecio
               subplot(1,2,2)
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Trapecio (2 puntos)');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;
        
               scatter([a b],[subs(f,x,a) subs(f,x,b)],'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               area([a b],[subs(f,x,a) subs(f,x,b)]);

         
%CALCULAMOS   
%       --> Calculamos Aproximacion a traves de la Formula Trapecio       
                % Obtenemos Aproximacion Formula Punto Extremo Izquierdo
                formula_Trapecio=1;
                formula_Trapecio_Compuesta_delta_cte=0;
                rutina1;
                

%       --> Calculamos Aproximacion a traves de la Formula Trapecio
%           Compuesta con m=100 puntos
                formula_Trapecio=0;
                formula_Trapecio_Compuesta_delta_cte=1;
                rutina1;

            formula_Trapecio=0;
            formula_Trapecio_Compuesta_delta_cte=0;

%FIN APARTADO b)

%       --> c) Programar la Formula de Simpson 1/3

  
% MOSTRAMOS RESULTADOS POR VENTANA DE COMANDOS          
   format short;
   fprintf('-----------------------------------------\n');
   fprintf('DATOS DEL PROBLEMA\n');
   fprintf('\n');
   fprintf('---> f(x) = ');
   disp(f);
   fprintf('---> [a,b] = [%d,%d]\n',a,b);
   fprintf('\n');
   fprintf('---> n = %d\n',n);
   fprintf('-----------------------------------------\n');
   fprintf('RESULTADOS\n');
   fprintf('\n');
   fprintf('---> FAMILIA NEWTON-COTES\n');
   fprintf('\n');
   
   fprintf('--------> CONSTANTE: FORMULA RECTANGULO');
   fprintf('\n');
   fprintf('          (NOTA: los errores se calculan comparando con resultado Rectangulo Compuesto delta=cte 100 puntos)\n');
   fprintf('\n');
   fprintf('--------------> PUNTO EXTREMO IZQUIERDO (1 punto)           ===> I = ');
   disp(double(I_rec(1)));
   fprintf('--------------> ERROR COMETIDO                              ===> E = ');
   disp(double(abs(I_rec(4)-I_rec(1))));
   fprintf('\n');
   fprintf('--------------> PUNTO EXTREMO DERECHO (1 punto)             ===> I = ');
   disp(double(I_rec(2)));
   fprintf('--------------> ERROR COMETIDO                              ===> E = ');
   disp(double(abs(I_rec(4)-I_rec(2))));
   fprintf('\n');
   fprintf('--------------> PUNTO MEDIO (1 punto)                       ===> I = ');
   disp(double(I_rec(3)));
   fprintf('--------------> ERROR COMETIDO                              ===> E = ');
   disp(double(abs(I_rec(4)-I_rec(3))));
   fprintf('\n');
   fprintf('--------------> RECTANGULO COMPUESTO delta=cte (100 puntos) ===> I = ');
   disp(double(I_rec(4)));
   fprintf('\n');
   fprintf('\n');
   fprintf('--------> LINEAL: FORMULA TRAPECIO');
   fprintf('\n');
   fprintf('          (NOTA: el error se calcula comparando con resultado Trapecio Compuesto delta=cte 100 puntos)\n');
   fprintf('\n');
   fprintf('--------------> TRAPECIO (2 puntos)                         ===> I = ');
   disp(double(I_trap(1)));
   fprintf('--------------> ERROR COMETIDO                              ===> E = ');
   disp(double(abs(I_trap(2)-I_trap(1))));
   fprintf('\n');
   fprintf('--------------> TRAPECIO COMPUESTO delta=cte (100 puntos)   ===> I = ');
   disp(double(I_trap(2)));
   fprintf('\n');
   fprintf('--------> PARABOLICO: FORMULA SIMPSON 1/3');
   fprintf('\n');
   fprintf('\n');
   fprintf('---> FAMILIA CUADRATURA GAUSSIANA\n');
        



