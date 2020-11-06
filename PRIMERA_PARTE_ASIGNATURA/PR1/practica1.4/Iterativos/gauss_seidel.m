%% Gauss-Seidel (Metodo Iterativo)
%  gauss_seidel.m
%  AUTOR: IVAN MARTIN GOMEZ
%%
%  Argumentos entrada: 
%       --> Matriz:                      A_in (n filas x n columnas)
%       
%       --> Vector:                      b_in (n filas x 1 columnas)
%
%       --> Tolerancia:                  delta_in 
%
%       --> Aproximacion Inicial:        x_0_in  
%
%  Salida: 
%       --> Matriz:                      x (k filas x n columnas). Matriz
%                                                                  con las k aproximaciones
%       --> Error 1:                     e1 (k filas x n columna). Matriz Error 1. Se calcula comparando el valor de la
%                                                                  aproximacion actual con el valor de la aproximacion anterior
%       --> Error 2:                     e2 (k filas x n columna). Matriz Error 1. Se calcula comparando el valor de la
%                                                                  aproximacion actual con el valor real de la solucion 

%  Error:
%       --> Error 1: La Matriz A tiene algun elemento de su Diagonal
%                    Principal igual a cero.
%       --> Error 2: El numero de Columnas de la Matriz A debe ser igual al
%                    numero de Filas del Vector b
%
%  Convergencia: 
%       --> Condici?n 1: Suficiente y no necesaria: [(Que la Matriz A sea
%                                                   Diagonal Dominante por
%                                                   Filas) O (que sea
%                                                   Simetrica)] Y [que sea
%                                                   Definida Positiva].
%                                                   Donde: Por el Criterio
%                                                   de Sylvester una Matriz
%                                                   es Definida Positiva si
%                                                   se cumple que todos los
%                                                   Menores Principales de
%                                                   la Matriz son positivos. 
%       --> Condicion 2: Suficiente y necesaria: Que rho(M)=Radio Espectral < 1. Donde: M = -(L+D)^-1*U, 
%                                                                                       ,A=L+D+U, D= d_ii=a_ii y d_ij=0 (si i~=j), L=Matriz Diagonal Inferior, U=Matriz Diagonal Superior 
%                                                                                       ,rho(M)=max{|lambda_i|}, 
%                                                                                       ,lambda_i = autovalores asociados matriz M
%           (Nota Convergencia: comprobamos Condicion 1, en caso de cumplirse ya podemos afirmar que el Metodo Converge.
%                               S?lo en el caso de no cumplirse la Condicion 1, comprobamos la Condicion 2.)                               

%  Descripcion: Esta funcion obtiene una aproximacion de la Solucion del
%               Sistema de Ecuaciones Lineales

%----------------------------------------------------------------------------------



function [x,e1,e2] = gauss_seidel(A_in,b_in,delta_in,x_0_in,x_sol_in)
    %Daclaracion y Especificacion de Variables
        A=A_in;
        b=b_in;
        x_0=x_0_in;
        N=length(b);
        size_A=size(A);
    %Control de Errores de Argumentos
        %Error 2
         if(N~=size_A(2))
            fprintf('Error: las dimensiones de la Matriz A y del Vector b no son validas');
            return;
         end
         %Error 1
         for i=1:N
             if(A(i,i)==0)
                fprintf('Error: tiene al menos un 0 en la posicion (%i,%i) de su Diagonal Principal, por lo que este Metodo No es aplicable',i,i);
                return; 
             end
         end
    %Control de Convergencia
        %Condicion 1 Convergencia: Condicion suficiente pero no necesaria:
        %                           Matriz A es Diagonal Dominante por filas Y 
        %                           la Matriz A es Definida Positiva
        %                           (usamos Criterio de Sylvester)
            %Coprobamamos Dominancia por Filas
            A_dominante_por_filas=1;
            for i=1:N
                suma_dominante=0;
                for j=1:N
                    if(i==j)
                        valor_abs_diagonal=abs(A(i,j));
                    else
                        suma_dominante=suma_dominante+abs(A(i,j));
                    end 
                end
                if(suma_dominante>=valor_abs_diagonal)
                   fprintf('Cuidado: Condicion 1 (suficiente pero no necesaria) Convergencia ha fallado. La Matriz A no es Diagonal Dominante por filas ==> Comprobamos Condicion 2 Convergencia\n');
                    A_dominante_por_filas=0; 
                end
            end
            %Coprobamamos Definida Positiva (usamos Criterio de Sylvester)
                    A_definida_positiva=1;
                    for i=1:N
                        if(i==1)
                            menor_principal=det(A(i:i,i:i));
                        else
                            menor_principal=det(A(1:i,1:i));
                        end
                        if(menor_principal<=0)
                            fprintf('Cuidado: Condicion 1(suficiente pero no necesaria) Convergencia ha fallado. La Matriz A no es Definida Positiva ==> Comprobamos Condicion 2 Convergencia\n');
                            A_definida_positiva=0;
                        end
                    end
            
        %Condicion 2 Convergencia: Condicion suficiente y necesaria: s?lo
        %                          la comprobamos en caso de fallar la Condicion 1 Convergencia
            if(A_dominante_por_filas==0||A_definida_positiva==0)
                %Obtenemos Matriz D
                    D=zeros(N,N);
                    for i=1:N
                        D(i,i)=A(i,i);
                    end
                %Obtenemos Matriz U (Upper) llamando funcion eliminacion_gaussiana_spp.m
                    [U,b_u] = eliminacion_gaussiana_spp(A,b);
                %Obtenemos Matriz L (Lower) llamando funcion nombre_funcion.m
                    %Aqui falta la llamada a una funcion ficticia que
                    %calcula la Matriz L. De Aqui en adelante el codigo
                    %para comprobar esta segunda condicion de convergencia
                    %esta incompleto, pero lo unico que seria necesario
                    %para completarlo es implementar una funcion para
                    %obtener la Matriz L. Adem?s como en los Ejercicios que
                    %vamos a realizar las matrices A cumplen ser
                    %Diagonalmente Dominantes y definidas positivas, nunca
                    %entraremos en esta parte del codigo.
                %Obtenemos la Matriz inversa de (L+D): L_mas_D_inver
                
                %Obtenemos Matriz M = -(L+D)^-1*U
                    M = -L_mas_D_inver*U;
                %Obtenemos Polinomio Autovalores asociados a la Matriz B
                    syms lambda
                    I=zeros(N,N);
                    for i=1:N
                        I(i,i)=1;
                    end
                    polinomio=det(M -lambda*I);
                %Obtenemos raices polinomio Autovalores asociados a la
                %Matriz B para obtener Autovalores asociados a la
                %Matriz B
                    coeficentes_polinomio_1=coeffs(polinomio,'All'); %Coeficientes polinomio Ordenados de menor a mayor.
                    coeficentes_polinomio_2 = fliplr(coeficentes_polinomio_1); %Coeficientes polinomio Ordenados de mayor a menor
                    raices_polinomio=roots(coeficentes_polinomio_2); 
                %Obtenemos rho(B)=max{|lambda_i|}
                    rho=max(abs(raices_polinomio));
                %Comprobamos condicion de Convergencia 2: rho(B) < 1
                    if(rho>=1)
                       fprintf('Error: El metodo no es convergente para los valores de A y b dados. No se cumplen ninguno de los Criterios de Convergencia\n');
                       return;  
                    end
                    
            end
        %FIN Control Convergencia
                    
    %FIN Control de Errores de Argumentos
%----------------------------------------------------------------------------------
    %Comienza el Codigo del Metodo de GAUSS-SEIDEL
       x_out(1,:)=x_0; %Guardo la aproximacion Inicial recibida como argumento en la primera fila de la Matriz x_out(k filas x n columnas)
       contador=2; % Empieza en 2 por la caractreristica interna de Matlaba de empezar a indezar vectores por el 1 y no por el 0
       error_2=x_0;% %Guardo la aproximacion Inicial recibida como argumento en la primera fila de la Matriz error_2(k filas x n columnas). Recordar que este es el error obtenido de comparar el valor de la aproximacion en la iteracion actural con el valor de la aproximacion de la iteracion anterior.
       continua=1;
       while(continua)
        continua_aux=0;
        for i=1:N
            suma=0;
            suma_1=0;
            suma_2=0;
            if(i==1)
                for j=2:N
                    if(i~=j)
                        suma=suma+A(i,j)*x_out(contador-1,j);
                    end
                end
            else
                for j=1:i-1
                    if(i~=j)
                        suma_1=suma_1+A(i,j)*x_out(contador,j);
                    end
                end
                for j=i+1:N
                    if(i~=j)
                        suma_2=suma_2+A(i,j)*x_out(contador-1,j);
                    end
                end
                suma=suma_1 + suma_2;
                suma_1=0;
                suma_2=0;
            end
            x_out(contador,i)=(b(i)-suma)/A(i,i);
        end
        for i=1:N
                error_1(contador,i)=abs(x_out(contador,i)-x_sol_in(i));
                error_2(contador,i)=abs(x_out(contador,i)-x_out(contador-1,i));
        end
        
        for i=1:N
           if(error_2(contador,i)>=delta_in)
              continua_aux =1;
           end
        end
        if(continua_aux==0 || contador==10)
            continua=0;
        end
        contador=contador+1;
        
       end
       Numero_Iteraciones_gauss_seidel=contador-2;
       Numero_Iteraciones_gauss_seidel
       x=x_out;
       e1=error_1;
       e2=error_2;
    
%FIN FUNCION GAUSS-SEIDEL
end

