format long
X=linspace(-pi/2,pi/2,10);
X=X';
y=sin(X);
R=normrnd(0,0.1,10,1);
Y=y+R;
W=zeros(9,1);
lam=exp(-18);
k=0;
A=zeros(10,9);
    for i = 1:(9)
    A(:,i)=X.^(i-1);
    end
while true
W = W - 0.0005*(A'*A*W-A'*Y+lam*eye(9)*W);
k=k+1;
y2=A*W;
error=0.5*sum((y2-Y).^2)+0.5*lam*(W'*W);
if error<0.02
break;
end
end
plot(X,y2);
hold on;
plot(X,Y,'o');
hold on;
plot(X,Y);
