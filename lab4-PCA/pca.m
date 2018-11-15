function [ A ] = pca( B )
%pca����ʵ��
%�������B������Ϊ784*10000(����)��784*60000(ѵ��)
%���A������Ϊ20*10000(����)��20*60000(ѵ��)
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