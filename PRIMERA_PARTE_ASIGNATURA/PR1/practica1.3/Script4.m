%% Script4: PARTE 3- PRACTICA1.3: RAICES NUMERICAS DE FUNCIONES NO LINEALES
%                                 Convergencia -- Newton-Raphson
%  AUTOR: IVAN MARTIN GOMEZ


clear all;
close all;
clc;
format long;
      % Datos
        syms x;
        f=x^3 - 3*x +2;
        y= @(x) x^3 - 3*x +2;
        epsilon=10^-6;
        x_00=-3; % valor inicial donde empieza el m?todo de Newton-Raphson
        x0=-2; % valor de referencia con el que comparamos 
        
       % Empieza el programa
       
        % Creamos la tabla: esta tabla tiene la misma forma que la tablar
        % que se nos pide rellenar en el enunciado de la practica
            TABLA_vacia=zeros(7,6);
        % Llamamos a la funicion newton.m para aplicar el Metodo de
        % Newton-Raphson y rellenar las dos primeras columnas de la tabla
            [zero,TABLA]=newton_adaptada(f,x_00,epsilon,TABLA_vacia);
            TABLA(1,1)=0;
            TABLA(1,2)=x_00;
        % Rellenamos el resto de columnas de la TABLA
            % Columna 3
                for i=1:length(TABLA(:,1))
                    TABLA(i,3)=TABLA(i,2)-x0;
                end
            % Columna 4 (k=1)
                for i=1:length(TABLA(:,1))-1
                    TABLA(i,4)=abs(TABLA(i+1,3))/(abs(TABLA(i,3)))^1;
                end
            % Columna 5 (k=2)
                for i=1:length(TABLA(:,1))-1
                    TABLA(i,5)=abs(TABLA(i+1,3))/(abs(TABLA(i,3)))^2;
                end
            % Columna 6 (k=3)
                for i=1:length(TABLA(:,1))-1
                    TABLA(i,6)=abs(TABLA(i+1,3))/(abs(TABLA(i,3)))^3;
                end
                
          % Mostramos resultados por ventana de comandos
          
          fprintf('|-------------------------------------------------------------------------------------------------------------------------------|\n');
          fprintf('|                                                RESULTADOS                                                                     |\n');
          fprintf('|------|----------------------|---------------------|--------------------------|-----------------------|------------------------|\n');
          fprintf('|  n   |     x_on             |      En             |     k=1                  |      k=2              |      k=3               |\n');
          fprintf('|------|----------------------|---------------------|--------------------------|-----------------------|------------------------|\n');
          for i=1:length(TABLA(:,1))
              if(i==1)
          fprintf('|  %d   |      %d              |      %d             |      %d        |      %d     |      %d      |\n',TABLA(i,1),TABLA(i,2),TABLA(i,3),TABLA(i,4),TABLA(i,5),TABLA(i,6));       
              elseif(i==7)
          fprintf('|  %d   |      %d              |      %d              |      %d                   |      %d                |      %d                 |\n',TABLA(i,1),TABLA(i,2),TABLA(i,3),TABLA(i,4),TABLA(i,5),TABLA(i,6));       
              elseif(i==6)
          fprintf('|  %d   |      %d   |      %d  |      %d                   |      %d                |      %d                 |\n',TABLA(i,1),TABLA(i,2),TABLA(i,3),TABLA(i,4),TABLA(i,5),TABLA(i,6));   
              else
          fprintf('|  %d   |      %d   |      %d  |      %d        |      %d     |      %d      |\n',TABLA(i,1),TABLA(i,2),TABLA(i,3),TABLA(i,4),TABLA(i,5),TABLA(i,6));       
              end
          end
          fprintf('|------|----------------------|---------------------|--------------------------|-----------------------|------------------------|\n');
          fprintf('|-------------------------------------------------------------------------------------------------------------------------------|\n');
