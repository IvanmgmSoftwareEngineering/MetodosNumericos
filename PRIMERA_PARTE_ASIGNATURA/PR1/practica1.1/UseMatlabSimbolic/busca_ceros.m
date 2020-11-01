%% FUNCION busca_ceros: METODO DE LA BISECCION buscar ceros

% TITULO: Metodo de la Biseccion
% AUTOR: IVAN MARTIN GOMEZ

%
% SINTAXIS: MB(n,X,L)
% ARGUMENTOS ENTRADA:
%   ARGUMENTO 1: a         --> Extremo Inferior del Intervalo donde realizamos la busqueda 
%   ARGUMENTO 2: b         --> Extremo Superior del Intervalo donde realizamos la busqueda
%   ARGUMENTO 3: f         --> Funcion en la cual buscamos el punto donde la funcion se anula
%   ARGUMENTO 4: epsilon   --> Criterio de parada de Emergencia del Metodo. Es un valor
%                              de Tolerancia que utilizaremos para dejar de buscar. Notar que el valor
%                              de la aproximacion obtenido sera mejor cuanto mas peque?o sea el valor
%                              de epsilon.
%  
%
% SALIDA:     Zero   --> Vector con un unico valor, correspondiente a la 
%                        aproximacion del punto donde la funcion se anula.
%                        En caso de no encontrar ningun punto donde la
%                        funcion se anula devuelve un vector vacio
%                             
%
%   
% 
% DESCRIPCION: 



%             
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------


function Zero = busca_ceros(x1_in,x2_in,f,epsilon)
   syms x;
   x1=x1_in;
   x2=x2_in;
   

   while((x2-x1)>epsilon)
       x2-x1
       
        xm=(x1 + x2)/2;
        f1=subs(f,x,x1);
        f2=subs(f,x,x2);
        fm=subs(f,x,(x1 + x2)/2);
        
        
        if(f1==0)
            Zero=x1;
            return;
        elseif(f2==0)
            Zero=x2;
            return;
        else
           if(fm==0)
                Zero=xm;
                return;
            elseif(((fm>0)&&(f2>0))||((fm<0)&&(f2<0)))
                x1=x1;
                x2=xm;
            elseif(((fm>0)&&(f1>0))||((fm<0)&&(f1<0)))
                x1=xm;
                x2=x2;
            end

        end 
   end
   Zero = xm;
   return;
end