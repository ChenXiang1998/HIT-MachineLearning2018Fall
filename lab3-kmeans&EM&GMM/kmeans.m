clear all;close all;clc;
%%׼������
% ��һ������
mu1=[0 0 ];  %��ֵ
S1=[.2 0 ;0 .2];  %Э����
data1=mvnrnd(mu1,S1,100);   %������˹�ֲ�����
%�ڶ�������
mu2=[1.25 1.25 ];
S2=[.1 0 ;0 .1];
data2=mvnrnd(mu2,S2,100);
% ����������
mu3=[-1.25 1.25 ];
S3=[.3 0 ;0 .3];
data3=mvnrnd(mu3,S3,100);
% ����������
mu4=[1.25 -1.25 ];
S4=[.4 0 ;0 .4];
data4=mvnrnd(mu4,S4,100);
% ����������
mu5=[-1.25 -1.25 ];
S5=[.5 0 ;0 .5];
data5=mvnrnd(mu5,S5,100);

%%��ʾ����
plot(data1(:,1),data1(:,2),'b.');
hold on;
plot(data2(:,1),data2(:,2),'r.');
plot(data3(:,1),data3(:,2),'g.');
plot(data4(:,1),data4(:,2),'y.');
plot(data5(:,1),data5(:,2),'m.');
grid on;

%  N�����ݺϳ�һ��������ŵ�������
data=[data1;data2;data3;data4;data5]; 
N=5;%���þ�����Ŀ
[m,n]=size(data);
pattern=zeros(m,n+1);
center=zeros(N,n);%��ʼ����������
pattern(:,1:n)=data(:,:);
for x=1:N
    center(x,:)=data( randi(300,1),:);%��һ�����������������
end
while 1
distence=zeros(1,N);
num=zeros(1,N);
new_center=zeros(N,n);
 
for x=1:m
    for y=1:N
    distence(y)=norm(data(x,:)-center(y,:));%���㵽ÿ����ľ���
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
