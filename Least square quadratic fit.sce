//Name:Rohan Joshi
//Roll No.:20HPH2655
//Topic:Fit given data to Quadratic Equation
clc
clf
x=[-8.3,-4.8,-4.1,-0.9,2.9,4.7,6.5,8.7]
y=[-2.3,-3.3,-0.8,-1.7,0.6,-1.2,2.2,5]
n=length(x)
sx=sum(x)
sy=sum(y)
sx2=sum(x^2)
sx3=sum(x^3)
sx4=sum(x^4)
sxy=sum(x.*y)
sx2y=sum((x^2).*y)
A=[n,sx,sx2;sx,sx2,sx3;sx2,sx3,sx4]
B=[sy;sxy;sx2y]
sol=A\B
head=['x','y','x^2','x^3','x^4','xy','(x^2)y']
cont=string([x',y',(x^2)',(x^3)',(x^4)',(x.*y)',((x^2).*y)'])
foot=[string(sx),string(sy),string(sx2),string(sx3),string(sx4),string(sxy),string(sx2y)]
table=[head;cont;foot]
e=["","","","","","","","","","Sum: "]
disp([e',table])
disp('Best fit quadratic polynomial: y= '+string(sol(1))+' + '+string(sol(2))+'x + '+string(sol(3))+'x^2')
X=[min(x)-5:0.01:max(x)+5]
Y=sol(1)+sol(2)*X+sol(3)*(X^2)
plot2d(x,y,-4)
plot2d(X,Y,5)
legend("Data points","Best fit Quadratic polynomial",pos=2)
a=gca()
    a.box="on";
    a.x_location="origin";
    a.y_location="origin";
    a.grid=[1,1,1];
    a.x_label.text="x-axis";
    a.y_label.text="y-axis";
    a.x_label.auto_position="on";
    a.y_label.auto_position="on";
