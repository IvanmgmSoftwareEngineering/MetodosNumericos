%% FUNCION MB: METODO DE LA BISECCION para obtener los puntos donde una funci?n se anula

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
% DESCRIPCION: Esta funcion en primer lugar llama a la funcion bisec.m para
%              localizar cambios de signo en los extremos del intervalo que
%              se le pasa como argumento a la funcion bisec.m. Notar que,
%              internamente la funcion bisec.m se puede llama a s? misma
%              para realizar esta busqueda utilizando el metodo de la Bisectriz,
%              que consiste en ir dividiendo el intervalo en dos
%              subintervalos de longitud mitad que el intervalo original,
%              para realizar una nueva busqueda en esos subintervalos

%              Una vez que hemos localizado un cambio de signo (en caso de
%              no localizar ningun cambio de signo, asumiramos que la
%              funcion f no se anula en ningun punto del intervalo [a,b] y 
%              podremos dar por finalizada la busqueda), deberemos buscar
%              la aproximacion del puntos donde se anula la funcion, para
%              hcer esto tambien usaremos el metodo de la Bisectriz, aunque
%              en este caso no tendremos resursion.
%
%              Notar que el metodo de la Bisectriz aplicado de forma recursiva 
%              utilizado para detectar cambios de signo en la funcion
%              bisec.m, utiliza la misma Tolerancia 'epsilon' que la
%              Tolerancia que utilizamos en esta funcion MB para dar una
%              aproximacion del valor donde la funcion f se anula.



%             
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------


function Zeros = MB(a,b,f,epsilon)

    [x1_out,x2_out,encontrado]= detecta_cambio_signo(a,b,f,epsilon);
    
    if (encontrado==0)
        Zeros=[];
        return;
    else
        
        if(length(x1_out)==1)
        
            Zeros = busca_ceros(x1_out,x2_out,f,epsilon);
            return;
            
        else
            
            zero1 = busca_ceros(x1_out(1),x2_out(1),f,epsilon);
            zero2 = busca_ceros(x1_out(2),x2_out(2),f,epsilon);
            Zeros=[zero1 zero2];
            return;
        end
    end
end
    