format long
start=2*pi;
X=linspace(0,start,10);
X=X';
y=sin(X);
R=normrnd(0,0.1,10,1);
Y=y+R;
figure(1);
plot(X',y');
hold on;
plot(X',Y','o');
err=[];
err2=[];
lam=exp(-18);
for m = 0:10
    A=zeros(10,m+1);
    for i = 1:(m+1)
    A(:,i)=X.^(i-1);
    end
    W=inv(A'*A)*A'*Y;
    V=flipud(W);
    y2=polyval(V,X);
    figure(1);
    hold on;
    plot(X,y2);
    figure(2);
    subplot(3,4,m+1);
    plot(X,y2);
    hold on;
    plot(X',y');
    hold on;
    plot(X',Y','o');
    err(end+1)=0.5*sum((y2-Y).^2)
    err2(end+1)=err(end)+lam/2*(W'*W)
end
e1=0:1:10;
figure(3);
plot(e1,err);
hold on;
plot(e1,err,'o');
figure(4)
plot(e1,err2,'o');
hold on;
plot(e1,err2');
