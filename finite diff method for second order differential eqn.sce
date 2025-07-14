//Name:Rohan Joshi
//To solve Second Order Linear Differential Equation of the form y''=p(x)y'+q(x)y+r(x) using Finite Difference Method

clear;clc;clf

//ps,qs,rs are p(x) q(x) r(x) entered as string
//For example ps='x.^2',qs='1./x',rs='1'
//Boundary conditions: y(xa)=ya,y(xb)=yb
//N-No. of equally spaced intervals 
function [x,y]=fdsolve(ps,qs,rs,xa,xb,ya,yb,N)
    //if ps is a number p then p(x) returns the vector [p,p,p....(N+1)times]
    //else p(x) returns the function in string ps evaluated at x vector
    //similarly for qs and rs
    if isnum(ps)
        deff('u=p(x)','u='+ps+'*ones(1,N+1)');
    else
        deff('u=p(x)','u='+ps);
    end
    if isnum(qs)
        deff('v=q(x)','v='+qs+'*ones(1,N+1)');
    else
        deff('v=q(x)','v='+qs);
    end
    if isnum(rs)
        deff('w=r(x)','w='+rs+'*ones(1,N+1)');
    else
        deff('w=r(x)','w='+rs);
    end
    h=(xb-xa)/N;x=linspace(xa,xb,N+1)// using linspace instead of[xa:h:xb] as for large N there may be some errors in the x terms due to which xb may not be reached so there will be N terms not N+1 
    P=p(x);Q=q(x);R=r(x)
    //Creating the required tridiagonal matrix 
    A= diag(-(2+(h^2)*Q(2:N)))+diag(1+(h/2)*P(3:N),-1)..
      +diag(1-(h/2)*P(2:N-1),1)
    B=(h^2)*(R(2:N))'
    B(1)=B(1)-(1+(h/2)*P(2))*ya;B(N-1)=B(N-1)-(1-(h/2)*P(N))*yb
    y=[ya (A\B)' yb]
endfunction

//declaring arguments of fdsolve function
p='0';q='64';r='-10'
xa=0;ya=0
xb=1;yb=0
N=15

[x,y]=fdsolve(p,q,r,xa,xb,ya,yb,N)
//plotting of solution
plot2d(x,y)
title(['Numerical solution of','$\frac{d^2y}{dx^2}=64y-10\quad y(0)=0,y(1)=0$',' using Finite Difference Method for ',string(N),'intervals'],'fontsize',4)
//legends(['Numerical Solution','$y=\cos(x)$'],[1,5],opt=4,font_size=3)
b=gca()
        b.box="on";
        b.x_location="origin";
        b.y_location="origin";
        b.grid=[1,1,1];
        b.x_label.text="$x$";
        b.y_label.text="$y$";
        b.x_label.position="on";
        b.y_label.auto_position="on";
