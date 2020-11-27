%% EjerciciosPropuestos:  RAICES NUMERICAS
%  AUTOR: IVAN MARTIN GOMEZ

%% 2) 
clear all;
close all;
clc;
      % Datos
        syms x;
        f=x^2-3;
        y= @(x) x^2-3;
        epsilon=1/2;
        a=0;
        b=3;
        x0=1;
      
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
        
%% 3) 
clear all;
close all;
clc;
      % Datos
        syms x;
        f=2*x+1;
        y= @(x) 2*x+1;
        epsilon=10^-3;
        a=0.5;
        b=1;
        x0_1=1;
        x0_2=3;
      
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
        %zero_ref=fzero(y,[a b])
      % Biseccion
        %zero_biseccion=biseccion(f,[a b],epsilon)
        
      % Newton
        zero_newton_1=newton(f,x0_1,epsilon)
        zero_newton_3=newton(f,x0_2,epsilon)
        
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
