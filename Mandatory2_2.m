clear all;
close all;

texture1_90 = load('texture1dx0dymin1.txt');
texture2_90 = load('texture2dx0dymin1.txt');
texture3_90 = load('texture3dx0dymin1.txt');
texture4_90 = load('texture4dx0dymin1.txt');

% Quadrant 1.1
t1_90_q11 = texture1_90(1:4, 1:4);
t2_90_q11 = texture2_90(1:4, 1:4);
t3_90_q11 = texture3_90(1:4, 1:4);
t4_90_q11 = texture4_90(1:4, 1:4);

% Quadrant 1.2
t1_90_q12 = texture1_90(1:4, 5:8);
t2_90_q12 = texture2_90(1:4, 5:8);
t3_90_q12 = texture3_90(1:4, 5:8);
t4_90_q12 = texture4_90(1:4, 5:8);

% Quadrant 1.4
t1_90_q14 = texture1_90(5:8, 5:8);
t2_90_q14 = texture2_90(5:8, 5:8);
t3_90_q14 = texture3_90(5:8, 5:8);
t4_90_q14 = texture4_90(5:8, 5:8);

% Quadrant 2
t1_90_q2 = texture1_90(1:8, 9:16);
t2_90_q2 = texture2_90(1:8, 9:16);
t3_90_q2 = texture3_90(1:8, 9:16);
t4_90_q2 = texture4_90(1:8, 9:16);

% Quadrant 4
t1_90_q4 = texture1_90(9:16, 9:16);
t2_90_q4 = texture2_90(9:16, 9:16);
t3_90_q4 = texture3_90(9:16, 9:16);
t4_90_q4 = texture4_90(9:16, 9:16);

figure(1)
subplot(151); imagesc(t1_90_q11); title('Q1.1'); axis('square'); 
subplot(152); imagesc(t1_90_q12); title('Q1.2'); axis('square'); 
subplot(153); imagesc(t1_90_q14); title('Q1.4'); axis('square'); 
subplot(154); imagesc(t1_90_q2); title('Q2'); axis('square'); 
subplot(155); imagesc(t1_90_q4); title('Q4'); axis('square'); 
suptitle('Texture 1');

figure(2)
subplot(151); imagesc(t2_90_q11); title('Q1.1'); axis('square'); 
subplot(152); imagesc(t2_90_q12); title('Q1.2'); axis('square'); 
subplot(153); imagesc(t2_90_q14); title('Q1.4'); axis('square'); 
subplot(154); imagesc(t2_90_q2); title('Q2'); axis('square'); 
subplot(155); imagesc(t2_90_q4); title('Q4'); axis('square'); 
suptitle('Texture 2');

figure(3)
subplot(151); imagesc(t3_90_q11); title('Q1.1'); axis('square'); 
subplot(152); imagesc(t3_90_q12); title('Q1.2'); axis('square'); 
subplot(153); imagesc(t3_90_q14); title('Q1.4'); axis('square'); 
subplot(154); imagesc(t3_90_q2); title('Q2'); axis('square'); 
subplot(155); imagesc(t3_90_q4); title('Q4'); axis('square'); 
suptitle('Texture 3');

figure(4)
subplot(151); imagesc(t4_90_q11); title('Q1.1'); axis('square'); 
subplot(152); imagesc(t4_90_q12); title('Q1.2'); axis('square'); 
subplot(153); imagesc(t4_90_q14); title('Q1.4'); axis('square'); 
subplot(154); imagesc(t4_90_q2); title('Q2'); axis('square'); 
subplot(155); imagesc(t4_90_q4); title('Q4'); axis('square'); 
suptitle('Texture 4');