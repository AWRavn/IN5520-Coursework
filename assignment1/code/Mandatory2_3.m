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

% Visualizing the feature images
figure(1)
subplot(151); imagesc(Q1_1); title('Q1.1'); axis('square'); 
subplot(152); imagesc(Q1_2); title('Q1.2'); axis('square'); 
subplot(153); imagesc(Q1_4); title('Q1.4'); axis('square'); 
subplot(154); imagesc(Q2); title('Q2'); axis('square'); 
subplot(155); imagesc(Q4); title('Q4'); axis('square'); 
suptitle('0 degree angle');

figure(2)
subplot(151); imagesc(K1_1); title('Q1.1'); axis('square'); 
subplot(152); imagesc(K1_2); title('Q1.2'); axis('square'); 
subplot(153); imagesc(K1_4); title('Q1.4'); axis('square'); 
subplot(154); imagesc(K2); title('Q2'); axis('square'); 
subplot(155); imagesc(K4); title('Q4'); axis('square'); 
suptitle('90 degree angle');