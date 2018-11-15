function [ A ] = pca( B )
%pca功能实现
%输入矩阵B的行列为784*10000(测试)或784*60000(训练)
%输出A的行列为20*10000(测试)或20*60000(训练)
ave=B-ones(size(B,1),1)*mean(B);
C=1/(size(B,2))*(ave*ave');
[V,D]=eigs(C,125);
A=V'*B;
B2=zeros(784,10000);
for i=1:10000
    W=zeros(784,1);
    for j=1:125
        W=W+V(:,j)*A(j,i);
    end
    B2(:,i)=W;
end
A=B2;
end