function labels = readlabel(filename) 
%filename='t10k-labels.idx1-ubyte';�����ԣ�
%����filename='train-labels.idx1-ubyte';��ѵ����
%����label������Ϊ10000*1�����ԣ���60000*1��ѵ����
%��labelΪ����������Ҫ�������Ļ���Ҫת��һ��
fp = fopen(filename, 'rb');  
assert(fp ~= -1, ['Could not open ', filename, '']);  
  
magic = fread(fp, 1, 'int32', 0, 'ieee-be');  
assert(magic == 2049, ['Bad magic number in ', filename, '']);  
  
numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');  
  
labels = fread(fp, inf, 'unsigned char');  
  
assert(size(labels,1) == numLabels, 'Mismatch in label count');  
  
fclose(fp);  
  
end 