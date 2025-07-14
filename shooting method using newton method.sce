//Shooting method to solve Boundary Value Problem:
//y"=F(x,y,y')  y(a)=ya,y(b)=yb
//An Initial Value Problem(IVP) is made:
//y"=F(x,y,y')  y(a)=ya,y'(a)=m     (Aim part)
//Here m is a guessed value
//The solution to the IVP is found which is a curve from x=a to x=b     (Shoot part)
//Then y(b)=y0 is obtained from the solution 
//If y0-yb~0 then the solution to the IVP is the solution of BVP
//Else try other guess for y'(a)

clf;clc;clear;

//Function to solve the IVP:
//y"=F(x,y,y')  y(a)=ya,y'(a)=m
//Here IVP is solved using Euler's Method
function[y,yprime]=shoot(f,x,ya,m)
    N=length(x)-1;h=(max(x)-min(x))/N;
    y=[ya];yprime=[m];
    deff("w=F(x,y,yprime)","w="+f);
    for i=1:N
        y(i+1)=y(i)+yprime(i)*h;
        yprime(i+1)=yprime(i)+F(x(i),y(i),yprime(i))*h;
    end
endfunction

f="exp(x)";
xa=0;ya=1;
xb=1;yb=%e;
m1=1.3;m2=1.2;
N=1000;tol=10^(-3);
x=linspace(xa,xb,N+1);

//y0 depends on what value of m is chosen
//So y0 is a function of m
//So y0(m)-yb=0 is an equation with variable m
//This can be solved by numerical methods for finding roots 
//Here Secant Method is used(2 initial values of m are needed)
[y1]=shoot(f,x,ya,m1);
[y2]=shoot(f,x,ya,m2);
if abs(y1(N+1)-yb)<=tol
    y=y1;m=m1;
elseif abs(y2(N+1)-yb)<=tol
    y=y2;m=m2;
else
    while %t
        m=m2-((y2(N+1)-yb)*(m2-m1)/(y2(N+1)-y1(N+1)));
        y=shoot(f,x,ya,m);
        disp(abs(y(N+1)-yb))
        if abs(y(N+1)-yb)<=tol
            break;
        end
        m1=m2;m2=m;
        y1=y2;y2=y;
    end
end

//Plotting
plot2d(x,y,1);
title(['Numerical solution of ','$\frac{d^2y}{dx^2}=e^x$','using Shooting Method for ',string(N)," intervals"],'fontsize',4)
legends('m='+string(m)+", error in yb=|"+string(y(N+1))+"-"+string(yb)+"|="+string(abs(y(N+1)-yb)),1,opt=6,font_size=3)
axes=gca()
    axes.box="on";
    axes.y_location="origin";
    axes.x_location="origin";
    axes.y_label.text='$y$';
    axes.x_label.text='$x$';
    axes.grid=[1,1,1];
