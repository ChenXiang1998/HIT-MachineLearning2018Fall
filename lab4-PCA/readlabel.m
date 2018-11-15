function labels = readlabel(filename) 
%filename='t10k-labels.idx1-ubyte';（测试）
%或者filename='train-labels.idx1-ubyte';（训练）
%矩阵label的行列为10000*1（测试）或60000*1（训练）
%即label为列向量，需要行向量的话需要转置一下
fp = fopen(filename, 'rb');  
assert(fp ~= -1, ['Could not open ', filename, '']);  
  
magic = fread(fp, 1, 'int32', 0, 'ieee-be');  
assert(magic == 2049, ['Bad magic number in ', filename, '']);  
  
numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');  
  
labels = fread(fp, inf, 'unsigned char');  
  
assert(size(labels,1) == numLabels, 'Mismatch in label count');  
  
fclose(fp);  
  
end 