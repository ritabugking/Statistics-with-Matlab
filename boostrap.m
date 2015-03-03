a=load('cop_density.txt');
>>  c=ceil(rand(34,1000)*34);%producing uniform random numbers from 0 %to 34 in 34 x 1000 matrix

for i=1:100 %build a loop to change zeros in the c matrix into another %random numbers. This ‘finding zeros and change’ action %repeats for 100 time, so we can be sure that there’s no zero %in the matrix c 
f=find(c==0);% f contains the positions which are zeros in matrix c
c(f)=ceil(rand(size(f))*34);%change those positions into another random %numbers
end

k=a(c);%k is a 34 x 1000 matrix which contains the numbers randomly %chose from the copepod density matrix
mean(a)%calculate the mean of copepod density
se_density=std(a)/(length(a)^0.5)%calculate the standard error of %copepod density
mean(mean(k)) %calculate the mean of copepod density built by %bootstrap with 1000 times 
hist(mean(k),100)%draw the means built with bootstrap into histogram
se_boodensity=std(mean(k))/(length(mean(k))^0.5) %calculate the %standard error of means 


median(a) %calculate the median of copepod density
semedian_density=std(median(k))/(length(median(k))^0.5)
%calculate the standard error of medians 
hist(median(k),100) %draw the medians built with bootstrap into %histogram
mean(median(k)) %calculate the mean of medians of copepod %density built by bootstrap with 1000 times
