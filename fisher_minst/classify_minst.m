function classify = classify_minst(train_image,train_label)
    class_num = zeros(1,10);
    C = num2cell(class_num);
    for i = 1:10
        C{1,i} = [];
    end
    
    [~,N] = size(train_image);
    for i = 1:N
        label = train_label(i,:);
        C{1,label+1} = [C{1,label+1} , train_image(:,i)];
        
    end 
    fprintf('分类成功');
    classify = C;
end

