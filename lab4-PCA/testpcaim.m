%�����Գ�����������ͼƬ����ǩ����ͼƬpca��ά
%������Ҫ�Ķ���ֻ���ļ���
images = readpicture('t10k-images.idx3-ubyte');
labels = readlabel('t10k-labels.idx1-ubyte');
A=pca(images);
 
 
%%�����ǲ���ͼƬ����ͱ�ǩһһ��Ӧ���������в��ؿ���
C=images(:,6);     %��ȡͼ���һ�У���ȻҲ�����ǵ�n�У� 
C=reshape(C,28,28);   
figure(1);
subplot(2,1,1);
imshow(C,[]);       %��ʾͼ�񣬿��Կ����������ǩ�еĵ�1�������n������ͬ
figure(1);
subplot(2,1,2);
F=A(:,6); 
F=reshape(F,28,28);
imshow(F,[]); 
