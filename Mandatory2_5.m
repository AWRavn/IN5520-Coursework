clear all;
close all;

% Loading train image
train_img = load('mosaic1_train.txt');

% Quantizing to G gray levels
G = 16; % grayscale levels
train_img = uint8(round(double(train_img)*(G - 1)/double(max(train_img(:)))));

% Getting the feature images
windowSize = 31;
[Q1_1, Q1_2, Q1_4, Q2, Q4] = glidingGLCM(train_img, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4] = glidingGLCM(train_img, G, 1, 90, windowSize, 0);

feats = {Q1_2, K1_4, Q2, K2};

% Training
train_mask = load('training_mask.txt');
[labels, means, covs] = multivatiateGaussianTrainer(feats, train_mask);

% Classification
[class] = multivatiateGaussianClassifier(feats, labels, means, covs);

% Evaluation
[acc, avg_acc, conf] = multivatiateGaussianEvaluator(class, 4)

% Visualization
figure(1)
imagesc(class); colorbar; title('Result on training image'); axis('square'); 


% Loading test image 1 and 2
test_img1 = load('mosaic2_test.txt');
test_img2 = load('mosaic3_test.txt');

% Quantizing to G gray levels
G = 16; % grayscale levels
test_img1 = uint8(round(double(test_img1)*(G - 1)/double(max(test_img1(:)))));
test_img2 = uint8(round(double(test_img2)*(G - 1)/double(max(test_img2(:)))));

% Getting the feature images
windowSize = 31;
[Q1_1, Q1_2, Q1_4, Q2, Q4] = glidingGLCM(test_img1, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4] = glidingGLCM(test_img1, G, 1, 90, windowSize, 0);
feats1 = {Q1_2, K1_4, Q2, K2};

[Q1_1, Q1_2, Q1_4, Q2, Q4] = glidingGLCM(test_img2, G, 1, 0, windowSize, 0);
[K1_1, K1_2, K1_4, K2, K4] = glidingGLCM(test_img2, G, 1, 90, windowSize, 0);
feats2 = {Q1_2, K1_4, Q2, K2};

% Classification
[class1] = multivatiateGaussianClassifier(feats1, labels, means, covs);
[class2] = multivatiateGaussianClassifier(feats2, labels, means, covs);

% Evaluation
[acc1, avg_acc1, conf1] = multivatiateGaussianEvaluator(class1, 4)
[acc2, avg_acc2, conf2] = multivatiateGaussianEvaluator(class2, 4)

% Visualization
figure(2)
imagesc(class1); colorbar; title('Result on test image 1'); axis('square'); 
figure(3)
imagesc(class2); colorbar; title('Result on test image 2'); axis('square'); 