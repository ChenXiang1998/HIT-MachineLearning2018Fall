A=load('wine.txt');
A=A(1:130,:);
A=A(:,[1 2 13]);
figure; %在图片中显示所有数据点 
for i=1:1:130
    
    x1 = A(i,2); 
    x2 = A(i,3); 
    sign = A(i,1); 
    if sign == 1 
        plot(x1,x2,'r+','markersize',6); 
    elseif sign == 2 
        plot(x1,x2,'bo','markersize',6); 
    end
    hold on;
end; 
hold off; 
grid on;
X0=ones(130,1);
X1=A(:,2);
X2=A(:,3);
Y=A(:,1);
Y=Y-X0;
alpha=0.0001;
maxcycle=5000;
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