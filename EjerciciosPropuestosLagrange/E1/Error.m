%% FUNCION Error: Error cometido por la Aproximacion mediante el Polinomio Interpolador de Lagrange

% TITULO: Error Aproximacion mediante Polinomio Interpolador Lagrange
% AUTOR: IVAN MARTIN GOMEZ
%
% SINTAXIS: e(n,X,f)
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: n         --> Numero Puntos Discretos del Intervalo Cerrado
%   ARGUMENTO 2: X         --> Vector fila con n puntos discretos equiespaciados
%   ARGUMENTO 3: f         --> Funcion que queremos aproximar.
% 
% SALIDAS:       
%   SALIDA 1:    e         --> Expresion del Error cometido.
%   SALIDA 2:    CotaError --> Valor Cota de Error
%                             
%
% ERRORES:
%   ERROR 1: Se comprueba que n >= 2, en caso contrario se devuelve error.
% 
% DESCRIPCION: Esta funcion calcula la expresi?n del Error cometido en 
%              la Aproximacion realizada mediante el Polinomio Interpolador
%              de Lagrange. A continuaci?n calcula la Cota de Error.
%              
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------
%Empieza funcion

function [e,cota] = Error(n,X,f)
    %Control de Errores en Argumentos de Entrada
        %ERROR 1: Se comprueba que n >= 2, en caso contrario se devuelve error.
            if (n <= 1)
                error ('El numero de puntos para calcular el Error de la Aproximacion utilizando Polinomio Interpolador de Lagrange debe ser mayor que cero')
            end
    %FIN Control de Errores en Argumentos de Entrada
%-------------------------------------------------------
%-------------------------------------------------------
    %Empieza funcionalidad funcion
        syms x;
        
        %Calculamos la Expresion del Error
            %Por partes calculamos: 
                %Factorial de n
                    val1= 1/factorial(n);
                %Productorio desde 1 hasta n de (x - xi)
                    g=sym('1');
                    for i=1:n
                        g= g * (x-X(i));
                    end
                %Derivada n-esima de f(x)
                    h=f;
                    for i=1:n
                        h= diff(h);
                    end
            %Obtenemos la Expresion del Error
                e= val1*g*h;
                
                
        %Calculamos la Cota de Error: Para ello dividimos el Problema de
        %obtener la Cota de Error de la funcion E(x) en dos Subproblemas
        %mas peque?os. El Subproblema 1 consistira en calcular una cota de
        %la funcion g(x). El Subproblema 2 consistira en calcular una cota
        %de la funcion h(x). Donde E(x) = 1/n! * g(x) * h(x)
           
        %Resolvemos Subproblema 1: Calcular Cota de funcion g(x)
            %Por partes calculamos:
                %La Cota de la funcion g(x) en valor absoluto. Por teor?a
                %sabemos que la funcion g(x) alcanza su maximo en uno de
                %los siguientes puntos:
                    %--> Extremos del Intervalo Cerrado [a,b]=[0,/pi/2]
                        
                        % Evaluamos la funcion g(x) en los Extremos del
                        %intervalo
                        
                            ga=subs(g,x,X(1));
                            gb=subs(g,x,X(n));
                            
                            
                            
                        % Calculamos el valor absoluto de la funcion g(x)
                        % evaluada en cada uno de los Extremos del
                        % Intervalo cerrado [0,pi/2]
                        
                            abs_ga=double(abs(ga));
                            abs_gb=double(abs(gb));
                            
                            extremos=[abs_ga abs_gb];
                            
                    
                    %--> Puntos Estacionarios (donde la derivada se anula 
                    %    situados dentro del Intervalo cerrado [0,pi/2] 
                    %    (En caso de existir alguno)
                    
                        % Buscamos puntos Estacionarios
                        
                            % Derivamos la funcion g(x)
                            
                                dg=diff(g);
                                
                            % Obtenemos los coeficientes del polinomio dg y
                            % los alamcenamos en la variable cgd. Notar que
                            % la funcion g(x) Siempre sera de tipo
                            % polinomica, entonces la derivada de la
                            % funcion g(x) que llamamos dg(x), siempre sera
                            % de tipo polinomica. Esto es debido a la
                            % caracteristicas que tiene la expresion del
                            % Error para la Aproximacion a traves del
                            % Polinomio Interpolador de Lagrange.
                            
                            
                                if(dg == 0)
                                    hay_puntos_Estacionarios=0;
                                    r=[];
                                else                               
                                    cgd=coeffs(dg) %Ordenado de menor a mayor
                                    cgd = fliplr(cgd) %Ordenado de mayor a menor 
                                    if(length(cgd) == 1)
                                        hay_puntos_Estacionarios=0;                                       
                                        r=[];
                                    else
                                        % Obtenemos las raices de la
                                        % derivada de g(x). 
                                            r1=[];
                                            r1=roots(cgd)
                                            
                                        % Solo nos interesan las raices reales.    
                                        % Eliminamos las raices imaginarias
                                            contador=0;
                                            if(length(r1)>0)                                               
                                                for i=1:length(r1)
                                                    if(imag(r1(i))==0)
                                                        r(i)=r1(i);
                                                        contador=1;
                                                    end
                                                end
                                                if(contador==0)
                                                    hay_puntos_Estacionarios=0;                                       
                                                    r=[];
                                                end
                                            else
                                                hay_puntos_Estacionarios=0;                                       
                                                r=[];
                                            end
                                        
                                    end
                                end
                                
                                if (length(r) > 0)
                                    hay_puntos_Estacionarios=1;
                                else
                                    hay_puntos_Estacionarios=0;
                                end
                                
                            % En caso de existir alguna raiz, la utilizamos
                            % para evaluar la funcion g(x) en cada una de
                            % las raices
                                
                                if(hay_puntos_Estacionarios==1)
                                    for i=1:length(r)
                                        gr(i)=subs(g,x,r(i));
                                    end
                                end
                              
                             %Obtenemos el valor absoluto de los valores
                             %obtenidos de particularizar la funcion en los
                             %puntos donde se anula la derivada(Puntos
                             %Estacionarios) (En caso de existir alguno)
                             
                                if(hay_puntos_Estacionarios==1)
                                    for i=1:length(gr)
                                        abs_gr(i)=abs(gr(i));
                                    end
                                end
                        
                                for i=1:length(gr)
                                        collect(abs_gr(i))
                                    end
                               
                                
                    %--> Puntos donde la funcion g(x) NO sea Diferenciable
                    %    dentro del Intervalo Cerrado [0,pi/2] (En caso de
                    %    existir alguno)
                        
                           %Doy por supuesto que todas las funciones con
                           %las que trabajamos son diferecniables en el
                           %Intervalo [a,b]. En caso de sospechar que la
                           %funci?n es No diferenciable en algun punto del
                           %Intervalo [a,b] habria que descomentar el
                           %codigo que hay en este apartado (suponiendo
                           %que sea utili para obtener los puntos no diferenciables)
                           
                            hay_puntos_No_Diferenciables=0;
                           
                    
                           %Para saber si existe algun donde la funcion
                           %g(x) no es Diferenciable, evaluamos la derivada
                           %primera de la funcion g(x) en el mayor numero
                           %de puntos dentro del Intervalo Cerrado [0,pi/2]
                           %y comprobamos si el resultado de dicha
                           %evaluacion en igual a Inf. En mi opinion un
                           %numero suficientemente grande de puntos en este
                           %caso es un numero que tenga 5 cifras
                           %significativas, por lo que en este caso
                           %dividiremos el Intervalo Cerrado [0,pi/2] 
                           %en m puntos equiespaciados una distancia de 0.0001
                           %pnd = puntos donde g(x) No es Diferenciable
                           %gnd = Evaluacion de g(x) en los puntos donde g(x) No 
                           %      es Diferenciable
                                
                            %Buscamos puntos del Intervalo [a,b] donde la
                            % 1/dg vale cero 
%                                 contador=1;
%                                 pnd=[];
%                                 for i=X(1):0.0001:X(n)
%                                     evaluacion=subs(dg,x,i);
%                                     if(evaluacion==Inf)
%                                         pnd(contador)=i;
%                                         contador=contador +1;
%                                     end
%                                 end
%                                 
%                                 if (length(pnd) > 0)
%                                     hay_puntos_No_Diferenciables=1;
%                                 else
%                                     hay_puntos_No_Diferenciables=0;
%                                 end
                            
                            %Evaluamos en la funcion g(x) los puntos donde
                            %la funcion g(x) No es Diferenciable (En caso
                            %de existir alguno)
%                                 if(hay_puntos_No_Diferenciables==1)
%                                         for i=1:length(pnd)
%                                             gnd(i)=subs(g,x,pnd(i));
%                                         end
%                                 end
                                
                            %Calculamos el valor absoluto de la evaluacion
                            %en g(x) de los puntos donde la funcion g(x) No
                            %es Diferenciable (En caso de existir alguno)
                           
%                                 if(hay_puntos_No_Diferenciables==1)
%                                         for i=1:length(gnd)
%                                             abs_gnd(i)=abs(abs_gnd);
%                                         end
%                                 end
                %Ya estamos en condiciones de dar el valor de la Cota de la
                %funcion g(x). Para ello nos quedamos con el mayor en valor
                %absoluto de entre los siguientes valores: g(x)
                %particularizada en el Exgtremo inferior del intervalo
                %[a,b], g(x) particularizada en el Extremo Sperior del
                %Intervalo [a,b], g(x) particularizada en cada uno de los
                %Puntos Estacionarios (en caso de existir alguno) y g(x)
                %particularizada en los puntos deonde la funcion g(x) No es
                %Diferenciable (en caso de existir alguno).
                
                    if(hay_puntos_Estacionarios==0 && hay_puntos_No_Diferenciables==0)
                        cota=max(extremos);
                    else
                        if(hay_puntos_Estacionarios==1 && hay_puntos_No_Diferenciables==1)
                            max1=max(extremos);
                            max2=max(abs_gr);
                            max3=max(abs_gnd);                            
                            vector=[max1 max2 max3];                       
                            cota=max(vector);
                        else
                            if(hay_puntos_Estacionarios==1)
                                max1=max(extremos);
                                max2=max(abs_gr);
                                vector=[max1 max2];                       
                                cota=max(vector);
                            else
                                max1=max(extremos);
                                max3=max(abs_gnd);
                                vector=[max1 max3];                       
                                cota=max(vector);
                            end
                        end
                    end
                    
           %FIN Subproblema 1
           
           %Resolvemos Subproblema 2: Calcular Cota de funcion h(x)
                           
        
        
end
%   FIN funcionalidad funcion
%-------------------------------------------------------
%------------------------------------------------------- 
%FIN funcion