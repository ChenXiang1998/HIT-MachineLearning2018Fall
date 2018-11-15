%主测试程序，两步，读图片、标签；将图片pca降维
%这里需要改动的只有文件名
images = readpicture('t10k-images.idx3-ubyte');
labels = readlabel('t10k-labels.idx1-ubyte');
A=pca(images);
 
 
%%以下是测试图片矩阵和标签一一对应，主程序中不必考虑
C=images(:,6);     %读取图像第一列（当然也可以是第n列） 
C=reshape(C,28,28);   
figure(1);
subplot(2,1,1);
imshow(C,[]);       %显示图像，可以看到数字与标签中的第1个（或第n个）相同
figure(1);
subplot(2,1,2);
F=A(:,6); 
F=reshape(F,28,28);
imshow(F,[]); 
