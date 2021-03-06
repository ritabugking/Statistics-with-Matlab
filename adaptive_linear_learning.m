n=ones(1,1000); % set all the x0 equal to 1
w=rand(3,1)-0.5; %randomly chose w and w2 in the range [-0.5,0.5]
w2=rand(3,1)-0.5;
save=[]; %it will be a container to save every MSE from each training in the while
%loop
k=[]; % it will be a container to save the training times in the while loop
kk=0; %the initial value using to produce the training times
nn=rand(2,1000)*2-1; %randomly chose x1 and x2 in the range [-1,1]
x=[n;nn]; %put the training time and MSE together
y=w'*x; %calculate the actual output y
d=[0,3,-2]*x; %calculate the desired output d
%use while loop to find the optimal weights until the difference between d and y
%smaller than 0.0000000001
while abs(d-y)>0.0000000001
w=w2;
nn=rand(2,1000)*2-1; %set the x1 and x2 again in each new round
x=[n;nn];
y=w'*x;
d=[0,3,-2]*x;
w2=w+[0.0001;0.0001;0.0001].*(x*(d-y)'); %set the step =0.0001
mse=sum((d-y).^2)/1000; %calculate the MSE
kk=kk+1;
k=[k,kk];
save=[save,mse];
train=[k;save]; %training times and MSE are saved in this matrix
end
plot(train(1,:),train(2,:)) %plot MSE vs. numbers of training
ylabel('MSE') %label the axis of x and y;
xlabel('numbers of training')
% the next part is using the optimal weights to calculate the MSE. All the setting are
%the same as above.
n=ones(1,1000);
nn=rand(2,1000)*2-1;
x=[n;nn];
y=w2'*x;
d=[0,3,-2]*x;
mse=sum((d-y).^2)/1000;
