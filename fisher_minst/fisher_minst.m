function fisher_minst(classifiy,test_image,test_labels)
%初始化参数
    m = num2cell(zeros(1,10));
    s = num2cell(zeros(1,10));
    W = num2cell(zeros(10,10));
    Y = num2cell(zeros(10,10));
    means = num2cell(zeros(10,10));
    y0 = num2cell(zeros(10,10));
    
%求均值向量和离散度矩阵
    for i = 1:10
        m{1,i} = m{1,i} + mean(mean(classifiy{1,i}));
        [M,N] = size(classifiy{1,i});
        A = reshape(classifiy{1,i},[N,M]);
        s{1,i} = s{1,i} + cov(A) * N;
    end
        
%求总离散度矩阵

    for i = 1:9
        W{i,i+1} = inv(s{1,i} + s{1,i+1}) * (m{1,i} - m{1,i+1});
    end
  
%求已知类别在w上的投影、求各类别样品在投影空间上的均值
    for i = 1:9
        y1 =cell2mat(classifiy(1,i));
        y2 = cell2mat(classifiy(1,i+1));
        W2 = cell2mat(W(i,i+1));
        Y{i,i+1} = W2' * y1;
        Y{i+1,i} = W2' * y2;
        [M,N] = size(Y{i,i+1});
        [Q,P] = size(Y{i+1,i});
        means{i,i+1} = mean(reshape(Y{i,i+1},[N,M]));
        means{i+1,i} = mean(reshape(Y{i+1,i},[P,Q]));
    end

%求阈值y0
    for i = 1:9
        [~,M] = size(classifiy{1,i});
        [~,N] = size(classifiy{1,i+1});
        y0{i,i+1} = (M * means{i,i+1} + N * means{i+1,i}) / (M + N);
    end
    
%对于未知样本，计算在W上的投影y
   cont = 0;
   site = 0;
   [~,M] = size(test_image);
   for step = 1:M
       sample = test_image(:,step);
       
       for i = 1:9
           A = cell2mat(W(i,i+1));
           y = (A' * sample)';
           B = cell2mat(y0(i,i+1));
           if y > B
              continue;
           else
               if i-1 == test_labels(step,:)
                  cont = cont + 1;
                  break;
               end
           end
       end
        %输出图片
       if mod(step,100) == 0
          site = site + 1;
          subplot(10,10,site);
          image = reshape(sample,[28,28]);
          imshow(image);
          title(i-1);
       end        
   end
   fprintf('正确率：%3.3f%%\n',100*cont/M);  
end











