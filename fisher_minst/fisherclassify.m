function classify = fisherclassify(w1,w2,sample)
    p = size(w1,1);
    q = size(w2,1);
    
    %求两类样品均值向量
    m1 = (mean(w1))';
    m2 = (mean(w2))';
    
    %求两类样品类内离散度矩阵
    s1 = cov(w1)*(p-1);
    s2 = cov(w2)*(q-1);

    %求总类间离散度矩阵
    sw = s1 + s2;
    
    %求样品类间离散度矩阵
    sb = (m1 - m2)*(m1 - m2)';
    
    %求w
    w = inv(sw).*(m1 - m2);
    
    %求已知类别在w上的投影
    y1 = w'*w1';
    y2 = w'*w2';
    
    %显示已知类别的投影
    y = y1';
    y = sortrows(y,1);
    plot(y(:,1),y(:,2),'r-');
    hold on;
    y = y2';
    y = sortrows(y,1);
    plot(y(:,1),y(:,2),'b-');
    hold on;
    
    %求各类别样品在投影空间上的均值
    mean1 = mean(y1');
    mean2 = mean(y2');
    %求阈值y0
    y0 = (p*mean1 + q*mean2) / (p + q);
    
    %对于未知样本sample,计算在w上的投影y
    y = w'*sample';
    y = y';
    
    %根据决策规则分类
    for i = 1:6
        if y(i,:) > y0
            plot(y(i,1),y(i,2),'k>')

        else
            plot(y(i,1),y(i,2),'g>')

        end
    end
    
end










