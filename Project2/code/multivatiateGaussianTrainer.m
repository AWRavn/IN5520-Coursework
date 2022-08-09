function [labels, means, covs] = multivatiateGaussianTrainer(feats, train_mask)

% Buffers for resulting matrices
labels = unique(train_mask(train_mask > 0));
label_cnt = numel(labels);
feat_cnt = numel(feats);
means = zeros(feat_cnt, label_cnt);
covs = zeros(feat_cnt, feat_cnt, label_cnt);

% For each label
for i = 1:label_cnt
    mask = (train_mask == labels(i));
    
    % Calculate means
    means_tmp = zeros(feat_cnt, 1);
    feats_masked = [];   
    for j=1:feat_cnt
        masked_img = feats{j}(mask == true); 
        [n, m] = size(masked_img);
        means_tmp(j) = sum(masked_img(:)) / (n*m);
        feats_masked = [feats_masked masked_img];
    end
    means(:, i) = means_tmp;
    
    % Calculate covariances
    covs(:, :, i) = cov(double(feats_masked));
end
end

    
        