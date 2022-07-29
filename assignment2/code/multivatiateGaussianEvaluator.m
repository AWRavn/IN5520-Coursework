function [acc, avg_acc, conf] = multivatiateGaussianEvaluator(class, class_cnt)

% Buffers for resulting matrices
acc = zeros(1, class_cnt);
conf = zeros(class_cnt);

[N, M] = size(class);

% Calculate the confusion matrix and accuracy counts
for n = 1:N
    for m = 1:M
        if n <= N/2
            if m <= M/2
                conf(1, class(n, m)) = conf(1, class(n, m)) + 1;
                if class(n, m) == 1
                    acc(1) = acc(1) + 1;
                end
            else
                conf(2, class(n, m)) = conf(2, class(n, m)) + 1;
                if class(n, m) == 2
                    acc(2) = acc(2) + 1;
                end
            end
        else
            if m <= M/2
                conf(3, class(n, m)) = conf(3, class(n, m)) + 1;
                if class(n, m) == 3
                    acc(3) = acc(3) + 1;
                end
            else
                conf(4, class(n, m)) = conf(4, class(n, m)) + 1;
                if class(n, m) == 4
                    acc(4) = acc(4) + 1;
                end
            end
        end
    end
end

% Calculate accuracy percentage and average
acc = acc./(N/2)^2;
avg_acc = mean(acc);
end