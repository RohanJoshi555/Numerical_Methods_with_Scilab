//Name: Rohan Joshi
//Roll No.: 20HPH2655
//Problem 4: Plot Bessel Functions of First Kind and also Draw Subplots
function y=J(n,x)
    a=((x/2).^n)/factorial(n);
    y=a;
    for k=1:25
        a=a.*(x/2).^2*((-1)/((k)*(n+k)));//Recursion relation for kth term
        y=y+a;  
    end
endfunction
clf
clc
x=[0:0.001:20]
N=5
for n=0:N
    leg(n+1)="J"+string(n)+"(x)" //generating string vector for legends
    xset('thickness',2)
    plot2d(x,J(n,x),n+1)
    xtitle("Graph of Bessel Functions of First Kind")
     b=gca()
        b.box="on";
        b.x_location="origin";
        b.y_location="origin";
        b.grid=[1,1,1];
        b.x_label.text="$x$";
        b.y_label.text="$J_n(x)$";
        b.x_label.font_size=4;
        b.y_label.font_size=4;
        b.x_label.position=[0.5,-0.2];
        b.y_label.auto_position="on";
end
legend(leg,pos=1)
show_window(1) //To show the next plots on different graphic window
for n=0:N
    subplot(ceil((N+1)/3),3,n+1) //To make subplot matrix such that space is made for (N+1) or more(ceil(N+1)/3) items so that all plots are shown
    xset('thickness',2)
    plot2d(x,J(n,x),n+1)
    xtitle("Plot of J"+string(n)+"(x)")
     b=gca()
        b.box="on";
        b.x_location="origin";
        b.y_location="origin";
        b.grid=[1,1,1];
        b.x_label.text="$x$";
        b.y_label.text="$J_n(x)$";
        b.x_label.font_size=4;
        b.y_label.font_size=4;
        b.x_label.position=[0.5,-0.2];
        b.y_label.auto_position="on";
end

