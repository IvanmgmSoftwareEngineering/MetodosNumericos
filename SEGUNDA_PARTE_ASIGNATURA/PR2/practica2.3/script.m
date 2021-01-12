%% PRACTICA2.3: FADFs para resolver EDPs

%  AUTOR: IVAN MARTIN GOMEZ

%  DESCRIPCION: Resolucion de Problema Parabolico (Orden 2) mediante el uso de FADF's.



%% PROBLEMA_1:

%  Datos: 
%                           |--> EDP:                                    u_t = u_xx(x)
%(Problema de Cauchy)       |--> Intervalo donde esta definada la EDO:   
%(tipo:Condicion Contorno)  |                                            (0,L) en x
%                           |                                            (0,T) en t                          
%                           |--> Condicion Frontera 1:                   u(0,t)=0, 1<t<T           
%                           |--> Condicion Frontera 2:                   u(L,t)=0, 1<t<T   
%                           |--> Condicion Inicial:                      u(x,0)=            
%                           |                                               2x   (si 0   <= x <= L/2)   
%                           |                                               2-2x (si 1/2 <  x <= L) 
%                            --> Paso discretizacion:    
%                                                                        h   en x
%                                                                        tau en t 
                      

clear all;
close all;
clc;

%Los DATOS ENTRADA para que este problema trabaje son: 
% L, T, h, tau, u1t, uLt, ux0_1, ux0_2 
%----------------------------------------------------------------------------------------------------------
% %
                                        
% Discretizamos Intervalo donde esta definida la EDO utilizando paso h

    L=1 ;                            %<<<<----- DATO ENTRADA
    T=1;                             %<<<<----- DATO ENTRADA
    h=0.5;                           %<<<<----- DATO ENTRADA
    tau=0.5;                         %<<<<----- DATO ENTRADA
    xn=0:h:L;
    tm=0:tau:T;
    n=length(xn);
    m=length(tm);
    dim=m*n;

% Definimos Condiciones de Frontera

    u1t=0 ;                           %<<<<----- DATO ENTRADA
    uLt=0 ;                           %<<<<----- DATO ENTRADA
 
% Definimos Condiciones Iniciales
    syms x
    ux0_1=2*x ;                       %<<<<----- DATO ENTRADA
    ux0_2=2-2*x ;                     %<<<<----- DATO ENTRADA
    
% Utilizamos FADF Centrada para aproximar la segunda deriavada parcial con respecto a x
% y la FADF Progresiva para aproximar la primera derivada parcial con respecto a t,
% agrupamos terminos y renombramos para obtener: 
% -ru(xi-1,tj)+(2r-1)u(xi,tj)-ru(xi+1,tj)+u(xi,tj+1)=0, valida para 1<i<n y 0<j<m

    r=tau/h^2;
    
    [X,Y]=meshgrid(xn,tm);
    solucion=zeros(n,m);
    
    for i=1:n
        for j=1:m
            if(Y(j,i)==0 )%Condicion Inicial
                if(X(j,i)<0.5)
                    solucion(i,j)=subs(ux0_1,x,xn(i));
                else
                    solucion(i,j)=subs(ux0_2,x,xn(i)); 
                end
            else%Condicion de contorno
                if(X(j,i)==0)
                    solucion(i,j)=u1t;
                elseif (X(j,i)==L)
                    solucion(i,j)=uLt;
                else
                    solucion(i,j)=0;
                end
            end
            
        end
    end
 
    for i=1:n
        for j=1:m
             if((1<i)&&(i<n)&&(1<j)&&(j<=m))
                 solucion(i,j)=r*(solucion(i-1,j-1)+solucion(i+1,j-1))-solucion(i,j-1)*(2*r-1);
             end
        end
    end
    


% Representamos Graficamente: la Aproximacion obtenida
               %Montamos la solucion aproximada en forma de matriz para
               %representarla en 3D
               Soporte_Discreto=zeros(n,m);
               X_1=transpose(X);
               Y_1=transpose(Y);
               format long;
               figure(1);
               % Dibujamos Solucion Aproximada
               surf(X_1,Y_1,Soporte_Discreto); 
               grid on;
               hold on;
               stem3(X_1,Y_1,Soporte_Discreto,'filled');
               grid on;
               hold on;
               stem3(X_1,Y_1,solucion,'filled');
               title(['Solucion Aproximada ','r= ',num2str(r),' (h= ',num2str(h),', tau= ',num2str(tau),')' ]);
               xlabel('x');
               ylabel('t');
               zlabel('u(x,t)');
               axis([0 1 0 1 -4 10]);               
               legend('Plano xt','Soporte Discreto Bidimensional','Solucion Aproximada'); 
               lgd = legend;
               lgd.FontSize = 14;
               grid on;
               hold on;


%Limpiamos Workspace
clear  lgd u1 uL x  xn dim m Soporte_Discreto tm X_1 X_2 Y_1 Y X tau n L j i h T u1t uLt ux0_1 ux0_2

