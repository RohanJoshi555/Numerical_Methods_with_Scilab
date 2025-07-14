//Name:Rohan Joshi
//Roll No.:20HPH2655
//Topic:Fit given data to Exponential curve
clc
clf

x=[1,1.2,1.4,1.6]
y=[40.170,73.196,133.372,243.02]

//Finding the best fit straight line for ln(y) vs x plot:
Y=log(y)
n=length(x)
sx=sum(x)
sY=sum(Y)
sx2=sum(x^2)
sxY=sum(x.*Y)
A=[n sx;sx sx2]
B=[sY;sxY]              //Best fit line ln(y) = sol(1) + sol(2)*x
sol=A\B

//Printing Table of values :
line='+--------+---------------+---------------+---------------+---------------+-------+\n'
mprintf(line)
mprintf('|S.No. \t |x \t\t |y \t\t |ln(y) \t |x^2 \t\t |x*ln(y)|\n')
mprintf(line)
for i=1:n
    mprintf('|%i \t |%0.4f \t |%0.4f \t |%0.4f \t |%0.4f \t |%0.4f |\n',i,x(i),y(i),Y(i),(x^2)(i),(x.*Y)(i));
end
mprintf(line)
mprintf('|Sum: \t |%0.4f \t |%s \t |%0.4f \t |%0.4f \t |%0.4f|\n',sx,'       ',sY,sx2,sxY)
mprintf(line)
mprintf('Best fit exponential: y= %0.4f*e^(%0.4f*x)',exp(sol(1)),sol(2))        //y=exp(sol(1))*e^(sol(2)*x)

//Plotting the graph
X=[min(x)-0.5:0.001:max(x)+0.1]
Y1=exp(sol(1)+sol(2)*X)
plot2d(x,y,-4)
plot2d(X,Y1,5)
legend("Data points","Best fit exponential",pos=2)
b=gca()
    b.box="on";
    b.x_location="origin";
    b.y_location="origin";
    b.grid=[1,1,1];
    b.x_label.text="x-axis";
    b.y_label.text="y-axis";
    b.x_label.auto_position="on";
    b.y_label.auto_position="on";
