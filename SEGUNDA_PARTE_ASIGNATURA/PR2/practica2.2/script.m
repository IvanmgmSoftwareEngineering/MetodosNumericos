%% PRACTICA2.2: 

%  AUTOR: IVAN MARTIN GOMEZ

%  DESCRIPCION: Resolucion de Problema unidimensional de Cauchy (Orden 2) de tipo de Condicion de
%               Frontera mediante el uso de FADF's.



%% PROBLEMA_1:

%  Datos: 
%                           |--> EDO:                                    Pu''(x)+Qu'(x)+Ru(x)=f(x)
%(Problema de Cauchy)       |--> Intervalo donde esta definada la EDO:   (0,L)
%(tipo:Condicion Contorno)  |--> Condicion Frontera 1:                   u(0)=u1            
%                           |--> Condicion Frontera 2:                   u(L)=uL            

%                            --> Paso discretizacion:                    h
%                            --> Solucion Exacta:                        

clear all;
close all;
clc;

%Los DATOS ENTRADA para que este problema trabaje son: 
%Tolerancia_Jacobi, f(x), u_exacta(x), L, h u1, uL, P, Q, R.
%----------------------------------------------------------------------------------------------------------
% Definimos Tolerancia para Jacobi
    Tolerancia_Jacobi=10;            %<<<<----- DATO ENTRADA 
% Definimos variables simbolicas 
    syms x;
    f=0;                                %<<<<----- DATO ENTRADA
    u_exacta(x)= (exp(x)-1)/(exp(1)-1); %<<<<----- DATO ENTRADA
% Discretizamos Intervalo donde esta definida la EDO utilizando paso h

    L=1 ;                               %<<<<----- DATO ENTRADA
    h=0.5 ;                             %<<<<----- DATO ENTRADA
    xn=0:h:L;
    n=length(xn);

% Definimos Condiciones de Frontera

    u1=0 ;                              %<<<<----- DATO ENTRADA
    uL=1 ;                              %<<<<----- DATO ENTRADA
%   
% Utilizamos FADF's para aproximar la segunda y la primera derivada,
% agrupamos terminos y renombramos para obtener: 
% alpha(u(xi-1))+beta(u(xi))+gamma(u(xi+1))=fi, valida para
% xn(2),...,x(n-1)

    P=-1 ;                              %<<<<----- DATO ENTRADA
    Q=1 ;                               %<<<<----- DATO ENTRADA
    R=0 ;                               %<<<<----- DATO ENTRADA
    alpha=P/h^2 - Q/(2*h);
    beta=R- 2*P/h^2;
    gamma=P/h^2 + Q/(2*h);


% Construyo Sistema de Ecuciones Lineales AX=b

    %Contruyo Matriz A:
    A=zeros(n,n);
    A(1,1)= 1;
    A(n,n)= 1;
    for i=2:n-1
            A(i,i-1)=alpha;
            A(i,i)=beta;
            A(i,i+1)=gamma;            
    end
    %Contruyo Matriz b:
    b=zeros(n,1);
    b(1)=u1;
    b(n)=uL;
    for i=2:n-1
        b(i)=subs(f,x,xn(i));
    end
    
% Resolvemos el Sistema de Ecuaciones Lineales AX=b utilizando la misma implementacion del Metodo de
% Jacobi utilizada en la PR1.
       x_0=zeros(1,n);% Dato entrada (OBLIGATORIO): esta es la aproximacion inicial 'mala' con la que empieza a trabajar el Metodo de Jacobi
       delta = Tolerancia_Jacobi^-1;% Dato entrada (OBLIGATORIO): determina el maximo error que queremos cometer en la Solucion Aproximada que arroja el m?todo.
       x_out(1,:)=x_0; %Guardo la aproximacion Inicial recibida como argumento en la primera fila de la Matriz x_out(k filas x n columnas)
       contador=2; % Empieza en 2 por la caracteristica interna de Matlab de empezar a indexar vectores por el 1 y no por el 0
       error_2(1,:)=x_0;% %Guardo la aproximacion Inicial recibida como argumento en la primera fila de la Matriz error_2(k filas x n columnas). Recordar que este es el error obtenido de comparar el valor de la aproximacion en la iteracion actual con el valor de la aproximacion de la iteracion anterior.
       continua=1;
       while(continua)
        continua_aux=0;
        for i=1:n
            suma=0;
            for j=1:n
                if(i~=j)
                    suma=suma+A(i,j)*x_out(contador-1,j);
                end
            end
            x_out(contador,i)=(b(i)-suma)/A(i,i);
        end
        %Calculamos los errores
        for i=1:n
            error_2(contador,i)=abs(x_out(contador,i)-x_out(contador-1,i));
        end
        %Comprobamos condicion de Parada
        for i=1:n
           if(error_2(contador,i)>=delta)
              continua_aux =1;
           end
        end
        if(continua_aux==0)
            continua=0;
        end
        contador=contador+1;
        
       end
       Numero_Iteraciones_jacobi=contador-2;
       X_jacobi=x_out;
       error_jacobi=error_2; 
       solucion_Aproximada=X_jacobi(Numero_Iteraciones_jacobi+1,:);
       
% Obtenemos Solucion Exacta: 
       for i=1:n
        solucion_Exacta(i)=subs(u_exacta,x,xn(i));
       end
       
% Obtenemos Error realmente cometido Relativo:       
       for i=1:n
           if(solucion_Exacta(i)~=0)%Si la Solucion Exacta es distinta de cero, calculamos el Error Relativo
            error_relativo(i)=abs(solucion_Exacta(i)-solucion_Aproximada(i))/solucion_Exacta(i);
           else %Si la Solucion Exacta es igual a cero, calculamos el Error Relativo adaptado
               if(solucion_Aproximada(i)~=0)%Si la Solucion Aproximada es distinta a cero, calculamos el Error Relativo adaptado
                    error_relativo(i)=abs(solucion_Exacta(i)-solucion_Aproximada(i))/solucion_Aproximada(i);
               else%Si la Solucion Aproximada es igual a cero, calculamos el Error Absoluto
                    error_relativo(i)=abs(solucion_Exacta(i)-solucion_Aproximada(i));
               end
           end
       end
% Representamos Graficamente: la Aproximacion obtenida y la Solucion Exacta
               format long;
               n0=100;
               X0=linspace(0,L,n0);
               F=zeros(1,n0);
               for i=1:n0
                y_exacta(i)=subs(u_exacta,x,X0(i));
               end
               figure(1);
               % Dibujamos Solucion Excata
               subplot(1,2,1);
               plot(X0,y_exacta,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title(['Solucion Exacta VS Solucion Aproximada ','(Paso=',num2str(h),', Iteraciones Jacobi=',num2str(Numero_Iteraciones_jacobi),')']);
               xlabel('x');
               ylabel('u(x)');
               axis([0 L 0 1]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(xn,solucion_Aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(xn,solucion_Aproximada,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada'); 
               lgd = legend;
               lgd.FontSize = 14;
               grid on;
               hold on;
               % Dibujamos Error realmente cometido Relativo
               subplot(1,2,2);
               scatter(xn,error_relativo,'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               title(['Error realmente cometido Relativo ','(Paso=',num2str(h),', Iteraciones Jacobi=',num2str(Numero_Iteraciones_jacobi),')']);
               xlabel('x');
               ylabel('e(x)');
               axis([0 L 0 0.01]);
               grid on;
               hold on;
               
%Estudio de la Convergencia
            Numero_Estudios=5;
            A_convergencia=zeros(129,129,Numero_Estudios);
            b_convergencia=zeros(129,Numero_Estudios);
            paso=h;
            k=1;
            while k<=Numero_Estudios              
                xn=0:paso:L; % Discretizamos
                n=length(xn);
                
                alpha=P/paso^2 - Q/(2*paso);
                beta=R- 2*P/paso^2;
                gamma=P/paso^2 + Q/(2*paso);
                % Construyo Sistema de Ecuciones Lineales AX=b
                 %Contruyo Matriz A:
                 A_convergencia(1,1,k)= 1;
                 A_convergencia(n,n,k)= 1;
                 for i=2:n-1
                        A_convergencia(i,i-1,k)=alpha;
                        A_convergencia(i,i,k)=beta;
                        A_convergencia(i,i+1,k)=gamma;       
                 end
                %Contruyo Matriz b:
                b_convergencia(1,k)=u1;
                b_convergencia(n,k)=uL;
                for i=2:n-1
                    b_convergencia(i,k)=subs(f,x,xn(i));
                end
                
                % Resolvemos el Sistema de Ecuaciones Lineales AX=b utilizando la misma implementacion del Metodo de
                % Jacobi utilizada en la PR1.
                clear x_out error_2 x_0
                x_0=zeros(1,n);% Dato entrada (OBLIGATORIO): esta es la aproximacion inicial 'mala' con la que empieza a trabajar el Metodo de Jacobi
                delta = Tolerancia_Jacobi^-k+1;% Dato entrada (OBLIGATORIO): determina el maximo error que queremos cometer en la Solucion Aproximada que arroja el m?todo.
                x_out(1,:)=x_0; %Guardo la aproximacion Inicial recibida como argumento en la primera fila de la Matriz x_out(k filas x n columnas)
                contador=2; % Empieza en 2 por la caracteristica interna de Matlab de empezar a indexar vectores por el 1 y no por el 0
                error_2(1,:)=x_0;% %Guardo la aproximacion Inicial recibida como argumento en la primera fila de la Matriz error_2(k filas x n columnas). Recordar que este es el error obtenido de comparar el valor de la aproximacion en la iteracion actual con el valor de la aproximacion de la iteracion anterior.
                continua=1;
                while(continua)
                    continua_aux=0;
                    for i=1:n
                        suma=0;
                        for j=1:n
                            if(i~=j)
                                suma=suma+A_convergencia(i,j,k)*x_out(contador-1,j);
                            end
                        end
                        x_out(contador,i)=(b_convergencia(i,k)-suma)/A_convergencia(i,i,k);
                    end
                    %Calculamos los errores
                    for i=1:n
                        error_2(contador,i)=abs(x_out(contador,i)-x_out(contador-1,i));
                    end
                    %Comprobamos condicion de Parada
                    for i=1:n
                        if(error_2(contador,i)>=delta)
                            continua_aux =1;
                        end
                    end
                    if(continua_aux==0)
                        continua=0;
                    end
                    contador=contador+1;  
                end
                
                Numero_Iteraciones_jacobi_convergencia(k)=contador-2;
                %X_jacobi_convergencia(:,:,k)=x_out;
                %error_jacobi_convergencia(:,:,k)=error_2; 
                for i=1:n
                    solucion_Aproximada_convergencia(k,i)=x_out(Numero_Iteraciones_jacobi_convergencia(k)+1,i);               
                end
                % Obtenemos Solucion Exacta: 
                for i=1:n
                    solucion_Exacta_convergencia(k,i)=subs(u_exacta,x,xn(i));
                end
       
                % Obtenemos Error realmente cometido Relativo:       
                    for i=1:n
                        if(solucion_Exacta_convergencia(k,i)~=0)%Si la Solucion Exacta es distinta de cero, calculamos el Error Relativo
                            error_relativo_convergencia(k,i)=abs(solucion_Exacta_convergencia(k,i)-solucion_Aproximada_convergencia(k,i))/solucion_Exacta_convergencia(k,i);
                        else %Si la Solucion Exacta es igual a cero, calculamos el Error Relativo adaptado
                            if(solucion_Aproximada_convergencia(k,i)~=0)%Si la Solucion Aproximada es distinta a cero, calculamos el Error Relativo adaptado
                                error_relativo_convergencia(k,i)=abs(solucion_Exacta_convergencia(k,i)-solucion_Aproximada_convergencia(k,i))/solucion_Aproximada_convergencia(k,i);
                            else%Si la Solucion Aproximada es igual a cero, calculamos el Error Absoluto
                                error_relativo_convergencia(k,i)=abs(solucion_Exacta_convergencia(k,i)-solucion_Aproximada_convergencia(k,i));
                            end
                        end
                    end               
                
               % Representamos Graficamente: la Aproximacion obtenida y la Solucion Exacta
               
               format long;
               n0=100;
               X0=linspace(0,L,n0);
               F=zeros(1,n0);
               for i=1:n0
                y_exacta(k,i)=subs(u_exacta,x,X0(i));
               end
               figure(k+1);
               % Dibujamos Solucion Exacta
               
               subplot(1,2,1);
               plot(X0,y_exacta(k,:),'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
               title(['Solucion Exacta VS Solucion Aproximada ','(Paso=',num2str(paso),', Iteraciones Jacobi=',num2str(Numero_Iteraciones_jacobi_convergencia(k)),')']);
               xlabel('x');
               ylabel('u(x)');
               axis([0 L 0 1]);
               grid on;
               hold on;
               % Dibujamos Solucion Aproximada
               plot(xn,solucion_Aproximada_convergencia(k,:),'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2); 
               scatter(xn,solucion_Aproximada_convergencia(k,:),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               legend('Solucion Exacta','Solucion Aproximada'); 
               lgd = legend;
               lgd.FontSize = 14;
               grid on;
               hold on;
               % Dibujamos Error realmente cometido Relativo
               subplot(1,2,2);
               scatter(xn,error_relativo_convergencia(k,:),'MarkerEdgeColor',[0.2 0.2 0.2],'MarkerFaceColor',[0 .2 .2],'LineWidth',2);
               title(['Error realmente cometido Relativo ','(Paso=',num2str(paso),', Iteraciones Jacobi=',num2str(Numero_Iteraciones_jacobi_convergencia(k)),')']);
               xlabel('x');
               ylabel('e(x)');
               axis([0 L 0 0.1]);
               grid on;
               hold on;  
               
             paso=paso/2;
             k=k+1;
            end
            
            



%Limpiamos Workspace
clear contador continua continua_aux u_exacta delta h f n i n0 j L X0 F y_exacta lgd  P Q R suma Tolerancia_Jacobi u1 uL x x_0 x_out xn error_2 error_jacobi k Numero_Estudios paso  ;