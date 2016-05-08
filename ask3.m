clear;
clc;
format('compact');

n = input('Dwse to n: ');
beta = input('Dwse to sintelesti ekpaideusis: ');
max_num_epochs = input('Dwse to megisto arithmo epanalipseon : ');
mmse= input('Dwse to Elaxisto Meso Tetragoniko Sfalma: ');




w = randn(3,1)

fprintf('\n\n\n');   
disp('-----Epilogi Provlimatos-----');
fprintf(' 1. Grammika Diaxorisimes Klaseis \n 2. Mi Grammika Diaxorisimes Klaseis 1 \n 3. Mi Grammika Diaxorisimes Klaseis 2 \n 4. Telos \n\n');
epilog = input('    Dose Epilogh (1...3): ');

    switch(epilog)
        case 1
            a1 = 0; 
            b1 = 0.4;
            a2 = 0.5;
            b2 = 0.9;
            
            x(1:(n/2),1:2)     = (b1 -   a1)*rand((n/2),2) + a1;   %Klassi 1
            x((n/2 + 1):n,1:2) = (b2 - a2)*rand((n/2),2) + a2; %Klassi 2
        case 2
            a1 = 0; 
            b1 = 0.6;
            a2 = 0.5;
            b2 = 0.9;
            
            x(1:(n/2),1:2)     = (b1 -   a1)*rand((n/2),2) + a1;   %Klassi 1
            x((n/2 + 1):n,1:2) = (b2 - a2)*rand((n/2),2) + a2; %Klassi 2
        case 3
            
             x(1:(n/2),1:2)     = (0.4 - 0)*rand((n/2),2) + 0;   %Klassi 1
            %x(n/2 + 1:(3*n)/4,1:2) = (0.9 - 0.5)*rand((n/4),2) + 0.5; %Klassi 2
            x(n/2 + 1:(3*n)/4,1) = (0.9 - 0)*rand((n/4),1) + 0; %Klassi 2 x
            x(n/2 + 1:(3*n)/4,2) = (0.9 - 0.4)*rand((n/4),1) + 0.4; %Klassi 2 y
            %x((((3/4)*n)+1):n,1:2) = (0.9 - 0.4)*rand((n/4),2) + 0.4; %Klassi 3
            x((((3/4)*n)+1):n,1) = (0.9 - 0.5)*rand((n/4),1) + 0.5; %Klassi 3 x 
            x((((3/4)*n)+1):n,2) = (0.5 - 0)*rand((n/4),1) + 0; %Klassi 3 y
        otherwise
            disp('Lathos epilogh');
    end %end switch

    
    x(:,3) = -1;
    
    d(1,1:n/2)=-1;
    d(1,(n/2)+1:n)=1;
    
    epochs=0;
    
    u = zeros(n,1);
    v = zeros(n,1);


   error=1;
   % mse=0;
    %changes=1;
    
    while ((error>mmse) && (epochs<max_num_epochs))
        for i=1:n
        u(i) = x(i,:)*w;
         v(i) = u(i);
         w = w + beta*(d(i) - v(i))*x(i,:)';
        end %end for
        
        for i=1:n
             u(i) = x(i,:)*w;
         v(i) = u(i);
         delta(i) =d(i) - v(i);
       error=error+(delta(i)*delta(i));  
        end %end for
        
        epochs=epochs+1;
        error = error/n ;
    mse(epochs) = error;
   
    
     figure(1);
    
    subplot(2,2,1);
    hold on;
    plot(x(1:(n/2),1),x(1:(n/2),2),'r+');
    plot(x((n/2)+1:n,1),x((n/2)+1:n,2),'bo');
    hold off;

    subplot(2,2,2);    
    
    class_a = find(v > 0);
    class_b = find(v < 0);
    
    plot(x(class_a,1),x(class_a,2),'r+');
    hold on;
    plot(x(class_b,1),x(class_b,2),'bo');
    hold on;
    x1 = 0:0.1:1;
    y1 = (w(3) - w(1)*x1)/w(2);
    plot(x1, y1, 'k');
    hold off;

    subplot(2,2,3);
    plot(1:n,v,'ko');
    
    pause(0.1);
    
    subplot(2,2,4);
    plot(mse);
    
    
    end %end while
     v
     epochs
     
     
     fprintf('Protypo (Class 1): ');
p1 = 0.4*rand(1,2)   %Klassi 1
p1(1,3) = -1;
diergesi_1 = p1*w;
fprintf('Apotelesma: ');
test1 = step01(diergesi_1);

if( test1 == 0 )
    fprintf('Class 1\n');
else
    fprintf('Class 2\n');
end

fprintf('Protypo  (Class 2): ');
p2 = 0.4*rand(1,2) + 0.5 %Klassi 2
p2(1,3) = -1;
diergesi_2 = p2*w;
fprintf('Apotelesma: ');
test2 = step01(diergesi_2);
if( test2 == 0 )
    fprintf('Class 1\n');
else
    fprintf('Classi 2\n');
end