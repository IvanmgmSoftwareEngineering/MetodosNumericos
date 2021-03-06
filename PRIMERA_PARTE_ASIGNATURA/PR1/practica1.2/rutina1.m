%% rutina1: C?lculos

% TITULO: C?lculos
% AUTOR: IVAN MARTIN GOMEZ

% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: X1      --> Vector con m puntos equiespaciados para obtener la
%                            Aproximacion de las Formulas Compuestas (m=m_rec en el caso de la
%                            Formula del Rectangulo Compuesta, m=m_trap en el caso de la Formula del
%                            Trapecio Compuesto y m=m_simp en el caso de la Formula de Simposon 1/3
%                            Compuesta). Lo toma del Workspace
%   ARGUMENTO 2: a       --> Extremo Inferior Intervalo Cerrado. Lo toma del
%                            Workspace
%   ARGUMENTO 3: b       --> Extremo Superior Intervalo Cerrado. Lo toma del
%                            Workspace
%   ARGUMENTO 4: m_rec   --> Numero de puntos para Formula Rectangulo
%                            Compuesta. Se toma del WorkSpace
%   ARGUMENTO 5: m_trap  --> Numero de puntos para Formula Trapecio
%                            Compuesta. Se toma del WorkSpace
%   ARGUMENTO 6: m_simp  --> Numero de puntos para Formula Simpson 1/3
%                            Compuesta. Se toma del WorkSpace
%
% ERRORES:
%   ERROR 1: Se comprueba que a < b, en caso contrario se devuelve error.
%    
% DESCRIPCION: Esta rutina1.m, se encarga de calcular el valor de las
%              Aproximaciones de la Integral a traves de diferentes metodos de
%              Aproximacion (Formulas del Rectangulo, Formulas del Trapecio y Formulas
%              Simpson 1/3)
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------
%Control de Errores en Argumentos de Entrada

    %ERROR 1: Se comprueba que a < b, en caso contrario se devuelve error.
        if (a >= b)
            error ('El Extremo inferior del Intervalo debe ser mayor que el Extremo Superior del Intervalo')
        end

%FIN Control de Errores en Argumentos de Entrada
%-------------------------------------------------------
%-------------------------------------------------------
%Empieza la funcionalidad de la Rutina

    
    
        
    %Seleccionamos los puntos del Intervalo Cerrado [a,b] que seran
    %utilizados en cada una de la Aproximaciones
        %-- Puntos Discretos para Rectangulo
        if(formula_Rectangulo_Izquierdo==1)
            %-- 1 punto por definicion
            X=a;
        elseif(formula_Rectangulo_Derecho==1)
            %-- 1 punto por definicion
            X=b;
        elseif (formula_Rectangulo_Medio==1)
            %-- 1 punto por definicion
            X=(a+b)/2;
        elseif (formula_Rectangulo_Compuesta_Izquierda_delta_cte==1)
            %-- 100 puntos equiespaciados 
            X=X1;
        elseif (formula_Rectangulo_Compuesta_Derecha_delta_cte==1)
            %-- 100 puntos equiespaciados 
            X=X1;
        elseif (formula_Rectangulo_Compuesta_Medio_delta_cte==1)
            %-- 100 puntos equiespaciados 
            X=X1;
        %-- Puntos Discretos para Trapecio
        elseif (formula_Trapecio==1)
            %-- 2 puntos por definicion
            X=[a b];
        elseif (formula_Trapecio_Compuesta_delta_cte==1)
            %-- 100 puntos equiespaciados 
            X=X1;
        elseif (funcion_trapz_2==1)
            %-- 2 puntos libre eleccion
            X=[a b];
        elseif (funcion_trapz_100==1)
            %-- 100 puntos equiespaciados
            X=linspace(a,b,100);
        elseif (funcion_trapz_1000==1)
            %-- 1000 puntos equiespaciados
            X=linspace(a,b,1000);
        elseif (funcion_trapz_10000==1)
            %-- 10000 puntos equiespaciados
            X=linspace(a,b,10000);
        %-- Puntos Discretos para Simpson 1/3
        elseif (formula_Simpson==1)
            %-- 3 puntos por definicion
            X=[a (a+b)/2  b];
        elseif (formula_Simpson_Compuesta_delta_cte==1)
            %-- 100 puntos libre eleccion
            X=X1_simp;
        end

    %Obtenemos las Aproximaciones de las Integrales
        %-- Formulas Rectangulo
        if(formula_Rectangulo_Izquierdo==1)
            %-- Formula Rectangulo Izquierdo
            I_rec(1) = subs(f,x,X(1))*(b-a);
        elseif(formula_Rectangulo_Derecho==1)
            %-- Formula Rectangulo Derecho
            I_rec(2) = subs(f,x,X(1))*(b-a);
        elseif (formula_Rectangulo_Medio==1)
            %-- Formula Rectangulo Medio
            I_rec(3) = subs(f,x,X(1))*(b-a);
        elseif (formula_Rectangulo_Compuesta_Izquierda_delta_cte==1)
            %-- Formula Rectangulo Compuesta Izquierda delta=cte 100 puntos
            deltaX=X(2)-X(1);
            I_rec(4)=0;
            for i=1:m_rec-1              
                I_rec(4) = I_rec(4) + (rec_F(i)*(deltaX));
            end  
        elseif (formula_Rectangulo_Compuesta_Derecha_delta_cte==1)
            %-- Formula Rectangulo Compuesta Derecha delta=cte 100 puntos
            deltaX=X(2)-X(1);
            I_rec(5)=0;
            for i=1:m_rec-1              
                I_rec(5) = I_rec(5) + (rec_F(i+1)*(deltaX));
            end 
        elseif (formula_Rectangulo_Compuesta_Medio_delta_cte==1)
            %-- Formula Rectangulo Compuesta Medio delta=cte 100 puntos
            deltaX=X(2)-X(1);
            I_rec(6)=0;
            for i=2:m_rec              
                I_rec(6) = I_rec(6) + (subs(f,x,(X(i-1)+X(i))/2)*(deltaX));
            end 
        %-- Formulas Trapecio
        elseif (formula_Trapecio==1)
            %-- Formula Trapecio
            I_trap(1)=(max([subs(f,x,a) subs(f,x,b)])-min([subs(f,x,a) subs(f,x,b)]))*(b-a)/2 + min([subs(f,x,a) subs(f,x,b)])*(b-a);
        elseif (formula_Trapecio_Compuesta_delta_cte==1)
            %-- Formula Trapecio Compuesta delta=cte 100 puntos
            deltaX=X(2)-X(1);
            I_trap(2)=0;
            for i=1:m_trap-1  
                I_trap(2) = I_trap(2) + (trap_F(i)+trap_F(i+1))*1/2*deltaX;
            end
        elseif (funcion_trapz_2==1)
            %-- Funcion trapz() delta=cte 2 puntos
            I_trap(3)=trapz([a b],[subs(f,x,a) subs(f,x,b)]);
        elseif (funcion_trapz_100==1)
            %-- Funcion trapz() delta=cte 100 puntos
            for i=1:100
                F_aux(i)=subs(f,x,X(i));
            end
            I_trap(4)=trapz(X,F_aux);
        elseif (funcion_trapz_1000==1)
            %-- Funcion trapz() delta=cte 1.000 puntos
            for i=1:1000
                F_aux(i)=subs(f,x,X(i));
            end
            I_trap(5)=trapz(X,F_aux);
        elseif (funcion_trapz_10000==1)
            %-- Funcion trapz() delta=cte 10.000 puntos
            for i=1:10000
                F_aux(i)=subs(f,x,X(i));
            end
            I_trap(6)=trapz(X,F_aux);
        %-- Formulas Simpson 1/3
        elseif (formula_Simpson==1)
            %-- Formula Simpson 1/3
            I_simp(1)=1/6*(b-a)*(subs(f,x,a)+4*subs(f,x,(a+b)/2)+subs(f,x,b));
        elseif (formula_Simpson_Compuesta_delta_cte==1)
            %-- Formula Simpson 1/3 Compuesta delta=cte 100 puntos
            deltaX=X(2)-X(1);
            I_simp(2)=0;
            for i=2:m_simp-1                
                I_simp(2)=I_simp(2) + 1/3*deltaX*(simp_F(i-1)+4*simp_F(i)+simp_F(i+1));
            end
        end
    
 
%FIN Rutina