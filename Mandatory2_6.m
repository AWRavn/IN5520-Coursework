clear all;
close all;

% Loading train image
train_img = load('mosaic1_train.txt');
test_img1 = load('mosaic2_test.txt');
test_img2 = load('mosaic3_test.txt');

% Quantizing to G gray levels
G = 16; % grayscale levels
train_img = uint8(round(double(train_img)*(G - 1)/double(max(train_img(:)))));
test_img1 = uint8(round(double(test_img1)*(G - 1)/double(max(test_img1(:)))));
test_img2 = uint8(round(double(test_img2)*(G - 1)/double(max(test_img2(:)))));

% Getting the feature images
windowSize = 31;
[Q1_1, Q1_2, Q1_4, Q2, Q4] = glidingGLCM(train_img, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4] = glidingGLCM(train_img, G, 1, 90, windowSize, 0);
feats = {Q1_2, K1_4, Q2, K2};

[Q1_1, Q1_2, Q1_4, Q2, Q4] = glidingGLCM(test_img1, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4] = glidingGLCM(test_img1, G, 1, 90, windowSize, 0);
feats1 = {Q1_2, K1_4, Q2, K2};

[Q1_1, Q1_2, Q1_4, Q2, Q4] = glidingGLCM(test_img2, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4] = glidingGLCM(test_img2, G, 1, 90, windowSize, 0);
feats2 = {Q1_2, K1_4, Q2, K2};

% Training
train_mask2 = load('mask_mosaic2_test.mat');
train_mask2 = cell2mat(struct2cell(train_mask2));
train_mask3 = load('mask_mosaic3_test.mat');
train_mask3 = cell2mat(struct2cell(train_mask3));
[labels2, means2, covs2] = multivatiateGaussianTrainer(feats, train_mask2);
[labels3, means3, covs3] = multivatiateGaussianTrainer(feats, train_mask3);

% Classification
[class1] = multivatiateGaussianClassifier(feats, labels2, means2, covs2);
[class2] = multivatiateGaussianClassifier(feats, labels3, means3, covs3);

% Evaluation
[acc1, avg_acc1, conf1] = multivatiateGaussianEvaluator(class1, 4)
[acc2, avg_acc2, conf2] = multivatiateGaussianEvaluator(class2, 4)

% Visualization
figure(2)
imagesc(class1); colorbar; title('Result on test image 1'); axis('square'); 
figure(3)
imagesc(class2); colorbar; title('Result on test image 2'); axis('square'); 