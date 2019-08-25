% Semi-Decoupled Image Decomposition for Low-Light Enhancement based on Gaussian Total Variation 

% Input:
% im      - the input image

% Output:
% I       - the illumination layer
% R       - the re?ectance layer


% Sample run:

% inputPre = '.\input_images\1';
% gamma = 2.2;
% im = im2double(imread([inputPre,'.bmp']));


clc;
clear;
close all;
inputPre = '.\input_images\1';
gamma = 2.2;
im = im2double(imread([inputPre,'.bmp']));
tic
[I, R] = main(im);
enhance  = R.*repmat(I.^(1/gamma),[1,1,3]);
toc
figure; imshow([im,enhance]); title('input & output');
figure;imshow([R,repmat(I,[1,1,3])]);title('R & I');
