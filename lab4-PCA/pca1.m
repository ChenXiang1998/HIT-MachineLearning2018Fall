clear;clc;
X=normrnd(2,1,100,1);
Y=normrnd(2,1,100,1);
Z=normrnd(2,0.05,100,1);
figure(1);
plot3(X,Y,Z,'r.');
grid on;
t=[X,Y,Z];
%%[COEFF SCORE latent]=princomp(t);
%%pcaData1=SCORE(:,1:k);
[m,n]=size(t); %计算矩阵的行m和列n
 
%-------------第一步：标准化矩阵-----------------%
mv=mean(t); %计算各变量的均值
st=std(t); %计算各变量的标准差
t=(t-repmat(mv,m,1))./repmat(st,m,1); %标准化矩阵t
 
%-------------第二步：计算相关系数矩阵-----------------%
% R1=t'*t/(m-1); %方法一：协方差矩阵计算公式
% R2=cov(t);     %方法二：协方差矩阵计算函数
R=corrcoef(t); %方法三：相关系数矩阵函数
 
%-------------第三步：计算特征向量和特征值-----------------%
[V,D]=eig(R);       %计算矩阵R的特征向量矩阵V和特征值矩阵D,特征值由小到大
V=(rot90(V))';      %将特征向量矩阵V从大到小排序
D=rot90(rot90(D));  %将特征值矩阵由大到小排序
E=diag(D);          %将特征值矩阵转换为特征值向量
 
%-------------第四步：计算贡献率和累计贡献率-----------------%
ratio=0; %累计贡献率
for k=1:n
    r=E(k)/sum(E);   %第k主成份贡献率
    ratio=ratio+r;  %累计贡献率
    if(ratio>=0.9)  %取累计贡献率大于等于90%的主成分
        break;
    end
end
 
%-------------第五步：计算得分-----------------%
S=t*V;
pcaData=S(:,1:2);
figure(2);
plot(pcaData(:,1),pcaData(:,2),'b.');