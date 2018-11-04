function final_count = countNum(initial_count,label_num)
    i  = label_num;
    i = i + 1;
    initial_count(1,i) = initial_count(1,i) + 1;
    final_count = initial_count(1:10);
end
