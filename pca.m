a=load('copepod_composition.txt'); %read the copepod composition into workplace
b=(a>=2); % find the dominant species which is at least 2 percent in every station
c=a((sum(b')>=1),:); %draw out the dominant species data
s=(c'*c)./repmat(34*43-1,34,34); %calculate the s = [y-y.] [y-y.]’/ n-1
[ C, lambda, PCs ] = svd(s); %decomposition the s matrix into three included
%lambda=eigenvalues, PCs=eigenvectors
plot(PCs(:,1),PCs(:,2),'o') %using the first and second column of eigenvectors to
%bi-plot the data among site
[U,D] = eig(s); % find the eigenvalues and eigenvectors
f=sum(lambda)/sum(sum(lambda)); %change the eigenvalues into proportion
pareto(f) %display the values as bars drawn in descending order and show the
%cumulative proportion
sum(f(1:3)) %calculate the cumulative proportion in the first three eigenvalues
sum(f(1:2)) %calculate the cumulative proportion in the first two eigenvalues
