clear all;close all;clc;
A=load('iris.txt');
A=A(:,[1 2]);
figure; %��ͼƬ����ʾ�������ݵ� 
for i=1:150
    x1 = A(i,1); 
    x2 = A(i,2); 
    plot(x1,x2,'r.','markersize',6); 
    hold on;
end; 
hold off; 
grid on;

N=3;%���þ�����Ŀ
[m,n]=size(A);
pattern=zeros(m,n+1);
center=zeros(N,n);%��ʼ����������
pattern(:,1:n)=A(:,:);
for x=1:N
    center(x,:)=A( randi(150,1),:);%��һ�����������������
end
while 1
distence=zeros(1,N);
num=zeros(1,N);
new_center=zeros(N,n);
 
for x=1:m
    for y=1:N
    distence(y)=norm(A(x,:)-center(y,:));%���㵽ÿ����ľ���
    end
    [~, temp]=min(distence);%����С�ľ���
    pattern(x,n+1)=temp;         
end
k=0;
for y=1:N
    for x=1:m
        if pattern(x,n+1)==y
           new_center(y,:)=new_center(y,:)+pattern(x,1:n);
           num(y)=num(y)+1;
        end
    end
    new_center(y,:)=new_center(y,:)/num(y);
    if norm(new_center(y,:)-center(y,:))<0.1
        k=k+1;
    end
end
if k==N
     break;
else
     center=new_center;
end
end
[m, n]=size(pattern);
 
%�����ʾ����������
figure;
hold on;
for i=1:m
    if pattern(i,n)==1 
         plot(pattern(i,1),pattern(i,2),'b.');
         plot(center(1,1),center(1,2),'ko');
    elseif pattern(i,n)==2
         plot(pattern(i,1),pattern(i,2),'r.');
         plot(center(2,1),center(2,2),'ko');
    elseif pattern(i,n)==3
         plot(pattern(i,1),pattern(i,2),'g.');
         plot(center(3,1),center(3,2),'ko');
    elseif pattern(i,n)==4
         plot(pattern(i,1),pattern(i,2),'y.');
         plot(center(4,1),center(4,2),'ko');
    else
         plot(pattern(i,1),pattern(i,2),'m.');
         plot(center(5,1),center(5,2),'ko');
    end
end
grid on;