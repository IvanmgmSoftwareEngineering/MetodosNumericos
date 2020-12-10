%% PRACTICA2.2: 

%  AUTOR: IVAN MARTIN GOMEZ

%  DESCRIPCION: Resolucion de Problema de Cauchy (Orden 2) de tipo de Condici?n de
%               Frontera.



%% PROBLEMA_1:

%  Datos: 
%                     |--> EDO:                                    Pu''(x)+Qu'(x)+Ru(x)=f(x)
%(Problema de Cauchy) |--> Intervalo donde esta definada la EDO:   (0,L)
%                     |--> Condicion Frontera 1:                   u(0)=u1            
%                     |--> Condicion Frontera 2:                   u(L)=uL            

%                      --> Paso discretizacion:                    h=
%                      --> Solucion Exacta:       

clear all;
close all;
clc;

%Los datos de entrada para que este problema trabaje son: P, Q, R, u0, uL, f(x), h y L.
% Definimos variables s?mbolicas 
    %syms x;
    %f(x)= ; %<<<<----- DATO ENTRADA
% Discretizamos Intervalo donde esta definida la EDO utilizando paso h

%   L= ;     %<<<<----- DATO ENTRADA
%   h= ;     %<<<<----- DATO ENTRADA
%   xn=0:h:L;
%   n=length(xn);

% Definimos Condiciones de Frontera

%   u1= ;    %<<<<----- DATO ENTRADA
%   uL= ;    %<<<<----- DATO ENTRADA
%   
% Utilizamos FADF's para aproximar la segunda y la primera derivada,
% agrupamos terminos y renombramos para obtener: 
% alpha(u(xi-1))+beta(u(xi))+gamma(u(xi+1))=fi, valida para
% xn(2),...,x(n-1)


%   P= ;     %<<<<----- DATO ENTRADA
%   Q= ;     %<<<<----- DATO ENTRADA
%   R= ;     %<<<<----- DATO ENTRADA
%   alpha=P/h^2 - Q/(2*h);
%   beta=R- 2*P/h^2
%   gamma=P/h^2 + Q/(2*h)


% Construyo Sistema de Ecuciones Lineales AX=b

    %Contruyo Matriz A:
    A=zeros(n,n);
    A(1,1)= 1;
    A(n,n)= 1;
    for i=2:n-1
        for j=2:n-1
            A(i,j-1)=alpha;
            A(i,j)=beta;
            A(i,j+1)=gamma;    
        end
        
    end
    %Contruyo Matriz b:
    b=zeros(n,1);
    b(1)=u0;
    b(n)=uL;
    for i=2:n-1
        b(i)=subs(f,x,xn(i));
    end
    
% Resolvemos el Sistema de Ecuaciones Lineales AX=b utilizando la misma implementaci?n del M?todo de
% Jacobi utilizada en la PR1.
       x_0=zeros(1,n);% Dato entrada (OBLIGATORIO): esta es la aproximacion inicial 'mala' con la que empieza a trabajar el Metodo de Jacobi
       delta = 10^4;% Dato entrada (OBLIGATORIO): determina el maximo error que queremos cometer en la Solucion Aproximada que arroja el m?todo.
       %x_sol_in= ; % Dato entrada (OPCIONAL) Solucion exacta en caso de que nos la proporcionen
       x_out(1,:)=x_0; %Guardo la aproximacion Inicial recibida como argumento en la primera fila de la Matriz x_out(k filas x n columnas)
       contador=2; % Empieza en 2 por la caracteristica interna de Matlab de empezar a indexar vectores por el 1 y no por el 0
       error_2=x_0;% %Guardo la aproximacion Inicial recibida como argumento en la primera fila de la Matriz error_2(k filas x n columnas). Recordar que este es el error obtenido de comparar el valor de la aproximacion en la iteracion actual con el valor de la aproximacion de la iteracion anterior.
       error_1=x_0;% %Guardo la aproximacion Inicial recibida como argumento en la primera fila de la Matriz error_1(k filas x n columnas). Recordar que este es el error obtenido de comparar el valor de la aproximacion en la iteracion actual con el valor de la solucion exacta.
       continua=1;
       while(continua)
        continua_aux=0;
        for i=1:N
            suma=0;
            for j=1:N
                if(i~=j)
                    suma=suma+A(i,j)*x_out(contador-1,j);
                end
            end
            x_out(contador,i)=(b(i)-suma)/A(i,i);
        end
        %Calculamos los errores
        for i=1:N
            %error_1(contador,i)=abs(x_out(contador,i)-x_sol_in(i));
            error_2(contador,i)=abs(x_out(contador,i)-x_out(contador-1,i));
        end
        %Comprobamos condicion de Parada
        for i=1:N
           if(error_2(contador,i)>=delta_in)
              continua_aux =1;
           end
        end
        if(continua_aux==0)
            continua=0;
        end
        contador=contador+1;
        
       end
       Numero_Iteraciones_jacobi=contador-2;
       Numero_Iteraciones_jacobi;
       X=x_out;
       %e1=error_1;
       e2=error_2; 
       
% Presentamos Errores: 