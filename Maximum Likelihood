data=load('cetaceancorrect_dat.txt');
x=data(:,2); %the sea state
y=data(:,3); %the numbers of pingers
b1=repmat(0.0001,1000,1); %set the initial value for those four parameters
b0=b1;
b2=b1;
b3=b1;
x=(x>3); %if >3, the value became 1
z=data(:,4); %the result which is if or if not entanglement
m=[b0,b1,b2,b3];
f=@(m)(sum(-(z.*(m(1)+m(2).*x+m(3).*y+m(4).*(y.^2)))+log10((ones(1000,1)+exp(m(1)+m(2).*x+m(3).*y+m(4).*(y.^2)))))); %the function of –logL(β)
t=fminsearch(f,[-1 -1 -1 -1]); %find minimum value of function f and all the four
%parameters use -1 as initial values
d=f(t); %find the minimum value of –logL(β)
tt=fminsearch(f,[0.3,0.3,0.3,0.3]); %find minimum but use different initial values
dd=f(tt);
10^(-d) %use the minimum value of –logL(β) and calculate the maximum value of L(β)
