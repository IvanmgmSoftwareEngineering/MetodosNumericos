%% EJERCICIOS PROPUESTOS: Polinomios en Base de Lagrange (PPBL) y Polinomio Interpolador de Lagrange (PIL)
%  DESCRIPCION: Calculo de los PPBL, PIL, Error y Cota Error
%  AUTOR: IVAN MARTIN GOMEZ

%% Ejercio 1: 
%  Datos: 
%       --> Funcion que queremos Aproximar:         f(x) = cos(x)
%       --> Intervalo Cerrado:                      [0,pi/2]
%       --> Numero puntos utilizados Aproximacion:  n = 4 
%
%  nota: Soluci?n oficial:          |E(x)|=< 0.0005348
%        Solucion obtenida por mi:  |E(x)|=< 0.0031


%       --> Especificamos Funcion f(x)= cos(x) que queremos 
%           Aproximar mediante el Polinomio
%           Interpolador de Lagrange
                
                syms x;               
                f = cos(x);
                
%       --> Especificamos el intervalo cerrado [a,b].
%               
                a=0;
                b=pi/2;
                
%       --> Especificamos el numero de puntos discretos que utilizaremos en
%           la Aproximacion
%               
                n=4;
                
%       

%      CASO 0)Dibujamos la funcion f(x)= cos(x) en un numero
%             suficientemente grande de puntos del Intervalo Cerrado [0,pi/2] 
%             para utilizarlo como modelo de la funcion real en dicho              
%             intervalo.
               
               format long;
               n0=1000;
               X0=linspace(a,b,n0);
               F=zeros(1,n0);
               for i=1:n0
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
         
%        CASO 1) Cuatro puntos ==> n = 4 [0,pi/6,pi/3,pi/2]

                  rutina1; 
  
                % Dibujo Polinomio Interpolador de Lagrange sobre la misma
                % grafica que la funcion f(x)
                    
                    plot(X,I,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2, 'Marker','*','MarkerFaceColor',[0.2 0.2 0.2],'MarkerSize',21);               
                    legend('f(x) = cos(x)','Aproximacion n=4'); 
                    lgd = legend;
                    lgd.FontSize = 18;
                    
                 % Dibujo la Funcion de Error E(x) y la Cota de Error en la
                 % misma grafica
                   
                   n0=1000;
                   X0=linspace(a,b,n0);
                   E=zeros(1,n0);
                   C=zeros(1,n0);
                   for i=1:n0
                        E(i)=abs(subs(error,x,X0(i)));
                        C(i)=double(cotaError);
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
                   
   % Muestor por Ventada de Comandos los datos del problema y los
   % resultados mas relevantes:
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
   fprintf('---> Puntos Discretos\n');
   for i=1:n
   fprintf('--------> x%i = ',i);
   disp(X(i));
   end
   fprintf('\n');
   fprintf('---> Polinomios en Base de Lagrange (PPBL)\n');
   for i=1:n
   fprintf('--------> L%i(x) = ',i);
   disp(collect(L(i)));
   end
   fprintf('\n');
   fprintf('---> Polinomio Interpolador de Lagrange (PIL)\n');
   fprintf('--------> I(x) = ');
   disp(collect(p));
   fprintf('\n');
   fprintf('---> ERROR\n');
   fprintf('--------> E(x) = ');
   disp(collect(error));
   fprintf('-------------> g(x) = ');
   disp(collect(g));
   fprintf('------------------> Extremos del Intervalo\n');
   fprintf('---------------------> g(%i) = ', a);
   disp(double(subs(g,x,a)));
   fprintf('---------------------> g(%i) = ', b);
   disp(double(subs(g,x,b)));
   fprintf('------------------> ?Hay Puntos Estacionarios en g(x)? ');
   if(length(abs_gr)>0)
   disp(' --> YES')
   for i=1:length(abs_gr)
   fprintf('----------------------> Punto Estacionario %i : |g(r%i)| = ',i,i);  
   disp(double(abs_gr(i)))
   end
   else
   disp(' --> NO')
   end
   fprintf('------------------> ?Hay puntos No Diferenciables en g(x)? ');
   disp(' --> NO')
   fprintf('\n');
   fprintf('-------------> h(x) = ');
   disp(collect(h));
   fprintf('------------------> Extremos del Intervalo\n');
   fprintf('---------------------> h(%i) = ', a);
   disp(double(subs(h,x,a)));
   fprintf('---------------------> h(%i) = ', b);
   disp(double(subs(h,x,b)));
   fprintf('------------------> ?Hay Puntos Estacionarios en h(x)? ');
   if(length(abs_hr)>0)
   disp(' --> YES')
   for i=1:length(abs_hr)
   fprintf('----------------------> Punto Estacionario %i : |h(r%i)| = ',i,i);  
   disp(double(abs_hr(i)))
   end
   else
   disp(' --> NO')
   end
   fprintf('------------------> ?Hay puntos No Diferenciables en h(x)? ');
   disp(' --> NO')
   fprintf('\n');
   fprintf('---> COTA ERROR = ');
   fprintf('\n');
   fprintf('------> |E(x)| =< ');
   disp(double(cotaError));
   fprintf('FIN-----------------------------------------------\n');
   
   
   
   
   



