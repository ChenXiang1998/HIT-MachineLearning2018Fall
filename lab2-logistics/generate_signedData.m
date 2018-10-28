%% 本函数的功能是根据所给分类方程，产生一组带标签的数据点(二维) 
%  row表示需要的数据点个数; 
%  range_x、range_y分别是数据[横纵坐标取值范围],都是 1*2 矩阵. 
%  分类方程形式：y = a*x^m + b 
function data = generate_signedData(row,range_x,range_y,a,m,b) 
data=zeros(row,3); 
min_x=range_x(1); 
max_x=range_x(2); 
min_y=range_y(1); 
max_y=range_y(2); 
for i=1:1:row 
    %rand('seed',0); 
    %初始化高斯随机生成器为0，可重复性 
    x = min_x+(max_x-min_x)*rand(1,1); 
    y = min_y+(max_y-min_y)*rand(1,1); 
    sign = zeros(1,1); 
    if y>(a*x^m + b) 
        sign = 1; 
    else
        sign = 0;
    end
    data(i,:)=[x,y,sign]; 
end
figure; %在图片中显示所有数据点 
for i=1:1:row 
    x1 = data(i,1); 
    x2 = data(i,2); 
    sign = data(i,3); 
    if sign == 1 
        plot(x1,x2,'r+','markersize',6); 
    elseif sign == 0 
        plot(x1,x2,'bo','markersize',6); 
    end
    hold on;
end; 
hold off; 
grid on;