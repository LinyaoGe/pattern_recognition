% test_images = loadImages('/Users/miracle/Documents/MATLAB/Bayes_minst/t10k-images-idx3-ubyte');
% test_labels = loadLabels('/Users/miracle/Documents/MATLAB/Bayes_minst/t10k-labels-idx1-ubyte');

function divideds_images = divided_images(test_images)

    divideds_images = zeros(49,length(test_images));

    for l = 1:length(test_images)
        b = zeros(7,7);%¸¨Öú¾ØÕó
        init_images = test_images(:,l);
        init_images = reshape(init_images,[28,28]);

        %4*4·Ö¸î
        division = mat2cell(init_images,[4,4,4,4,4,4,4],[4,4,4,4,4,4,4]);
        for i = 1:7
            for j = 1:7
                c = division{i,j};
                c = reshape(c, [1,16]);
                counts = 0;
                for k = 1:16
                    if c(:,k) ~= 0
                        counts = counts +1;
                    end
                end
                if counts / 16 >0.5
                    b(i,j) = 1;
                else
                    b(i,j) = 0;
                end
            end
        end
        b = reshape(b,[1,49]);
        for m = 1:49
            divideds_images(m,l) = b(:,m);
        end

    end
end

% a = divided_images(:,50);
% a = reshape(a,[7,7]);
% imshow(a);
