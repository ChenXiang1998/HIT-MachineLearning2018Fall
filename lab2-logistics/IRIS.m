A=load('iris.txt');
A=A(1:100,:);
A=A(:,[1 2 5]);
figure; %在图片中显示所有数据点 
for i=1:1:100
    x1 = A(i,1); 
    x2 = A(i,2); 
    sign = A(i,3); 
    if sign == 1 
        plot(x1,x2,'r+','markersize',6); 
    elseif sign == 0 
        plot(x1,x2,'bo','markersize',6); 
    end
    hold on;
end; 
hold off; 
grid on;
X0=ones(100,1);
X1=A(:,1);
X2=A(:,2);
Y=A(:,3);
alpha=0.001;
maxcycle=500;
weights=ones(3,1);
dataMatrix=[X0,X1,X2];
for k=1:maxcycle
    h=sigmoid(dataMatrix*weights);
    error=Y-h; 
    weights=weights+alpha*dataMatrix'*error;
end
a0=weights(1);
a1=weights(2);
a2=weights(3);
y=(-a0*X0-a1*X1)./a2;
hold on;
plot(X1,y);