%% Aharon Sebton - Advanced Engineering Mathematics Project 2 - Problem 2
%% Problem 2 - Part a
clear all; clc;                                     % Clear all variables and command window
I=imread('cameraman.tif');                          % Store image from graphics file as matrix of grayscale values
figure(1)                                           % Create new figure window
imshow(I)                                           % Display grayscale image
title('Figure 1: Original cameraman.tif Grayscale Image')   % Give the image a title
%% Problem 2 - Part b
Gx=[-1 -1 -1;0 0 0;1 1 1];                          % Define Gx kernel
PDx=imfilter(I,Gx);                                 % Compute horizontal gradient of image (partial derivative wrt x) by convolving with Gx
figure(2)                                           % Create new figure window
imshow(PDx)                                         % Display horizontal gradient
title('Figure 2: Horizontal Gradient of Image')     % Give the image a title
%% Problem 2 - Part c
Gy=[-1 0 1;-1 0 1;-1 0 1];                          % Define Gy kernel
PDy=imfilter(I,Gy);                                 % Compute vertical gradient of image (partial derivative wrt y) by convolving with Gy
figure(3)                                           % Create new figure window
imshow(PDy)                                         % Display vertical gradient
title('Figure 3: Vertical Gradient of Image')       % Give the image a title
%% Problem 2 - Part d
magdel=sqrt(double(PDx).^2+double(PDy).^2);         % Compute magnitude of the gradient
figure(4)                                           % Create new figure window
imshow(magdel)                                      % Display magnitude of the gradient
title('Figure 4: Magnitude of Gradient of Image')   % Give the image a title
%% Problem 2 - Part e
H=[0 1 0;1 -4 1;0 1 0];                             % Define H kernel
lap=imfilter(I,H);                                  % Compute laplacian of image by convolving with H
figure(5)                                           % Create new figure window
imshow(lap)                                         % Display laplacian of the image
title('Figure 5: Laclacian of Image')               % Give the image a title
%% Problem 2 - Part g
I=imread('peppers.png');                            % Store image from graphics file as matrix of RGB values
Ig=rgb2gray(I);                                     % Convert RGB image matrix to matrix of grayscale values and store
figure(6)                                           % Create new figure window
subplot(1,2,1)                                      % Format figure as side-by-side comparison between two images and select left side
imshow(I)                                           % Display RGB image on the left
title('RGB Image')                                  % Give the RGB image a title
subplot(1,2,2)                                      % Select right side of comparison figure
imshow(Ig)                                          % Display grayscale image on the right
title('Grayscale Image')                            % Give the grayscale image a title
sgtitle('Figure 6: peppers.png RGB Image vs. Grayscale Image','FontWeight','bold')   % Give the overall image a title
%% Problem 2 - Part h
PDx=imfilter(Ig,Gx);                                % Compute horizontal gradient of image (partial derivative wrt x) by convolving with Gx
figure(7)                                           % Create new figure window
imshow(PDx)                                         % Display horizontal gradient
title('Figure 7: Horizontal Gradient of Image')     % Give the image a title
PDy=imfilter(Ig,Gy);                                % Compute vertical gradient of image (partial derivative wrt y) by convolving with Gy
figure(8)                                           % Create new figure window
imshow(PDy)                                         % Display vertical gradient
title('Figure 8: Vertical Gradient of Image')       % Give the image a title
magdel=sqrt(double(PDx).^2+double(PDy).^2);         % Compute magnitude of the gradient
figure(9)                                           % Create new figure window
imshow(magdel)                                      % Display magnitude of the gradient
title('Figure 9: Magnitude of Gradient of Image')   % Give the image a title
lap=imfilter(Ig,H);                                 % Compute laplacian of image by convolving with H
figure(10)                                          % Create new figure window
imshow(lap)                                         % Display laplacian of the image
title('Figure 10: Laclacian of Image')              % Give the image a title

image=zeros(300,300,3);                             % Create blank image
RGB1=[0.3 0.4 0.4];                                 % Choose arbitrary RGB color values between 0 and 1

% MATLAB rgb2gray documentation states the following:

% rgb2gray converts RGB values to grayscale values by forming a weighted sum of the R, G, and B components:
% 0.2989 * R + 0.5870 * G + 0.1140 * B

% To find another RGB value combination with the same grayscale value, use rgb2gray algorithm equation

RGB2=[RGB1(2)*0.587/0.2989 RGB1(3)*0.114/0.587 RGB1(1)*0.2989/0.114]; % Compute new R from old G, new G from old B, and new B from old R

image(:,1:100,1)=RGB1(1);                           % Add R portion of first color (arbitrarily chosen) to image
image(:,1:100,2)=RGB1(2);                           % Add G portion of first color (arbitrarily chosen) to image
image(:,1:100,3)=RGB1(3);                           % Add B portion of first color (arbitrarily chosen) to image

image(:,101:200,1)=RGB2(1);                         % Add R portion of new color (carefully computed) to image
image(:,101:200,2)=RGB2(2);                         % Add G portion of new color (carefully computed) to image
image(:,101:200,3)=RGB2(3);                         % Add B portion of new color (carefully computed) to image

image(:,201:300,3)=1;                               % Add 100% blue to image as a control

figure(11)                                          % Create new figure window
imshow(image)                                       % Display RGB image
title('Figure 11: Constructed Image with Chosen RGB1, Computed RGB2, and Pure Blue for Control')    % Give the image a title
g=rgb2gray(image);                                  % Convert RGB image matrix to matrix of grayscale values and store
figure(12)                                          % Create new figure window
imshow(g)                                           % Display grayscale image
title('Figure 12: Grayscale Image Derived from Figure 11 RGB Image')    % Give the image a title
PDx=imfilter(g,Gx);                                 % Compute horizontal gradient of image (partial derivative wrt x) by convolving with Gx
PDy=imfilter(g,Gy);                                 % Compute vertical gradient of image (partial derivative wrt y) by convolving with Gy
magdel=sqrt(double(PDx).^2+double(PDy).^2);         % Compute magnitude of the gradient
figure(13)                                          % Create new figure window
imshow(magdel)                                      % Display magnitude of the gradient
title('Figure 13: Magnitude of Gradient of Image')  % Give the image a title
lap=imfilter(g,H);                                  % Compute laplacian of image by convolving with H
figure(14)                                          % Create new figure window
imshow(lap)                                         % Display laplacian of the image
title('Figure 14: Laplacian of Image')              % Give the image a title