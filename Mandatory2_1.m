clear all;
close all;

texture1_90 = load('texture1dx0dymin1.txt');
texture2_90 = load('texture2dx0dymin1.txt');
texture3_90 = load('texture3dx0dymin1.txt');
texture4_90 = load('texture4dx0dymin1.txt');

figure(1)
subplot(221); imagesc(texture1_90); title('Texture 1');
subplot(222); imagesc(texture2_90); title('Texture 2');
subplot(223); imagesc(texture3_90); title('Texture 3');
subplot(224); imagesc(texture4_90); title('Texture 4');
suptitle('Angle 90; dx=0 dy=-1');


texture1_0 = load('texture1dx1dy0.txt');
texture2_0 = load('texture2dx1dy0.txt');
texture3_0 = load('texture3dx1dy0.txt');
texture4_0 = load('texture4dx1dy0.txt');

figure(2)
subplot(221); imagesc(texture1_0); title('Texture 1');
subplot(222); imagesc(texture2_0); title('Texture 2');
subplot(223); imagesc(texture3_0); title('Texture 3');
subplot(224); imagesc(texture4_0); title('Texture 4');
suptitle('Angle 0; dx=1 dy=0');


texture1_45 = load('texture1dx1dymin1.txt');
texture2_45 = load('texture2dx1dymin1.txt');
texture3_45 = load('texture3dx1dymin1.txt');
texture4_45 = load('texture4dx1dymin1.txt');

figure(3)
subplot(221); imagesc(texture1_45); title('Texture 1');
subplot(222); imagesc(texture2_45); title('Texture 2');
subplot(223); imagesc(texture3_45); title('Texture 3');
subplot(224); imagesc(texture4_45); title('Texture 4');
suptitle('Angle 45; dx=1 dy=-1');


texture1_135 = load('texture1dxmin1dymin1.txt');
texture2_135 = load('texture2dxmin1dymin1.txt');
texture3_135 = load('texture3dxmin1dymin1.txt');
texture4_135 = load('texture4dxmin1dymin1.txt');

figure(4)
subplot(221); imagesc(texture1_135); title('Texture 1');
subplot(222); imagesc(texture2_135); title('Texture 2');
subplot(223); imagesc(texture3_135); title('Texture 3');
subplot(224); imagesc(texture4_135); title('Texture 4');
suptitle('Angle 135; dx=-1 dy=-1');