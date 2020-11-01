%% PRACTICA 1
%  AUTOR: IVAN MARTIN GOMEZ

%% PRACTICA 1.2: Integracion Numerica
%           --> a) Programar Formulas de Milne
%
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: f       --> Funcion f(x) de la cual queremos obtener la
%                            Aproximacion de la Integral Definida en el 
%                            intervalo [a,b]
%   ARGUMENTO 2: a       --> Extremo Inferior Intervalo Cerrado. 
%   ARGUMENTO 3: b       --> Extremo Superior Intervalo Cerrado. 
%   ARGUMENTO 4: N       --> Numero subintervalos para Formula Milne Compuesta.

%
% SALIDA PROGRAMA
%
%   --> VENTANA DE COMANDOS:    --> Se muestran de forma ordenada, explicada y
%                                   etiquetada los resultados obtenidos
%
%   --> FIGURAS:
%
%           FIGURA 1:           --> Muestra la funcion f(x) con la region
%                                   comprendida entre la funcion y el Eje de Abcisas. 
%                                   Esta region coloreada representa el valor real
%                                   de la Integral.
%
%           FIGURA 3:            --> Muestra los resultados de las Formulas de
%                                    Milne
%
%               SUBFIGURA 3.1:   --> Muestra los resultados de la Formula de
%                                    Milne Compuesto delta=cte
%                                    N-subintervalos. N={2,4,8,16,32}
%
%               SUBFIGURA 3.2:   --> Muestra los resultados de la Formula del
%   
%-------------------------------------------------------------------------------------------------------------------------
%  
close all;
clear all;
clc;
format long;


%   Datos: 
%       --> Funcion que queremos Aproximar:         f(x) = cos(x) - x*sin(x)
%       
%       --> Intervalo Cerrado:                      [0,3]


%       --> Especificamos Funcion f(x)= cos(x) - x*sin(x)
                
                syms x;               
                f = cos(x) - x*sin(x);
                
%       --> Especificamos el intervalo cerrado [a,b].
%               
                a=1;
                b=3;
                
%       --> Especificamos el Numero N de subintervalos Formula Milne Compuesta.
%               
                N=2;
                
                
                

                
%EMPIEZA EL PROGRAMA

fprintf('Ejecutando programa! \n');
fprintf('...\n');

  %CALCULOS
  
%       --> Obtenemos valor de referencia de la integral de f(x) en el
%           intervalo [0,3], mediante funci?n trapz();
                X_trap=linspace(a,b,1000);
                for i=1:1000                    
                    F_trap(i)=subs(f,x,X_trap(i));
                end
                
                I_ref=trapz(X_trap,F_trap);
                
  
%       --> Obtenemos el valor de la aproximacion de la Integral 
%           mediante Formula de Milne Simple.
                X_Milne_simple=linspace(a,b,5);
                for i=1:5                    
                    F_Milne_simple(i)=subs(f,x,X_Milne_simple(i));
                end

                I_Milne_simple= (b-a)/90 *(7*F_Milne_simple(1)+32*F_Milne_simple(2)+12*F_Milne_simple(3)+32*F_Milne_simple(4)+7*F_Milne_simple(5));
                
%       --> Obtenemos el error cometido por la aproximacion de la Formula
%           de Milne Simple comparando el valor obtenido con el valor de
%           Referencia.
               
                Error_Milne_simple=abs(I_Milne_simple - I_ref);
               
%       --> Obtenemos el valor de la aproximacion de la Integral 
%           mediante Formula de Milne Compuesta: dividimos el intervalo
%           [a,b] en N subintervalos y aplicamos en cada subintervalo la
%           Formula de Milne Simple
                I_Milne_compuesta=0;
                X1=linspace(a,b,N+1);
                for j=1:N
                    X2=linspace(X1(j),X1(j+1),5);
                    for i=1:5                    
                        F_Milne_aux(i)=subs(f,x,X2(i));
                    end
                    I_Milne_compuesta= I_Milne_compuesta + (X1(j+1)-X1(j))/90 *(7*F_Milne_aux(1)+32*F_Milne_aux(2)+12*F_Milne_aux(3)+32*F_Milne_aux(4)+7*F_Milne_aux(5));
                end
                
%       --> Obtenemos el error cometido por la aproximacion de la Formula
%           de Milne cCompuesta comparando el valor obtenido con el valor de
%           Referencia.
               
                Error_Milne_compuesta=abs(I_Milne_compuesta - I_ref);
                             
                


                
                
                
                
%   %DIBUJOS
% %       --> Dibujamos la funcion f(x)= cos(x) - x*sin(x)  en un numero
% %           suficientemente grande de puntos del Intervalo Cerrado [a,b] para
% %           utilizarlo como modelo de la funcion real en dicho
% %           intervalo.
%         
%                format short;
%                1000;
%                X0=linspace(a,b,1000);
%                F=zeros(1,1000);
%                for i=1:1000
%                 F(i)=subs(f,x,X0(i));
%                end
%                figure(1);
%                a_f=area(X0,F);
%                a_f.FaceColor = [0.2 0.6 0.5];
%                a_f.EdgeColor = [0.63 0.08 0.18];
%                grid on;
%                hold on;
%                plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%                title('f(x)= cos(x) - x*sin(x)');
%                xlabel('x');
%                axis([a b -2.5 1.2]);
%                grid on;
%                hold on;
%                
% %       --> Dibujamos la funcion el Polinomio Interpolador de Lagrange 5 puntos
% %            p5(x) sobre la funci?n f(x)
%             
%                 X=linspace(a,b,5);
%                 L=PPBL(5,X);
%                 
%                 p=PIL(5,X,L,f);
%                 
%                 
%                 for i=1:1000
%                     P(i)=subs(p,x,X0(i));
%                 end
%                 figure(2);
%                 plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%                 xlabel('x');
%                 axis([a b -2.5 1.2]);
%                 grid on;
%                 hold on;
%                 plot(X0,P,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2);
%                 legend('f(x)','p5(x)'); 
%                 lgd = legend;
%                 lgd.FontSize = 14;
% 
% %       --> Dibujamos Milne Compuesto N=2 subintervalos    
% %           Dibujamos 3 puntos sobre la funcion f(x), estos puntos seran
% %           utilizados para obtener las areas que utilizaremos en la
% %           Formula del Milne Compuesto con deltaX constante para
% %           obtener el valor de la Integral Definida.
%                
%                 X1=linspace(a,b,N+1);
%                 figure(3);
%                 subplot(1,N+1,1);
%                 plot(X0,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%                 title(['N = ',num2str(N),' subintervalos']);
%                 grid on;
%                 hold on;
%                 for i=1:length(X1)
%                     Puntos_extremos_subintervalos(i)=subs(f,x,X1(i));
%                 end
%                 scatter(X1,Puntos_extremos_subintervalos,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
%                 grid on;
%                 hold on;
% 
% %           --> Aplicamos Milne Simple a cada uno de los dos subintervalos
% 
% %               --> Primero dividimos el intervalo [a,b] en N subintervalos
% %                   y dibujamos la funci?n f(x) en cada uno de dichos
% %                   subintervalos
%                 for j=1:length(X1)-1
%                     X2=linspace(X1(j),X1(j+1),1000);
%                     for i=1:1000
%                         F21(i)=subs(f,x,X2(i));
%                     end
%                     subplot(1,N+1,j+1);
%                     plot(X2,F21,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%                     title(['f(x) Subintervalo ',num2str(j)]);
%                     axis([X1(j) X1(j+1) -2.5 1.2]);
%                     grid on;
%                     hold on;
%                     scatter([X1(j) X1(j+1)],[Puntos_extremos_subintervalos(j) Puntos_extremos_subintervalos(j+1)],'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .7 .7],'LineWidth',2);
%                     grid on;
%                     hold on;
%                     
%                 end
%                 
% %               --> Ahora aplicamos Milne Simple a cada subintervalos
% %                   Dibujamos el Polinomio Interpolador de Lagrange en 
% %                   cada uno de dichos subintervalos
%                 figure(4);
%                 for j=1:length(X1)-1
%                     X3=linspace(X1(j),X1(j+1));
%                     L2=PPBL(5,X3);
%                     p5_2=PIL(5,X3,L2,f);
%                     X4=linspace(X1(j),X1(j+1),1000);
%                     for i=1:1000
%                         P5_2(i)=subs(p5_2,x,X4(i));
%                     end
%                     subplot(1,N,j);
%                     plot(X4,P5_2,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%                     title(['p5(x) Subintervalo ',num2str(j)]);
%                     axis([X1(j) X1(j+1) -2.5 1.2]);
%                     grid on;
%                     hold on;
%                     
%                 end
                
fprintf('Fin Milne');

% MOSTRAMOS RESULTADOS POR VENTANA DE COMANDOS          
   
   fprintf('-----------------------------------------\n');
   fprintf('DATOS DEL PROBLEMA\n');
   fprintf('\n');
   fprintf('---> f(x) = ');
   disp(f);
   fprintf('---> [a,b] = [%d,%d]\n',a,b);
   fprintf('\n');
   fprintf('---> n = %d\n',5);
   fprintf('-----------------------------------------\n');
   fprintf('RESULTADOS\n');
   fprintf('\n');
   fprintf('\n');
   fprintf('          (NOTA: los errores se calculan comparando con resultado funcion trap() 1.000 puntos\n');
   fprintf('          (       el valor que arroja la funcion trap() para 1.000 puntos se tomara como el\n');
   fprintf('          (       valor analitico de la integral\n');
   fprintf('\n');
   fprintf('--------------> FUNCION trapz(x,f) (1000 puntos) VALOR ANALITICO INTEGRAL ===> I = ');
   disp(double(I_ref));
   fprintf('\n');
   fprintf('--------> QUINTICA (5 puntos): FORMULA MILNE');
   fprintf('\n'); 
   fprintf('--------------> MILNE (5 puntos)                                    ===> I = ');
   disp(double(I_Milne_simple));
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(Error_Milne_simple));
   fprintf('\n'); 
   fprintf('--------------> MILNE COMPUESTO delta=cte (%i subintervalos)              ===> I = ',N);
   disp(double(I_Milne_compuesta));
   fprintf('--------------> ERROR COMETIDO                                            ===> E = ');
   disp(double(Error_Milne_compuesta));
   fprintf('\n');





                
    
                
