function [class] = multivatiateGaussianClassifier(feats, labels, means, covs)

[N, M] = size(feats{1});
class = zeros(N, M);
feat_cnt = numel(feats);
class_cnt = numel(labels);

for n = 1:N
    for m = 1:M
        G_cnt = zeros(feat_cnt, 1);
        
        for i = 1:feat_cnt
            img = feats{i};
            G = double(img(n, m));
            G_cnt(i) = G;
        end
        
        max_class = 0;
        max_val = 0;
        
        for i = 1:class_cnt
            cov = covs(:, :, i);
            
            gauss = - (1/2)*(G_cnt - means(:, i))'*inv(cov)* ...
                (G_cnt - means(:, i)) - (feat_cnt/2)*log(2*pi) - ...
                (1/2)*log(det(cov)) + log(1/class_cnt);
            
            if i == 1 || gauss > max_val
                max_class = labels(i);
                max_val = gauss;
            end
        end
        class(n, m) = max_class;
    end
end
end

            