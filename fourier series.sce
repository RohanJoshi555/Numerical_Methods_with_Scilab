clc;clear;clf;
function w=f(x)
//    if (x>0)&&(x<=L) 
//        w=k;
//    elseif x==0
//        w=0;
//    elseif (x<0)&&(x>=-L)
//        w=-k;
//    else
//        w=0;
//    end
      w=x;
endfunction
function z=periodicf(f,x,T)
    for i=1:length(x)
//        if round(((x(i)/t)-1)/2)==((x(i)/t)-1)/2
//            n=((x(i)/t)-1)/2;
//        else
//            n=floor(((x(i)/t)+1)/2);
//        end
        n=0;
        if x(i)>0
            while (x(i)-2*n*T)>T
                n=n+1;
            end
        elseif x(i)<0
            while (x(i)-2*n*T)<-T
                n=n-1;
            end
        end
        z(i)=f(x(i)-2*n*T);
    end
endfunction

n=20;
L=20;
a=[];b=[];
N=[1:n];
a0=integrate('f(x)','x',-L,L,1e-10)/(2*L);
for i=N
    a(i)=integrate('f(x)*cos('+string(i)+'*%pi*x/L)/L','x',-L,L,1e-10);
    b(i)=integrate('f(x)*sin('+string(i)+'*%pi*x/L)/L','x',-L,L,1e-10);
end
x=linspace(-2*L,2*L,1000);y=[];
for i=[1:length(x)]
    y(i)=(cos(N*%pi*x(i)/L))*a+(sin(N*%pi*x(i)/L))*b;
end
y=a0+y;

subplot(3,1,1)
bar(a);
title(['Coefficients of','$\cos(\frac{n\pi}{L}x)$',"$(a_n)$"]);
axis=gca()
        axis.box="on";
        axis.x_location="origin";
        axis.y_location="origin";
        axis.grid=[1,1,1];
        axis.x_label.text="$n$";
        axis.y_label.text="$a_n$";
        axis.x_label.position="on";
        axis.y_label.auto_position="on";

subplot(3,1,2)
bar(b,'red');
title(['Coefficients of','$\sin(\frac{n\pi}{L}x)$',"$(b_n)$"]);
axis=gca()
        axis.box="on";
        axis.x_location="origin";
        axis.y_location="origin";
        axis.grid=[1,1,1];
        axis.x_label.text="$n$";
        axis.y_label.text="$b_n$";
        axis.x_label.position="on";
        axis.y_label.auto_position="on";

subplot(3,1,3)
plot2d(x,periodicf(f,x,L));
plot2d(x,y,5);
legend('f(x)','Fourier series approximation of f(x)',-1);
axis=gca()
        axis.box="on";
        axis.x_location="origin";
        axis.y_location="origin";
        axis.grid=[1,1,1];
        axis.x_label.text="$x$";
        axis.y_label.text="$y$";
        axis.x_label.position="on";
        axis.y_label.auto_position="on";
