%% Script3: PARTE 2- PRACTICA1.3: RAICES NUMERICAS
%  AUTOR: IVAN MARTIN GOMEZ

%% 2.1) 
clear all;
close all;
clc;
      % Datos
        syms x;
        f=sin(x)-0.3*exp(x);
        y= @(x) sin(x)-0.3*exp(x);
        epsilon=10^-2;
        a=1;
        b=4;
        x0=4;
      
      % Metodo Grafico  
%          X=linspace(0,b,1000);
%          F=zeros(1,1000);
%          for i=1:1000
%             F(i)=subs(f,x,X(i));
%          end
%          figure(1);
%          plot(X,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%          title('f(x)');
%          xlabel('x');
%          axis([0 b -20 10]);
%          grid on;
%          hold on;
        
      % Obtenemos valor de referecnia mediante fzero()
        zero_ref=fzero(y,[a b])
      % Biseccion
        zero_biseccion=biseccion(f,[a b],epsilon)
        
      % Biseccion
        zero_newton=newton(f,x0,epsilon)
        
%% 2.2) 
clear all;
close all;
clc;
      % Datos
        syms x;
        f=sqrt(x) - cos(x);
        y= @(x) sqrt(x) - cos(x);
        epsilon=10^-3;
        a=0.5;
        b=1;
        x0=0.5;
      
      % Metodo Grafico  
%          X=linspace(0,b,1000);
%          F=zeros(1,1000);
%          for i=1:1000
%             F(i)=subs(f,x,X(i));
%          end
%          figure(1);
%          plot(X,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%          title('f(x)');
%          xlabel('x');
%          axis([0 b -20 10]);
%          grid on;
%          hold on;
%         
      % Obtenemos valor de referecnia mediante fzero()
        zero_ref=fzero(y,[a b])
      % Biseccion
        zero_biseccion=biseccion(f,[a b],epsilon)
        
      % Biseccion
        zero_newton=newton(f,x0,epsilon)
        
%% 2.3) 
clear all;
close all;
clc;
      % Datos
        syms x;
        f=2*x^3-11.7*x^2+17.7*x -5;
        y= @(x) 2*x^3-11.7*x^2+17.7*x -5;
        epsilon_biseccion=10^-3;
        epsilon_newton=10^-10;
        a=3;
        b=5;
        x0=4;
      
      % Metodo Grafico  
%          X=linspace(a,b,1000);
%          F=zeros(1,1000);
%          for i=1:1000
%             F(i)=subs(f,x,X(i));
%          end
%          figure(1);
%          plot(X,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%          title('f(x)');
%          xlabel('x');
%          axis([a b -20 10]);
%          grid on;
%          hold on;
%         
      % Obtenemos valor de referecnia mediante fzero()
        zero_ref=fzero(y,[a b])
      % Biseccion
        zero_biseccion=biseccion(f,[a b],epsilon_biseccion)
        
      % Biseccion
        zero_newton=newton(f,x0,epsilon_newton)
         
%% 2.4) 
clear all;
close all;
clc;
      % Datos
        syms x;
        f=exp(x/2)+5*x-5;
        y= @(x) exp(x/2)+5*x-5;
        epsilon=10^-3;
        a=0;
        b=4;
        x0=1;
      
      % Metodo Grafico  
%          X=linspace(a,b,1000);
%          F=zeros(1,1000);
%          for i=1:1000
%             F(i)=subs(f,x,X(i));
%          end
%          figure(1);
%          plot(X,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%          title('f(x)');
%          xlabel('x');
%          axis([a b -20 30]);
%          grid on;
%          hold on;
%         
      % Obtenemos valor de referecnia mediante fzero()
        zero_ref=fzero(y,[a b])
      % Biseccion
        zero_biseccion=biseccion(f,[a b],epsilon)
        
      % Biseccion
        zero_newton=newton(f,x0,epsilon)
        
%% 2.5) 
clear all;
close all;
clc;
      % Datos
        syms x;
        f=x^2 + x + 3;
        df=diff(f);
        y= @(x) x^2 + x + 3;
        epsilon=10^-1;
        a=-2;
        b=2;
        x0=1;
      
      % Metodo Grafico  
%          X=linspace(a,b,1000);
%          F=zeros(1,1000);
%          dF=zeros(1,1000);
%          for i=1:1000
%             F(i)=subs(f,x,X(i));
%             dF(i)=subs(df,x,X(i));
%          end
%          figure(1);
%          plot(X,F,'MarkerEdgeColor',[0.1 0.1 0.1],'LineWidth',2);
%          title('f(x)');
%          xlabel('x');
%          axis([a b 0 10]);
%          grid on;
%          hold on;
%          figure(2);
%          plot(X,dF,'MarkerEdgeColor',[0.2 0.2 0.2],'LineWidth',2);
%          title('df(x)');
%          xlabel('x');
%          axis([a b -5 5]);
%          grid on;
%          hold on;

      % Biseccion
        tStart1=tic();
        zero_biseccion=biseccion(df,[a b],epsilon)
        duracion_ejecucion_biseccion=toc(tStart1) 
      % Newton-Raphson
        tStart2=tic();
        zero_newton=newton(df,x0,epsilon)
        duracion_ejecucion_newton=toc(tStart2)
      % Secante
        tStart3=tic();
        zero_secante=secante(df,[a b],epsilon)
        duracion_ejecucion_secante=toc(tStart3)
      
      
      %Valor funcion particularizada
        f_min=subs(f,x,zero_newton)
      
        
        
        
        
        

    

