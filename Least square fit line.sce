//Name:Rohan Joshi
//Fit the given data to straight line
clc
clf
x=[0,0.53,1.04,1.53,2,2.52,3.05,3.5,4.03,4.52,5.06,5.5,6,6.53]
y=[0,10.1,19.8,29.3,38.4,48.3,58.4,67.1,76.9,86.4,96.8,105,114.3,124.1]
n=length(x)
sx=sum(x)
sy=sum(y)
sx2=sum(x^2)
sxy=sum(x.*y)
A=[n sx;sx sx2]
B=[sy;sxy]
sol=A\B
mprintf('\tBest fit line: y= '+string(sol(1))+' + '+string(sol(2))+'x')
X=[min(x)-2:0.01:max(x)+1]
Y=sol(1)+sol(2)*X
scatter(x,y, ,"black","fill")
plot2d(X,Y,5)
xtitle('Linear Regression')
legend("Data points","Best fit line",pos=4)
a=gca()
    a.box="on";
    a.x_location="origin";
    a.y_location="origin";
    a.grid=[1,1,1];
    a.x_label.text="$x$";
    a.y_label.text="$y$";
    a.x_label.auto_position="on";
    a.y_label.auto_position="on";
