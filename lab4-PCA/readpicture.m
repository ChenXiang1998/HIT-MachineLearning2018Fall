function images = readpicture(filename) 
%读二进制文件，filename为文件名
%filename='t10k-images.idx3-ubyte';（测试）
%或者filename='train-images.idx3-ubyte';（训练）
%输出images矩阵的行与列为784*10000(测试)或784*60000(训练)
fp = fopen(filename, 'rb');
assert(fp ~= -1, ['Could not open ', filename, '']);
 
magic = fread(fp, 1, 'int32', 0, 'ieee-be');
assert(magic == 2051, ['Bad magic number in ', filename, '']);
 
numImages = fread(fp, 1, 'int32', 0, 'ieee-be');
numRows = fread(fp, 1, 'int32', 0, 'ieee-be');
numCols = fread(fp, 1, 'int32', 0, 'ieee-be');
 
images = fread(fp, inf, 'unsigned char');
images = reshape(images, numCols, numRows, numImages);
images = permute(images,[2 1 3]);
 
fclose(fp);
 
% Reshape to #pixels x #examples
images = reshape(images, size(images, 1) * size(images, 2), size(images, 3));
% Convert to double and rescale to [0,1]  （归一化可选）
%images = double(images) / 255; 
end
