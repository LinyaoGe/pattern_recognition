function final_probability = Conditional_probability(images,labels,initial_matrix,finial_count,sizes)
    for k = 1:sizes
%     for k = 1:784
        for i = 1:length(images(1,:))
            Number = labels(i,:);%获取数字数
            zero_or_one = images(k,i);
            if zero_or_one == 0
               initial_matrix(Number+1,k) = initial_matrix(Number+1,k) + 1;
            end
        end
    end
    for k = 1:sizes
%     for k = 1:784
        for j = 1: 10
            initial_matrix(j,k) = (initial_matrix(j,k) + 1) ./ (finial_count(:,j) + 2);
        end
    end
    final_probability = initial_matrix;
end










