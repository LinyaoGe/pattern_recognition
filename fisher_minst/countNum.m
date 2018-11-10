function results = countNum(Ni,labels)
    [M,N] = size(labels);
    for i = 1:M
        nums = labels(i,:);
        nums = nums + 1;
        Ni(1,nums) = Ni(1,nums) + 1;
    end
    results = Ni;
end
