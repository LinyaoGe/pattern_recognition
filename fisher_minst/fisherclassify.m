function classify = fisherclassify(w1,w2,sample)
    p = size(w1,1);
    q = size(w2,1);
    
    %��������Ʒ��ֵ����
    m1 = (mean(w1))';
    m2 = (mean(w2))';
    
    %��������Ʒ������ɢ�Ⱦ���
    s1 = cov(w1)*(p-1);
    s2 = cov(w2)*(q-1);

    %���������ɢ�Ⱦ���
    sw = s1 + s2;
    
    %����Ʒ�����ɢ�Ⱦ���
    sb = (m1 - m2)*(m1 - m2)';
    
    %��w
    w = inv(sw).*(m1 - m2);
    
    %����֪�����w�ϵ�ͶӰ
    y1 = w'*w1';
    y2 = w'*w2';
    
    %��ʾ��֪����ͶӰ
    y = y1';
    y = sortrows(y,1);
    plot(y(:,1),y(:,2),'r-');
    hold on;
    y = y2';
    y = sortrows(y,1);
    plot(y(:,1),y(:,2),'b-');
    hold on;
    
    %��������Ʒ��ͶӰ�ռ��ϵľ�ֵ
    mean1 = mean(y1');
    mean2 = mean(y2');
    %����ֵy0
    y0 = (p*mean1 + q*mean2) / (p + q);
    
    %����δ֪����sample,������w�ϵ�ͶӰy
    y = w'*sample';
    y = y';
    
    %���ݾ��߹������
    for i = 1:6
        if y(i,:) > y0
            plot(y(i,1),y(i,2),'k>')

        else
            plot(y(i,1),y(i,2),'g>')

        end
    end
    
end










