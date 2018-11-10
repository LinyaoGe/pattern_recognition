% train_images = loadImages('/Users/loner/Matlab/Database/train-images-idx3-ubyte');
% train_labels = loadLabels('/Users/loner/Matlab/Database/train-labels-idx1-ubyte');
% 
% %计算训练集内样品大小
% Ni = zeros(1,10);
% Ni = countNum(Ni, train_labels);
% 
% %对训练集进行分类
% classifiy = classify_minst(train_images,train_labels);
% 
% test_images = loadImages('/Users/loner/Matlab/Database/t10k-images-idx3-ubyte');
% test_labels = loadLabels('/Users/loner/Matlab/Database/t10k-labels-idx1-ubyte');
fisher_minst(classifiy,test_images,test_labels);