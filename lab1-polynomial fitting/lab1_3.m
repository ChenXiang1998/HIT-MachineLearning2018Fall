format long
X=linspace(-pi,pi,12);
X=X';
y=sin(X);
R=normrnd(0,0.1,12,1);
Y=y+R;
W=zeros(12,1);
lam=exp(-18);
k=1;
A=zeros(12,12);
    for i = 1:(12)
    A(:,i)=X.^(i-1);
    end
Q=A'*A;
b=A'*Y-lam*eye(12)*W;
r0=b-Q*W;
d=[];
r=[];
d(:,1)=r0;
r(:,1)=r0;
a=[];
err=[];
while true
    a(k)=(r(:,k)'*r(:,k))/(d(:,k)'*Q*d(:,k));
    W=W+a(k)*d(:,k);
    r(:,k+1)=r(:,k)-a(k)*Q*d(:,k);
    beta=(r(:,k+1)'*r(:,k+1))/(r(:,k)'*r(:,k));
    d(:,k+1)=r(:,k+1)+beta*d(:,k);
    figure(1);
    subplot(4,5,k);
    plot(X,y)
    hold on
    plot(X,Y,'o')
    y2=A*W;
    hold on
    plot(X,y2)
    err(k)=0.5*sum((y2-Y).^2)+0.5*lam*(W'*W);
    k=k+1;
    if k>20
        break;
    end
end
err
e1=1:1:20;
figure(2);
plot(e1,err);




