X=generate_signedData(100,[-8,8],[-8,8],2,1,2);
X0=ones(100,1);
X1=X(:,1);
X2=X(:,2);
Y=X(:,3);
alpha=0.001;
lamda=exp(-18);
maxcycle=500;
weights=ones(3,1);
dataMatrix=[X0,X1,X2];
for k=1:maxcycle
    h=sigmoid(dataMatrix*weights);
    error=Y-h;
    weights=weights+alpha*dataMatrix'*error+lamda*weights'*weights;
end
a0=weights(1);
a1=weights(2);
a2=weights(3);
y=(-a0*X0-a1*X1)./a2;
hold on;
plot(X1,y);