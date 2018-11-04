function test_C_pro = test_conditional_probability(test_C_pro, train_C_pro,first_image,sizes)
    for i = 1:10
        a = zeros(1,sizes);
%         a = zeros(1,784);
        for j = 1:sizes
%         for j = 1:784
            if first_image(j,1) == 0
               a(1,j) = train_C_pro(i,j);
            else
               a(1,j) = (1-train_C_pro(i,j));
            end
        end
        test_C_pro(1,i) = prod(a(1,:));
    end
end

