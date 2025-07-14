//Name:Rohan Joshi
//To solve the given system of linear equations using gauss elimination method
clc
A=[0,3,-4;2,-5,7;-1,0,-9]
b=[16;-27;9]
am=[A,b]  //Augmented Matrix
mprintf('Original Augmented matrix(A:b)-->')
disp(am)
[r,c]=size(am)
x=zeros(r,1)
for i=1:r-1
    if am(i,i)==0 then
        absm=abs(am(i:r,i))
        maxind=find(absm==max(absm))+i-1
        a=am(i,:)
        am(i,:)=am(maxind(1),:)  //If the ith diagonal element is 0 Interchange ith row with the row containing the max absolute value in ith column below a(i,i)
        am(maxind(1),:)=a
        mprintf('\nR%i <-> R%i-->',i,maxind(1))
        disp(am) 
    end
    if (am(i,i)~=0) && (am(i,i)~=1) then
        mprintf('\nR%i->R%i/%f-->',i,i,am(i,i))
        am(i,:)=am(i,:)/am(i,i) //Make the ith diagonal element equal to 1
        disp(am)
    end
    for j=i+1:r
        if am(j,i)~=0 then
            mprintf('\nR%i->R%i-(%f*R%i)-->',j,j,am(j,i),i)
            am(j,:)=am(j,:)-(am(j,i)*am(i,:)) //Make all the elements below ith diagonal element equal to 0
            disp(am)
        end
    end 
end
if (abs(am(r,r))<=10D-10) && (am(r,c)~=0) then
    mprintf('\nNo solution exists')  //If last row is of the form [0,0,0.....,0,b] and b!=0 this would correspond to eq:0*xn=b which has no solutions
elseif (am(r,r)==0) then
    mprintf('\nThe System of Equations has Infinite Solutions')  //If the upper condition is not true and this is true then last row is of the form [0,0,0.....,0,0] this correspond to eq:0*xn=0 which has infinite solutions
else
    mprintf('\nR%i->R%i/%f-->',r,r,am(r,r))
    am(r,:)=am(r,:)/am(r,r)
    disp(am)
    x(r)=am(r,c)
    for i=r:-1:1
        sum=0
        for j=i+1:r
            sum=sum+am(i,j)*x(j)  //Back substitution
        end
        x(i)=(am(i,c)-sum)/am(i,i)
    end
    mprintf('\nSolution(X):')
    disp(x)
    mprintf('\nTo check the solution:\nAX:B=')
    disp([(A*x),b])
end
