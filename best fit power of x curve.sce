//Name:Rohan Joshi
//Roll No.:20HPH2655
//Topic:Fit given data to Curve: y=A*x^b
clc
clf

x=[2,4,7,10,20,40,60,80]
y=[43,25,18,13,8,5,3,2]

//Finding the best fit straight line for ln(y) vs ln(x) plot:
X=log(x)
Y=log(y)
n=length(X)
sX=sum(X)
sY=sum(Y)
sX2=sum(X^2)
sXY=sum(X.*Y)
A=[n sX;sX sX2]
B=[sY;sXY]              //Best fit line ln(y) = sol(1) + sol(2)*ln(x)
sol=A\B

//Printing Table of values :
line='+--------+---------------+---------------+---------------+---------------+---------------+-----------+\n'
mprintf(line)
mprintf('|S.No. \t |x \t\t |ln(x) \t |y \t\t |ln(y) \t |(ln(x))^2 \t |ln(x)*ln(y)|\n')
mprintf(line)
for i=1:n
    mprintf('|%i \t |%0.4f \t |%0.4f \t |%0.4f \t |%0.4f \t |%0.4f \t |%0.4f     |\n',i,x(i),X(i),y(i),Y(i),(X^2)(i),(X.*Y)(i));
end
mprintf(line)
mprintf('|Sum: \t |%s \t |%0.4f \t |%s \t |%0.4f \t |%0.4f \t |%0.4f    |\n','       ',sX,'       ',sY,sX2,sXY)
mprintf(line)
mprintf('Best fit power curve: y= %0.4f*x^%0.4f',exp(sol(1)),sol(2))        //y=exp(sol(1))*x^sol(2)

//Plotting the graph
X1=[min(x)-0.5:0.001:max(x)+15]
Y1=exp(sol(1))*(X1^sol(2))
plot2d(x,y,-4)
plot2d(X1,Y1,5)
legend("Data points","Best fit power curve",pos=1)
b=gca()
    b.box="on";
    b.x_location="origin";
    b.y_location="origin";
    b.grid=[1,1,1];
    b.x_label.text="x-axis";
    b.y_label.text="y-axis";
    b.x_label.auto_position="on";
    b.y_label.auto_position="on";
