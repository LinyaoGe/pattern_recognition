function Bayes_work(sizes)
    images = loadImages('/Users/miracle/Documents/MATLAB/Bayes_minst/train-images-idx3-ubyte');
    labels = loadLabels('/Users/miracle/Documents/MATLAB/Bayes_minst/train-labels-idx1-ubyte');
    test_images = loadImages('/Users/miracle/Documents/MATLAB/Bayes_minst/t10k-images-idx3-ubyte');
    test_labels = loadLabels('/Users/miracle/Documents/MATLAB/Bayes_minst/t10k-labels-idx1-ubyte');
    
    if sizes == 49
        images = divided_images(images);
        test_images = divided_images(test_images);
    end
    
    % 计算数字Ni的样品数
    finial_count = zeros(1,10); 
    for i = 1:60000
        labels_num = labels(i,1);
        finial_count = countNum(finial_count,labels_num);
    end

    % 先验概率
    Prior_probability = zeros(1,10);
    for i = 1:10
        Prior_probability(1,i) = finial_count(1,i)/60000;
    end

    % 训练样本条件概率
    train_C_pro = zeros(10,sizes);
    % train_C_pro = zeros(10,784);
    train_C_pro = Conditional_probability(images,labels,train_C_pro,finial_count,sizes);

    
%-----------------------------------测试----------------------------------------------
    counts = 0;
    site = 0;
    for l = 1:10000
        images = test_images(:,l);

        %测试样本的类条件概率
        test_C_pro = zeros(1,10);
        test_Px = test_conditional_probability(test_C_pro,train_C_pro,images,sizes);

        %利用贝叶斯求后验概率
        posterior_probability = zeros(1,10);
        for k = 1:10
            denominator = sum(Prior_probability(1,k).*test_Px(1,k));
        end

        for i = 1:10
            posterior_probability(1,i) = Prior_probability(1,i) .* test_Px(1,i) ./ denominator;
        end

        [M,N] = max(posterior_probability(1,:));
        if N-1 == test_labels(i,:)
            counts = counts + 1;
        end

        if mod(l,100) == 0
           site = site + 1;
           subplot(10,10,site);
           if sizes == 49
              show_images = reshape(images,[7,7]);
           else
              show_images = reshape(images,[28,28]);
           end
           imshow(show_images);
           title(N-1);
        end

    end

    fprintf('正确率：%3.3f%%\n',100*counts/10000);
end

