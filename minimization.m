eq1='sin(x)/x-0.6'; %define the equation
deq1=diff(eq1); %calculate the first-order differentiation of eq1
%write a while loop for finding the root until |xi+1-xi|/xi is no more larger than
%setting tolerance = 0.000001.
%first, I guess a suitable numbers for xi and xi+1 which will let |xi+1-xi|/xi > tolerance
%to enter the while loop, then n will become a position where can save the value of
%n2 of the former loop so I look n as xi. Because of the reason, n2 will be the starting
%value in the calculation.
n=5;
n2=10;
while (abs(n2-n)/n)>0.000001
n=n2; %save the former xi+1 in n2 as xi in n
n2=n-subs(eq1,'x',n)/subs(deq1,'x',n); %calculate new xi+1
end

b=load('vidal.txt'); %load the Vidal data into workplace
t=b(:,1); %declare the first column as temperature in “t”
syms a p; %declare a and p as variables a=a, p=α in a(T-α)b
f=@(t,k)(k(1)*((t-k(2)).^-2.05)); %write the function which equal to: D=a(T-α)b
k=[a,p]; %k(1)=a, k(2)= α
parameter=fminsearch(@(k)(sum((f(t,k)-b(:,2)).^2)),[1 1]) %use the known data in C2
%to find the parameters by minimizing the least square error
d=@(t)(f(t,parameter)); %put the calculating parameters from the upper line into
%function
T=8:0.1:15.5;
plot(T,d(T)) %plot the functional curve
hold on;
scatter(t,b(:,2),'o') %plot the real data
hold on
%And the following codes is the same theorem as above.
%calculate the C3 parameters
parameter=fminsearch(@(k)(sum((f(t,k)-b(:,3)).^2)),[1 1])
d=@(t)(f(t,parameter));
plot(T,d(T))
hold on;
scatter(t,b(:,3),'o')
hold on;
%calculate the C4 parameters
parameter=fminsearch(@(k)(sum((f(t,k)-b(:,4)).^2)),[1 1])
d=@(t)(f(t,parameter));
plot(T,d(T))
hold on;
scatter(t,b(:,4),'o')
hold on;
%calculate the C5 parameters
parameter=fminsearch(@(k)(sum((f(t,k)-b(:,5)).^2)),[1 1])
d=@(t)(f(t,parameter));
plot(T,d(T))
hold on;
scatter(t,b(:,5),'o')
hold on
xlabel('temperature') %label the axis of x and y;
ylabel('stage duration')
