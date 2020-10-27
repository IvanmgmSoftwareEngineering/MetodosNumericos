%% FUNCION MB: METODO DE LA BISECCION para obtener los puntos donde una funci?n se anula

% TITULO: Metodo de la Biseccion
% AUTOR: IVAN MARTIN GOMEZ

%
% SINTAXIS: detecta_cambio_signo(x1_in, x2_in,f,epsilon)
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: x1_in          --> Extremo Inferior del Intervalo donde realizamos la busqueda 
%   ARGUMENTO 1: x2_in          --> Extremo Superior del Intervalo donde realizamos la busqueda
%  
%
% SALIDA:                 
%   SALIDA 1:    x1_out         --> Extremo Inferior del nuevo subintervalo 
%   SALIDA 2:    x2_out         --> Extremo Superior del nuevo subintervalo                             
%   SALIDA 3:    encontrado     --> Variable booleana. Si la variable 'encontrado'
%                                   toma el valor de '1', entonces
%                                   significa que se ha encontrado un cero
%                                   (un cambio de signo)
%                                   en el intervalo [x1_out x2_out],
%                                   En el caso de
%                                   tomar la variable 'encontrado' el valor
%                                   '0', significa que se ha alcanzado el
%                                   Criterio de Parada (epsilon) sin detectar ningun
%                                   cambio de signo y daremos
%                                   por hecho que no hay ning?n valor que
%                                   anule a la funcion f
%   
% 
% DESCRIPCION: Esta funcion es llamada de forma recursiva por la funci?n
%              MB.m para comprobar la similitud o no de los signos
%              de la funcion f en los extremos del intervalo [x1_in x2_in]. 
%              [x1_in x2_in].En caso de detectar un cambio de signo, esta
%              funci?n hace una comprobacion de similitud o no, entre: (->1)
%              el signo de la funci?n f en el extremo inferior x1_in con el
%              el signo de la funci?n f en el punto medio (x1_in +
%              x2_in)/2. (->2) el signo de la funcion f en el extremo
%              superior x2_in con el signo de la funcion en el punto medio (x1_in +
%              x2_in)/2. En ambos casos 1) y 2) bisec.m devuelve
%              encontrado=1, y decidir que subintervalo [x1_out x2_out] devuelve 
%              dependiendo de los resultados obtenidos en 1?) y 2?). 
%              
%              En el caso de No detectar un cambio de signo en el
%              intervalo [x1_in x2_in]. Esta funcion se llama de forma recursiva con 
%              el proposito de encontrar un cambio de signo en un
%              subintervalo del intervalo [x1_in x2_in].
%              
%
%   ---> Si signo(f(x1_in)) IGUAL signo(f(x2_in)) entonces esta funci?n se
%        llama asi misma de forma recursiva tantas veces como el 
%        Criterio de Parada (epsilon) lo permita:
%          --> bisec(x1_in, (x1_in + x2_in)/2)
%          --> bisec((x1_in + x2_in)/2, x2_in) 
%
%       En el caso de alcanzar la condicion de parada sin detectar ningun
%       cambio de signo asumiremos que la funcion f no tiene ningun cero en
%       el intervalo [x1_in x2_in]
%
%
%   ---> Si signo(f(x1_in)) DISTINTO signo(f(x2_in)) entonces esta funcion
%        hace la siguiente comprobacion:
%          --> si signo(f(x1_in)) IGUAL signo((x1_in + x2_in)/2)  entonces
%              se devuelve [x1_out = (x1_in + x2_in)/2 , x2_out = x2_in]
%          --> si signo(f(x2_in)) IGUAL signo((x1_in + x2_in)/2)  entonces
%              se devuelve [x1_out = x1_in , x2_out = (x1_in + x2_in)/2]
%             
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------
function [x1_out,x2_out,encontrado] = detecta_cambio_signo(x1_in,x2_in,f,epsilon)
    
    if ((x2_in - x1_in) > epsilon)
        
        
        syms x;
        f1=subs(f,x,x1_in);
        f2=subs(f,x,x2_in);
        fm=subs(f,x,(x1_in + x2_in)/2);
        
        if(((f1>0)&&(f2>0))||((f1<0)&&(f2<0))) %Mismo signo
            %caso a) Llamamos recursivamente a esta misma funcion para
            %        analizar el subintervalo Izquierdo [x1_in (x1_in + x2_in)/2]
            [x1_out_1,x2_out_1,encontrado_1] = detecta_cambio_signo(x1_in, (x1_in + x2_in)/2,f,epsilon);
            %caso b) Llamamos recursivamente a esta misma funcion para
            %        analizar el subintervalo Derecho [(x1_in + x2_in)/2 x2_in]
            [x1_out_2,x2_out_2,encontrado_2] = detecta_cambio_signo((x1_in + x2_in)/2, x2_in,f,epsilon);
            
            
            if(encontrado_1==0 && encontrado_2==0)
                encontrado =0;
                x1_out=x1_in;
                x2_out=x2_in;
                return;
            else
               if(encontrado_1==1 && encontrado_2==1)
                   encontrado=1;
                   x1_out=[x1_out_1 x1_out_2];
                   x2_out=[x2_out_1 x2_out_2];
                   return;
               else
                   
                    if(encontrado_1==0)%ha encontrado un cambio de signo en caso b)
                        encontrado=1;
                        x1_out=x1_out_2;
                        x2_out=x2_out_2;
                        return;
                    else %%ha encontrado un cambio de signo en caso a)
                        encontrado=1;
                        x1_out=x1_out_1;
                        x2_out=x2_out_1;
                        return;
                    end
               end
            end
        else
            x1_out = x1_in; 
            x2_out = x2_in;
            encontrado=1;
            return;
                
%         else % f1 y f2 son de diferente signo
%             if(((f1>0)&&(fm>0))||((f1<0)&&(fm<0))) % f1 tiene el mismo signo que fm
%                 x1_out = (x1_in + x2_in)/2; 
%                 x2_out = x2_in;
%                 encontrado=1;
%                 return;
%             else %((f2>0)&&(fm>0))||((f2<0)&&(fm<0)) % f2 tiene el mismo signo que fm
%                 x1_out = x1_in;
%                 x2_out = (x1_in + x2_in)/2;
%                 encontrado=1;
%                 return;
%             end
            
        end
        
    else
        %Criterio de parada de emergencia alcanzado
        x1_out = x1_in; 
        x2_out = x2_in;
        encontrado=0;
        return;
    end


end