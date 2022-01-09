function [Q1_1, Q1_2, Q1_4, Q2, Q4] = glidingGLCM(img, G, d, theta, w_s, iso)
% Calculate the feature of GLCM for every gliding window in an image. It 
% adds a frame to the image first so that the resulting image is the same 
% size as input.
% iso : 1 for isometric GLCM, 0 otherwise

[M_o, N_o] = size(img); % Original image size
h_s = floor(w_s/2); % Size of half the filter

% Apply the zero-padding to the original image
imgPadded = zeros(M_o + w_s - 1, N_o + w_s - 1);
imgPadded(h_s:end - h_s - 1, h_s:end - h_s - 1) = img;

[M, N] = size(imgPadded); % Padded image size

% Buffers for resulting images
Q1_1 = zeros(M_o, N_o);
Q1_2 = zeros(M_o, N_o);
Q1_4 = zeros(M_o, N_o);
Q2 = zeros(M_o, N_o);
Q4 = zeros(M_o, N_o);

% Go through the image
for m = (h_s + 1):(M - h_s - 1)
    for n = (h_s + 1):(N - h_s - 1)
        
        % Extracting the window
        window = imgPadded(m - h_s:m + h_s, ...
            n - h_s:n + h_s);
        
        % Calculating the GLCM
        if iso == 1
            p = isoGLCM(window, G, d);
        else
            p = GLCM(window, G, d, theta);
        end
   
        % Calculating the features
        Q1_1(m - h_s, n - h_s) = sum(sum(p(1:4, 1:4)))/sum(sum(p(1:8, 1:8)));
        Q1_2(m - h_s, n - h_s) = sum(sum(p(1:4, 5:8)))/sum(sum(p(1:8, 1:8)));
        Q1_4(m - h_s, n - h_s) = sum(sum(p(5:8, 5:8)))/sum(sum(p(1:8, 1:8)));
        Q2(m - h_s, n - h_s) = sum(sum(p(1:8, 9:16)))/sum(sum(p));
        Q4(m - h_s, n - h_s) = sum(sum(p(1:8, 9:16)))/sum(sum(p));
        
    end
end
end