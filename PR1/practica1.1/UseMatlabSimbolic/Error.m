%% FUNCION Error: Error cometido por la Aproximacion mediante el Polinomio Interpolador de Lagrange

% TITULO: Error Aproximacion mediante Polinomio Interpolador Lagrange
% AUTOR: IVAN MARTIN GOMEZ
%
% SINTAXIS: Error(n,X,f)
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: n         --> Numero Puntos Discretos del Intervalo Cerrado
%   ARGUMENTO 2: X         --> Vector fila con n puntos discretos equiespaciados
%   ARGUMENTO 3: f         --> Funcion que queremos aproximar.
% 
% SALIDAS:       
%   SALIDA 1:    e         --> Expresion del Error cometido.
%   SALIDA 2:    CotaError --> Valor Cota de Error
%   SALIDA 3:    g         --> Funcion g(x)
%   SALIDA 4:    h         --> Funcion h(x)
%   (nota: E(x) = 1/!n * g(x) * h(x))
%   SALIDA 5:    abs_gr    --> Valor absoluto de Puntos Estacionarios funcion
%                              g(x) particularizados en la funcion g(x)
%   SALIDA 6:    abs_hr    --> Valor absoluto de Puntos Estacionarios funcion
%                              h(x) particularizados en la funcion h(x)                  
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

function [e,cota,g,h,abs_gr,abs_hr] = Error(a,b,n,X,f)
    %Control de Errores en Argumentos de Entrada
        %ERROR 1: Se comprueba que n >= 2, en caso contrario se devuelve error.
            if (n < 1)
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
                        
                            ga=subs(g,x,a);
                            gb=subs(g,x,b);
                            
                            
                            
                        % Calculamos el valor absoluto de la funcion g(x)
                        % evaluada en cada uno de los Extremos del
                        % Intervalo cerrado [0,pi/2]
                        
                            abs_ga=double(abs(ga));
                            abs_gb=double(abs(gb));
                            
                            extremos_g=[abs_ga abs_gb];
                            
                    
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
                            
                            
                                if(diff(dg) == 0)
                                    hay_puntos_Estacionarios=0;
                                    r=[];
                                else                               
                                    cdg=coeffs(dg); %Ordenado de menor a mayor
                                    cdg = fliplr(cdg); %Ordenado de mayor a menor 
                                    if(length(cdg) == 1)
                                        hay_puntos_Estacionarios=0;                                       
                                        r=[];
                                    else
                                        % Obtenemos las raices de la
                                        % derivada de g(x). 
                                            r1=[];
                                            r1=roots(cdg);
                                            
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
                            % 1/dg vale cero. Esto es lo mismo que buscar 
                            % puntos donde dg vale Inf. El motivo de porque no
                            % utilizo la funcion fzeros ya implementada en
                            % Matlab es porque esta funcion solo devuelve
                            % un valor que se corresponde con el primer
                            % valor de x para el cual la funcion que le
                            % pasamos como Argumento de entrada se anula,
                            % en el caso de haber mas de un punto donde la
                            % funcion se anula, los ignora y solo devuelve el 
                            % primero que encuentra.
                            
%                                 contador=1;
%                                 pnd=[];
%                                 for i=X(1):0.0001:X(n)
%                                     evaluacion=subs(1/dg,x,i);
%                                     if(evaluacion==0)
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
                
                    max1_g=0;
                    max2_g=0;
                    max3_g=0;
                   
                    if(hay_puntos_Estacionarios==0 && hay_puntos_No_Diferenciables==0)
                        cota_g=max(extremos_g);
                        abs_gr=[];
                    else
                        if(hay_puntos_Estacionarios==1 && hay_puntos_No_Diferenciables==1)
                            max1_g=max(extremos_g);
                            max2_g=max(abs_gr);
                            max3_g=max(abs_gnd);                            
                            vector=[max1_g max2_g max3_g];                       
                            cota_g=max(vector);
                        else
                            if(hay_puntos_Estacionarios==1)
                                max1_g=max(extremos_g);
                                max2_g=max(abs_gr);
                                vector=[max1_g max2_g];                       
                                cota_g=max(vector);
                                
                            else
                                max1_g=max(extremos_g);
                                max3_g=max(abs_gnd);
                                vector=[max1_g max3_g];                       
                                cota_g=max(vector);
                                abs_gr=0;
                            end
                        end
                    end
                    
           %FIN Subproblema 1
           
           %Resolvemos Subproblema 2: Calcular Cota de funcion h(x)
                %Por partes calculamos:
                %La Cota de la funcion h(x) en valor absoluto. Por teor?a
                %sabemos que la funcion h(x) alcanza su maximo en uno de
                %los siguientes puntos:
                    %--> Extremos del Intervalo Cerrado [a,b]=[0,/pi/2]
                        
                        % Evaluamos la funcion h(x) en los Extremos del
                        %intervalo
                        
                            ha=subs(h,x,a);
                            hb=subs(h,x,b);
                            
                            
                            
                        % Calculamos el valor absoluto de la funcion h(x)
                        % evaluada en cada uno de los Extremos del
                        % Intervalo cerrado [0,pi/2]
                        
                            abs_ha=double(abs(ha));
                            abs_hb=double(abs(hb));
                            
                            extremos_h=[abs_ha abs_hb];
                            
                    
                    %--> Puntos Estacionarios (donde la derivada se anula 
                    %    situados dentro del Intervalo cerrado [0,pi/2] 
                    %    (En caso de existir alguno)
                    
                        % Buscamos puntos Estacionarios
                        
                            % Derivamos la funcion h(x)
                            
                                dh=diff(h);
                                
                            % Ahora, a diferencia de la funcion g(x), no
                            % podemos asegurar que la funcion h(x) sea un
                            % polinomio, entonces no podemos asegurar que
                            % la derivada de la funcion h(x), dh(x) sea un
                            % polinomio. Entonces tenemos dos estrategias para
                            % encontrar donde dh(x) se anula en el caso de 
                            % no ser dh(x) un polinomio:
                                %  Estrategia 1: Utilizar la funcion 'fzeros' ya
                                %  implementada en Matlab, que devuelve el
                                %  primer punto que hace que la funcion
                                %  dh(x) se anule. Esta opcion es una
                                %  opcion limitada, ya que la funcion
                                %  fzeros solo devuelve el primer cero que
                                %  encuentra, si hay mas los ignora.
                                
                                
                                
                                % Estrategia 2: Desarrolar un algortimo que
                                % busque dentro del Intervalo Cerrado [a,b]
                                % , puntos donde la funcion dh(x) se haga
                                % cero. Mediante esta opcion, nos
                                % aseguramos encontrar cada uno de los
                                % puntos donde la funcion dg(x) se anula.
                                % La limitacion de este algortimo vendra
                                % dada por la cantidad de cifras
                                % significativas utilizadas para
                                % dividir el Intervalo Cerrado [a,b] y por
                                % la longitud total del intervalo [a,b].
                                % Las limitaciones anteriromente
                                % mencionadas haran que el algoritmo tarde
                                % mas o menos en arrojar una solucion en
                                % caso de encontrarla.
                                
                                
                                
                           
                            
                       % Caso 1: La funcion dh(x) es un Polinomio
                            %Comprobamos que la fucnion dh(x) es un
                            %polinomio. Para ello extraemos los
                            %coeficientes de la variable simbolica dh y
                            %diremos que dh es un polinomio si todos los
                            %coeficientes  son de tipo double, en el caso
                            %de haber algun coeficiente de tipo sym,
                            %diremos que dh No es un polinomio.
                               hay_puntos_Estacionarios=0;
                               coeficientes=[];
                               coeficientes=coeffs(dh,x);
                               contador=0;
                               if(length(coeficientes) > 0)
                                   for i=1:length(coeficientes)
                                       if(class(coeficientes(i)) == sym)
                                           contador=1;
                                       end
                                   end
                               end
                               if(contador==1)
                                   tipo_polinomio=1;
                               else
                                   tipo_polinomio=0;
                               end
                                
                         if(tipo_polinomio==1) %Entramos en el caso en que la funcion dh(x) Si es un Polinomio
                                
                                if(dh == 0)
                                    hay_puntos_Estacionarios=0;
                                    r3=[];
                                else                               
                                    cdh=coeffs(dh); %Ordenado de menor a mayor
                                    chd = fliplr(cdh); %Ordenado de mayor a menor 
                                    if(length(cdh) == 1)
                                        hay_puntos_Estacionarios=0;                                       
                                        r3=[];
                                    else
                                        % Obtenemos las raices de la
                                        % derivada de g(x). 
                                            r4=[];
                                            r4=roots(cdh);
                                            
                                        % Solo nos interesan las raices reales.    
                                        % Eliminamos las raices imaginarias
                                            contador=0;
                                            if(length(r4)>0)                                               
                                                for i=1:length(r4)
                                                    if(imag(r4(i))==0)
                                                        r3(i)=r4(i);
                                                        contador=1;
                                                    end
                                                end
                                                if(contador==0)
                                                    hay_puntos_Estacionarios=0;                                       
                                                    r3=[];
                                                end
                                            else
                                                hay_puntos_Estacionarios=0;                                       
                                                r3=[];
                                            end
                                        
                                    end
                                end
                                
                                if (length(r3) > 0)
                                    hay_puntos_Estacionarios=1;
                                else
                                    hay_puntos_Estacionarios=0;
                                end
                                
                            % En caso de existir alguna raiz, la utilizamos
                            % para evaluar la funcion g(x) en cada una de
                            % las raices
                                
                                if(hay_puntos_Estacionarios==1)
                                    for i=1:length(r3)
                                        hr(i)=subs(h,x,r3(i));
                                    end
                                end
                              
                             %Obtenemos el valor absoluto de los valores
                             %obtenidos de particularizar la funcion en los
                             %puntos donde se anula la derivada(Puntos
                             %Estacionarios) (En caso de existir alguno)
                             
                                if(hay_puntos_Estacionarios==1)
                                    for i=1:length(hr)
                                        abs_hr(i)=abs(hr(i));
                                    end
                                end
                        
                                
                               
                        % FIN Caso 1
                        else % Estamos en el caso en que dh(x) No es un Polinomio
                        
                        % Caso 2: La funcion h(x) No es un Polinomio.
                        % Debemos buscar los puntos estacionarios
                        % utilizando una de las dos Estrategias mencionadas
                        % al principio de este apartado
                            
                            %  Estrategia 1: Utilizar la funcion 'fzeros' ya
                                %  implementada en Matlab, que devuelve el
                                %  primer punto que hace que la funcion
                                %  dh(x) se anule. Esta opcion es una
                                %  opcion limitada, ya que la funcion
                                %  fzeros solo devuelve el primer cero que
                                %  encuentra, si hay mas los ignora.
                                
                                
                                
                                % Estrategia 2: Desarrolar un algortimo que
                                % busque dentro del Intervalo Cerrado [a,b]
                                % , puntos donde la funcion dh(x) se haga
                                % cero. Mediante esta opcion, nos
                                % aseguramos encontrar cada uno de los
                                % puntos donde la funcion dg(x) se anula.
                                % La limitacion de este algortimo vendra
                                % dada por la cantidad de cifras
                                % significativas utilizadas para
                                % dividir el Intervalo Cerrado [a,b] y por
                                % la longitud total del intervalo [a,b].
                                % Las limitaciones anteriromente
                                % mencionadas haran que el algoritmo tarde
                                % mas o menos en arrojar una solucion en
                                % caso de encontrarla.
                                
                                
                                %Metodo de la Biseccion
                                Zeros=[];
                                epsilon=0.1;
                                Zeros = MB(a,b,dh,epsilon);
                                if(length(Zeros)>0)
                                    hay_puntos_Estacionarios=1;
                                    for(i=1:length(Zeros))
                                        hr(i)=subs(h,x,Zeros(i));
                                    end
                                    for i=1:length(hr)
                                        abs_hr(i)=abs(hr(i));
                                    end
                                end
                                    
                                
                                        
                                
                        
                        
                        
                        
                        % FIN Caso 1
                               end
                        
                        
                               
                                
                    %--> Puntos donde la funcion h(x) NO sea Diferenciable
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
                           %h(x) no es Diferenciable, evaluamos la derivada
                           %primera de la funcion h(x) en el mayor numero
                           %de puntos dentro del Intervalo Cerrado [0,pi/2]
                           %y comprobamos si el resultado de dicha
                           %evaluacion en igual a Inf. En mi opinion un
                           %numero suficientemente grande de puntos en este
                           %caso es un numero que tenga 5 cifras
                           %significativas, por lo que en este caso
                           %dividiremos el Intervalo Cerrado [0,pi/2] 
                           %en m puntos equiespaciados una distancia de 0.0001
                           %pnd = puntos donde h(x) No es Diferenciable
                           %hnd = Evaluacion de h(x) en los puntos donde h(x) No 
                           %      es Diferenciable
                                
                            %Buscamos puntos del Intervalo [a,b] donde la
                            % 1/dh vale cero. Esto es lo mismo que buscar 
                            % puntos donde dg vale Inf. El motivo de porque no
                            % utilizo la funcion fzeros ya implementada en
                            % Matlab es porque esta funcion solo devuelve
                            % un valor que se corresponde con el primer
                            % valor de x para el cual la funcion que le
                            % pasamos como Argumento de entrada se anula,
                            % en el caso de haber mas de un punto donde la
                            % funcion se anula, los ignora y solo devuelve el 
                            % primero que encuentra.
                            
%                                 contador=1;
%                                 pnd=[];
%                                 for i=X(1):0.0001:X(n)
%                                     evaluacion=subs(1/dh,x,i);
%                                     if(evaluacion==0)
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
                            
                            %Evaluamos en la funcion h(x) los puntos donde
                            %la funcion h(x) No es Diferenciable (En caso
                            %de existir alguno)
%                                 if(hay_puntos_No_Diferenciables==1)
%                                         for i=1:length(pnd)
%                                             hnd(i)=subs(g,x,pnd(i));
%                                         end
%                                 end
                                
                            %Calculamos el valor absoluto de la evaluacion
                            %en h(x) de los puntos donde la funcion g(x) No
                            %es Diferenciable (En caso de existir alguno)
                           
%                                 if(hay_puntos_No_Diferenciables==1)
%                                         for i=1:length(hnd)
%                                             abs_hnd(i)=abs(abs_hnd);
%                                         end
%                                 end
                %Ya estamos en condiciones de dar el valor de la Cota de la
                %funcion h(x). Para ello nos quedamos con el mayor en valor
                %absoluto de entre los siguientes valores: h(x)
                %particularizada en el Exgtremo inferior del intervalo
                %[a,b], h(x) particularizada en el Extremo Superior del
                %Intervalo [a,b], h(x) particularizada en cada uno de los
                %Puntos Estacionarios (en caso de existir alguno) y h(x)
                %particularizada en los puntos deonde la funcion h(x) No es
                %Diferenciable (en caso de existir alguno).
                
                    max1_h=0;
                    max2_h=0;
                    max3_h=0;
                    if(hay_puntos_Estacionarios==0 && hay_puntos_No_Diferenciables==0)
                        cota_h=max(extremos_h);
                        abs_hr=[];
                    else
                        if(hay_puntos_Estacionarios==1 && hay_puntos_No_Diferenciables==1)
                            max1_h=max(extremos_h);
                            max2_h=max(abs_hr);
                            max3_h=max(abs_hnd);                            
                            vector=[max1_h max2_h max3_h];                       
                            cota_h=max(vector);
                        else
                            if(hay_puntos_Estacionarios==1)
                                max1_h=max(extremos_h);
                                max2_h=max(abs_hr);
                                vector=[max1_h max2_h];                       
                                cota_h=max(vector);
                            else
                                max1_h=max(extremos_h);
                                max3_h=max(abs_hnd);
                                vector=[max1_h max3_h];                       
                                cota_h=max(vector);
                                abs_hr=0;
                            end
                        end
                    end
                    
           %FIN Subproblema 2
           
           %Ahora ya estamos ya podemos dar la Cota de la funcion E(x)
           
           cota=val1*cota_g*cota_h;
        %FIN calculo Cota funcion E(x)
                           
        
        
end
%   FIN funcionalidad funcion
%-------------------------------------------------------
%------------------------------------------------------- 
%FIN funcion