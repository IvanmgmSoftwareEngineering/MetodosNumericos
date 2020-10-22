%% PRACTICA 1
%  AUTOR: IVAN MARTIN GOMEZ

%% PRACTICA 1.1: Integracion Numerica
%           --> a) Programar 3 formulas del Rectangulo
%           --> b) Programar la Formula del Trapecio
%           --> c) Programar la Formula de Simpson 1/3
%
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: f       --> Funcion f(x) de la cual queremos obtener la
%                            Aproximacion de la Integral Definida en el 
%                            intervalo [a,b]
%   ARGUMENTO 2: a       --> Extremo Inferior Intervalo Cerrado. 
%   ARGUMENTO 3: b       --> Extremo Superior Intervalo Cerrado. 
%   ARGUMENTO 4: m_rec   --> Numero de puntos para Formula Rectangulo
%                            Compuesta. 
%   ARGUMENTO 5: m_trap  --> Numero de puntos para Formula Trapecio
%                            Compuesta. 
%   ARGUMENTO 6: m_simp  --> Numero de puntos para Formula Simpson 1/3
%                            Compuesta.
%
% SALIDA PROGRAMA
% (nota: el tiempo de ejecucion del Script es 90-100 segundos
%        aproximadamente. Esste tiempo tan elevado es debido a la cantidad elevada
%        de calculos que hay que hacer para obtener la Formula y la Representacion
%        de Simpson 1/3 Compuesta. Hay que tener paciencia, pido disculpas por la espera)
%
%   VENTANA DE COMANDOS: --> Se muestran de forma ordenada, explicada y
%                            etiquetada los resultados obtenidos
%
%   FIGURA 1:            --> Muestra la funci?n f(x) con la region
%                            comprendida entre la funcion y el Eje de Abcisas. 
%                            Esta region coloreada representa el valor real
%                            de la Integral.
%   FIGURA 2:            --> Muestra los resultados de las Formulas del
%                            Rectangulo    
%       SUBFIGURA 2.1:   --> Muestra los resultados de la Formula del
%                            Rectangulo Izquierdo
%       SUBFIGURA 2.2:   --> Muestra los resultados de la Formula del
%                            Rectangulo Derecho
%       SUBFIGURA 2.3:   --> Muestra los resultados de la Formula del
%                            Rectangulo Medio
%       SUBFIGURA 2.4:   --> Muestra los resultados de la Formula del
%                            Rectangulo Compuesto Izquierdo delta=cte 100 puntos
%       SUBFIGURA 2.5:   --> Muestra los resultados de la Formula del
%                            Rectangulo Compuesto Derecho delta=cte 100 puntos
%       SUBFIGURA 2.6:   --> Muestra los resultados de la Formula del
%                            Rectangulo Compuesto Medio delta=cte 100 puntos
%
%   FIGURA 3:            --> Muestra los resultados de las Formulas del
%                            Trapecio
%       SUBFIGURA 3.1:   --> Muestra los resultados de la Formula del
%                            Trapecio Compuesto delta=cte 100 puntos
%       SUBFIGURA 3.2:   --> Muestra los resultados de la Formula del
%                            Trapecio
%   FIGURA 4:            --> Muestra los resultados de las Formulas de
%                            Simpson 1/3
%       SUBFIGURA 4.1:   --> Muestra los resultados de la Formula de
%                            Simpson 1/3 Compuesto delta=cte 100 puntos
%       SUBFIGURA 4.2:   --> Muestra los resultados de la Formula del
%                            Simpson 1/3

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
        fprintf('Ejecutando programa!(El tiempo de ejecucion de este programa es de 2-3 min. aprox. Hay que tener paciencia) \n');
        fprintf('...\n');
               format short;
               n=1000;
               X0=linspace(a,b,n);
               F=zeros(1,n);
               for i=1:n
                F(i)=subs(f,x,X0(i));
               end
               figure(1);
               %subplot(1,2,1)
               a_f=area(X0,F);
               a_f.FaceColor = [0.2 0.6 0.5];
               a_f.EdgeColor = [0.63 0.08 0.18];
               grid on;
               hold on;
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('f(x)= cos(-1 + x^2)');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;
               

%       --> Dibujamos Formulas Simples Rectangulo (Izquierdo, Derecho, Medio) en la primera fila 
               figure(2);
               
               %--> Dibujamos Rectangulo Izquierdo
               
               subplot(2,3,1)
               a_rec_izq=area([a b],[subs(f,x,a),subs(f,x,a)]);
               a_rec_izq.FaceColor = [0.2 0.6 0.5];
               a_rec_izq.EdgeColor = [0.63 0.08 0.18];
               grid on;
               hold on;
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Rectangulo Izquierdo (1 punto)');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;

               scatter(a,subs(f,x,a),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

%       --> Dibujamos Rectangulo Derecho
               subplot(2,3,2)

               a_rec_der=area([a b],[subs(f,x,b),subs(f,x,b)]);
               a_rec_der.FaceColor = [0.2 0.6 0.5];
               a_rec_der.EdgeColor = [0.63 0.08 0.18];
               grid on;
               hold on;
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Rectangulo Derecho (1 punto)');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;

               scatter(b,subs(f,x,b),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

%       --> Dibujamos Rectangulo Medio
               subplot(2,3,3);
                
               a_rec_medio=area([a b],[subs(f,x,(b-a)/2),subs(f,x,(b-a)/2)]);
               a_rec_medio.FaceColor = [0.2 0.6 0.5];
               a_rec_medio.EdgeColor = [0.63 0.08 0.18];
               grid on;
               hold on;
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Rectangulo Medio (1 punto)');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;

               scatter((b-a)/2,subs(f,x,(b-a)/2),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               





%       --> Dibujamos Rectangulo Compuestos Izquierdo delta=cte     
%           Dibujamos 100 puntos que seran la altura de cada uno de los
%           Rectangulos que utilizaremos para obtener la Aproximacion a treves
%           de la Formula del Rectangulo Compuesto
               subplot(2,3,4)
               format short;
               n=m_rec;
               X1=linspace(a,b,n);
               for i=1:n
                rec_F(i)=subs(f,x,X1(i));
               end

               
               scatter(X1,rec_F,40,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               for i=2:n
                    
                    a_rec=area([X1(i-1) X1(i)],[rec_F(i-1) rec_F(i-1)]);                   
                    a_rec.FaceColor = [0.2 0.6 0.5];
                    a_rec.EdgeColor = [0.63 0.08 0.18];
               end
               grid on;
               hold on;
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Rectangulo Compuesto Izquierdo 100 puntos');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;
              
%       --> Dibujamos Rectangulo Compuestos Derecho delta=cte     
%           Dibujamos 100 puntos que seran la altura de cada uno de los
%           Rectangulos que utilizaremos para obtener la Aproximacion a treves
%           de la Formula del Rectangulo Compuesto
               subplot(2,3,5)
               format short;
               n=m_rec;
               X1=linspace(a,b,n);
               for i=1:n
                rec_F(i)=subs(f,x,X1(i));
               end

               
               scatter(X1,rec_F,40,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               for i=2:n
                    
                    a_rec=area([X1(i-1) X1(i)],[rec_F(i) rec_F(i)]);                   
                    a_rec.FaceColor = [0.2 0.6 0.5];
                    a_rec.EdgeColor = [0.63 0.08 0.18];
               end
               grid on;
               hold on;
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Rectangulo Compuesto Derecho 100 puntos');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;

%       --> Dibujamos Rectangulo Compuestos Medio delta=cte     
%           Dibujamos 100 puntos que seran la altura de cada uno de los
%           Rectangulos que utilizaremos para obtener la Aproximacion a treves
%           de la Formula del Rectangulo Compuesto
               subplot(2,3,6)
               format short;
               n=m_rec;
               X1=linspace(a,b,n);
               for i=1:n
                rec_F(i)=subs(f,x,X1(i));
               end

               
               scatter(X1,rec_F,40,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               for i=2:n
                    
                    a_rec=area([X1(i-1) X1(i)],[subs(f,x,(X1(i-1)+X1(i))/2) subs(f,x,(X1(i-1)+X1(i))/2)]);                   
                    a_rec.FaceColor = [0.2 0.6 0.5];
                    a_rec.EdgeColor = [0.63 0.08 0.18];
               end
               grid on;
               hold on;
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Rectangulo Compuesto Medio 100 puntos');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;

               


               
         
    %CALCULAMOS   
%       --> Calculamos Aproximaciones a traves de las Formulas Rectangulo
%           Izquierdo, Derecho y Medio
                % Obtenemos Aproximacion Formula Punto Extremo Izquierdo
                formula_Rectangulo_Izquierdo=1;
                formula_Rectangulo_Derecho=0;
                formula_Rectangulo_Medio=0;
                formula_Rectangulo_Compuesta_Izquierda_delta_cte=0;
                formula_Rectangulo_Compuesta_Derecha_delta_cte=0;
                formula_Rectangulo_Compuesta_Medio_delta_cte=0;
                rutina1;
                % Obtenemos Aproximacion Formula Punto Extremo Izquierdo
                formula_Rectangulo_Izquierdo=0;
                formula_Rectangulo_Derecho=1;
                formula_Rectangulo_Medio=0;
                formula_Rectangulo_Compuesta_Izquierda_delta_cte=0;
                formula_Rectangulo_Compuesta_Derecha_delta_cte=0;
                formula_Rectangulo_Compuesta_Medio_delta_cte=0;
                rutina1;
                % Obtenemos Aproximacion Formula Punto Extremo Izquierdo
                formula_Rectangulo_Izquierdo=0;
                formula_Rectangulo_Derecho=0;
                formula_Rectangulo_Medio=1;
                formula_Rectangulo_Compuesta_Izquierda_delta_cte=0;
                formula_Rectangulo_Compuesta_Derecha_delta_cte=0;
                formula_Rectangulo_Compuesta_Medio_delta_cte=0;
                rutina1;

%       --> Calculamos Aproximacion a traves de la Formula Rectangulo
%           Compuesta Izquierda con m=100 puntos deltaX constante
                formula_Rectangulo_Izquierdo=0;
                formula_Rectangulo_Derecho=0;
                formula_Rectangulo_Medio=0; 
                formula_Rectangulo_Compuesta_Izquierda_delta_cte=1;
                formula_Rectangulo_Compuesta_Derecha_delta_cte=0;
                formula_Rectangulo_Compuesta_Medio_delta_cte=0;
                rutina1;

%       --> Calculamos Aproximacion a traves de la Formula Rectangulo
%           Compuesta Izquierda con m=100 puntos deltaX constante
                formula_Rectangulo_Izquierdo=0;
                formula_Rectangulo_Derecho=0;
                formula_Rectangulo_Medio=0; 
                formula_Rectangulo_Compuesta_Izquierda_delta_cte=0;
                formula_Rectangulo_Compuesta_Derecha_delta_cte=1;
                formula_Rectangulo_Compuesta_Medio_delta_cte=0;
                rutina1;

%       --> Calculamos Aproximacion a traves de la Formula Rectangulo
%           Compuesta Izquierda con m=100 puntos deltaX constante
                formula_Rectangulo_Izquierdo=0;
                formula_Rectangulo_Derecho=0;
                formula_Rectangulo_Medio=0; 
                formula_Rectangulo_Compuesta_Izquierda_delta_cte=0;
                formula_Rectangulo_Compuesta_Derecha_delta_cte=0;
                formula_Rectangulo_Compuesta_Medio_delta_cte=1;
                rutina1;

         
            formula_Rectangulo_Izquierdo=0;
            formula_Rectangulo_Derecho=0;
            formula_Rectangulo_Medio=0; 
            formula_Rectangulo_Compuesta_Izquierda_delta_cte=0;
            formula_Rectangulo_Compuesta_Derecha_delta_cte=0;
            formula_Rectangulo_Compuesta_Medio_delta_cte=0;

fprintf('Fin Rectangulo\n');
fprintf('...\n');
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
               format short;
               n=m_trap;
               X1=linspace(a,b,n);
               for i=1:n
                trap_F(i)=subs(f,x,X1(i));
               end

               scatter(X1,trap_F,40,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               for i=2:n 
                    a_trap_com=area([X1(i-1) X1(i)],[trap_F(i-1) trap_F(i)]);                   
                    a_trap_com.FaceColor = [0.2 0.6 0.5];
                    a_trap_com.EdgeColor = [0.63 0.08 0.18];
               end
               grid on;
               hold on;

               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Trapecio Compuesto deltaX=cte 100 puntos');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;
  
%       --> Dibujamos Trapecio
               subplot(1,2,2)
               a_trap=area([a b],[subs(f,x,a) subs(f,x,b)]);
               a_trap.FaceColor = [0.2 0.6 0.5];
               a_trap.EdgeColor = [0.63 0.08 0.18];
               grid on;
               hold on;
               plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title('Trapecio (2 puntos)');
               xlabel('x');
               axis([a b -1.2 1.2]);
               grid on;
               hold on;
        
               scatter([a b],[subs(f,x,a) subs(f,x,b)],'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
               grid on;
               hold on;

               

         
    %CALCULAMOS   
%       --> Calculamos Aproximacion a traves de la Formula Trapecio       
                formula_Trapecio=1;
                formula_Trapecio_Compuesta_delta_cte=0;
                funcion_trapz_2=0;
                funcion_trapz_100=0;
                funcion_trapz_1000=0;
                funcion_trapz_10000=0;
                rutina1;
                

%       --> Calculamos Aproximacion a traves de la Formula Trapecio
%           Compuesta con m=100 puntos
                formula_Trapecio=0;
                formula_Trapecio_Compuesta_delta_cte=1;
                funcion_trapz_2=0;
                funcion_trapz_100=0;
                funcion_trapz_1000=0;
                funcion_trapz_10000=0;
                rutina1;

%       --> Calculamos Aproximacion a traves de la Funcion trapx(x,f) 2 puntos 
%           
                formula_Trapecio=0;
                formula_Trapecio_Compuesta_delta_cte=0;
                funcion_trapz_2=1;
                funcion_trapz_100=1;
                funcion_trapz_1000=0;
                funcion_trapz_10000=0;
                rutina1;
%       --> Calculamos Aproximacion a traves de la Funcion trapx(x,f) 100 puntos 
%           
                formula_Trapecio=0;
                formula_Trapecio_Compuesta_delta_cte=0;
                funcion_trapz_2=0;
                funcion_trapz_100=1;
                funcion_trapz_1000=0;
                funcion_trapz_10000=0;
                rutina1;

%       --> Calculamos Aproximacion a traves de la Funcion trapx(x,f) 1000 puntos 
%           
                formula_Trapecio=0;
                formula_Trapecio_Compuesta_delta_cte=0;
                funcion_trapz_2=0;
                funcion_trapz_100=0;
                funcion_trapz_1000=1;
                funcion_trapz_10000=0;
                rutina1;

%       --> Calculamos Aproximacion a traves de la Funcion trapx(x,f) 10000 puntos 
%           
%                 formula_Trapecio=0;
%                 formula_Trapecio_Compuesta_delta_cte=0;
%                 funcion_trapz_2=0;
%                 funcion_trapz_100=0;
%                 funcion_trapz_1000=0;
%                 funcion_trapz_10000=1;
%                 rutina1;

            formula_Trapecio=0;
            formula_Trapecio_Compuesta_delta_cte=0;
            funcion_trapz_2=0;
            funcion_trapz_100=0;
            funcion_trapz_1000=0;
            funcion_trapz_10000=0;

fprintf('Fin Trapecio\n');
fprintf('...\n');
%FIN APARTADO b)


%  Apartado c) Por definicion de la Formula de Simpson 1/3 solo utilizamos 3
%  puntos para la Aproximacion. Para comparar la calidad de la Aproximacion
%  utilizaremos la Formula de Simpson 1/3 Compuesta para m_trap = 100 puntos.

                m_simp=100;

      %DIBUJOS       
%       --> Dibujamos Simpson 1/3 Compuesto       
%           Dibujamos 100 puntos sobre la funcion f(x), estos puntos seran
%           utilizados para obtener las areas que utilizaremos en la
%           Formula del Simpson 1/3 Compuesto con deltaX constante para
%           obtener el valor de la Integral Definida.
               
               format short;
               n=m_simp;
               X1_simp=linspace(a,b,n);
               for i=1:n
                simp_F(i)=subs(f,x,X1_simp(i));
               end
                
               figure(4);
               subplot(1,2,1);

               for i=2:n-1
                    %Llamamos PPBL.m para obtener los Polinomios en Base de
                    %Lagrange del subintervalo [x(i-1) x(i+1)] con 3 puntos
                    %equiespaciados x(i-1), x(i) y x(i+1)
                        L=PPBL(3,[X1_simp(i-1) X1_simp(i) X1_simp(i+1)]);

                    %Lamamos PIL.m para obtener el Polinomio Interpolador
                    %de Lagrange p3(x) del subintervalo [x(i-1) x(i+1)]
                    % con 3 puntos equiespaciados x(i-1), x(i) y x(i+1)
                        p1=PIL(3,[X1_simp(i-1) X1_simp(i) X1_simp(i+1)],L,f);

                    %Dibujamos el Polinomio
                    %Interpolador de Lagrange p3(x) de cada subintervalo [x(i-1) x(i+1)]

                        
                            X4=linspace(X1_simp(i-1),X1_simp(i+1),100);
                            P1=zeros(1,100);
                            for i=1:100
                                P1(i)=subs(p1,x,X4(i));
                            end
                            %Dibujamos area bajo la curva dado por el Polinomio
                            %Interpolador de Lagrange p3(x)
                            a_simp_comp=area(X4,P1);
                            a_simp_comp.FaceColor = [0.2 0.6 0.5];
                            a_simp_comp.EdgeColor = [0.63 0.08 0.18];
                            grid on;
                            hold on;
                            plot(X4,P1,'MarkerEdgeColor',[0.5 0.5 0.5],'LineWidth',2);
                            grid on;
                            hold on;

                              
                end   
                scatter(X1,simp_F,40,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
                grid on;
                hold on;

               
                plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
                title('Simpson 1/3 Compuesto deltaX=cte 100 puntos');
                xlabel('x');
                axis([a b -1.2 1.2]);
                grid on;
                hold on;
           
%       --> Dibujamos Simpson 1/3
                subplot(1,2,2);

               %Llamamos a la funcion PPBL.m para obtener los Polinomios en
               %Base de Lagrange
                    X2=[a (a+b)/2 b];
                    L=PPBL(3,X2);

               %Llamamos a la funcion PIL.m para obtener el Polinomio
               %Interpolador de Lagrange

                    p=PIL(3,X2,L,f);

               %Dibujamos el Polinomio Interpolador de Lagrange
                
                    X3=linspace(a,b,1000);
                    P=zeros(1,1000);
                    for i=1:1000
                        P(i)=subs(p,x,X3(i));
                    end
               
                    a_trap=area(X3,P);
                    a_trap.FaceColor = [0.2 0.6 0.5];
                    a_trap.EdgeColor = [0.63 0.08 0.18];
                    grid on;
                    hold on;
                    plot(X3,P,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
                    grid on;
                    hold on;

                    plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
                    title('Simpson 1/3 (3 puntos)');
                    xlabel('x');
                    axis([a b -1.2 1.2]);
                    grid on;
                    hold on;
        
                    scatter([a (a+b)/2 b],[subs(f,x,a) subs(f,x,(a+b)/2) subs(f,x,b)],'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
                    grid on;
                    hold on;

               

         
%CALCULAMOS   
%       --> Calculamos Aproximacion a traves de la Formula Simpson 1/3       
                
                formula_Simpson=1;
                formula_Simpson_Compuesta_delta_cte=0;
                rutina1;
                

%       --> Calculamos Aproximacion a traves de la Formula Simpson 1/3
%           Compuesta con m=100 puntos
                formula_Simpson=0;
                formula_Simpson_Compuesta_delta_cte=1;
                rutina1;

            formula_Simpson=0;
            formula_Simpson_Compuesta_delta_cte=0;

fprintf('Fin Simpson 1/3');
clc;
%FIN APARTADO c)

% MOSTRAMOS RESULTADOS POR VENTANA DE COMANDOS          
   
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
   fprintf('\n');
   fprintf('          (NOTA: los errores se calculan comparando con resultado funcion trap() 10.000 puntos\n');
   fprintf('          (       el valor que arroja la funci?n trap() para 10.000 puntos se tomara como el\n');
   fprintf('          (       valor analitico de la integral\n');
   fprintf('\n');
   fprintf('--------------> FUNCION trapz(x,f) (1000 puntos) VALOR ANALITICO INTEGRAL ===> I = ');
   disp(double(I_trap(5)));
   fprintf('\n');
   fprintf('---> FAMILIA NEWTON-COTES\n');
   fprintf('\n');
   fprintf('--------> CONSTANTE (1 punto): FORMULA RECTANGULO');
   fprintf('\n');
   fprintf('--------------> RECTANGULO IZQUIERDO (1 punto)                            ===> I = ');
   disp(double(I_rec(1)));
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_rec(1))));
   fprintf('\n');
   fprintf('--------------> RECTANGULO DERECHO (1 punto)                              ===> I = ');
   disp(double(I_rec(2)));
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_rec(2))));
   fprintf('\n');
   fprintf('--------------> RECTANGULO MEDIO (1 punto)                                ===> I = ');
   disp(double(I_rec(3)));
   fprintf('\n');
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_rec(3))));
   fprintf('\n');
   fprintf('--------------> RECTANGULO COMPUESTO IZQUIERDO delta=cte (100 puntos)     ===> I = ');
   disp(double(I_rec(4)));
   fprintf('\n');
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_rec(4))));
   fprintf('\n');
   fprintf('--------------> RECTANGULO COMPUESTO DERECHO delta=cte (100 puntos)       ===> I = ');
   disp(double(I_rec(5)));
   fprintf('\n');
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_rec(5))));
   fprintf('\n');
   fprintf('--------------> RECTANGULO COMPUESTO MEDIO delta=cte (100 puntos)         ===> I = ');
   disp(double(I_rec(6)));
   fprintf('\n');
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_rec(6))));
   fprintf('\n');
   fprintf('--------> LINEAL (2 puntos): FORMULA TRAPECIO');
   fprintf('\n')
   fprintf('--------------> TRAPECIO (2 puntos)                                       ===> I = ');
   disp(double(I_trap(1)));
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_trap(1))));
   fprintf('\n');
   fprintf('--------------> TRAPECIO COMPUESTO delta=cte (100 puntos)                 ===> I = ');
   disp(double(I_trap(2)));
   fprintf('\n');
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_trap(2))));
   fprintf('\n');
   fprintf('--------------> FUNCION trapz(x,f) (2 puntos)                             ===> I = ');
   disp(double(I_trap(3)));
   fprintf('\n');
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_trap(3))));
   fprintf('\n');
   fprintf('--------------> FUNCION trapz(x,f) (100 puntos)                           ===> I = ');
   disp(double(I_trap(4)));
   fprintf('\n');
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_trap(1))));
   fprintf('\n');
   fprintf('--------> PARABOLICO (3 puntos): FORMULA SIMPSON 1/3');
   fprintf('\n'); 
   fprintf('--------------> SIMPSON 1/3 (3 puntos)                                    ===> I = ');
   disp(double(I_simp(1)));
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_simp(1))));
   fprintf('\n'); 
   fprintf('--------------> SIMPSON 1/3 COMPUESTO delta=cte (100 puntos)              ===> I = ');
   disp(double(I_simp(2)));
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(abs(I_trap(5)-I_simp(2))));
   fprintf('\n');
   fprintf('---> FAMILIA CUADRATURA GAUSSIANA: Quizas las veamos en alguna practica posterior\n');
     
   %Limpiamos Workspace
    clear a_f;
    clear a_rec;
    clear a_rec_der;
    clear a_rec_izq;
    clear a_rec_medio;
    clear a_simp_comp;
    clear a_trap_com;
    clear a_trap;
    clear a_trap_comp;
    clear deltaX;
    clear F;
    clear F_aux;
    clear formula_Rectangulo_Compuesta_Derecha_delta_cte;
    clear formula_Rectangulo_Compuesta_Izquierda_delta_cte;
    clear formula_Rectangulo_Compuesta_Medio_delta_cte;
    clear formula_Rectangulo_Derecho;
    clear formula_Rectangulo_Izquierdo;
    clear formula_Rectangulo_Medio;
    clear formula_Simpson;
    clear formula_Simpson_Compuesta_delta_cte;
    clear formula_Trapecio;
    clear formula_Trapecio_Compuesta_delta_cte;
    clear funcion_trapz_100;
    clear funcion_trapz_1000;
    clear funcion_trapz_10000;
    clear funcion_trapz_2;
    clear i;
    clear L;
    clear p;
    clear P;
    clear p1;
    clear P1;
    clear rec_F;
    clear simp_F;
    clear trap_F;
    clear x;
    clear X;
    clear X0;
    clear X1;
    clear X1_simp;
    clear X2;
    clear X3;
    clear X4;
    



