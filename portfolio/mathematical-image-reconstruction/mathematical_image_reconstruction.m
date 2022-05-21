%% Aharon Sebton - Advanced Engineering Mathematics Project 3 - Problem 2
%% Problem 2 - Part a
clear all; clc;                                             % Clear all variables and command window
I=imread('cameraman.tif');                                  % Store image from graphics file as matrix of grayscale values
figure(1)                                                   % Create new figure window
imshow(I)                                                   % Display grayscale image
title('Figure 1: Original cameraman.tif Grayscale Image')   % Give the image a title
%% Problem 2 - Part b
[M,D]=eig(double(I));                                       % Compute the eigenvalues and eigenvectors of image I
figure(2)                                                   % Create new figure window
plot(real(D),imag(D),'b*')                                  % Plot eigenvalues on the complex plane
xline(0,'b')                                                % Plot line along y-axis
yline(0,'b')                                                % Plot line along x-axis
xlabel('Real Part')                                         % Label x-axis on plot
ylabel('Imaginary Part')                                    % Label y-axis on plot
title('Figure 2: Plot of Eigenvalues of Image')             % Give the plot a title
grid on                                                     % Turn on the grid
%% Problem 2 - Part c
figure(3)                                                   % Create new figure window
plot(abs(D),'b*')                                           % Plot the magnitude of the eigenvalues
xline(0,'b')                                                % Plot line along y-axis
yline(0,'b')                                                % Plot line along x-axis
xlabel('Eigenvalues')                                       % Label x-axis on plot
ylabel('Magnitudes')                                        % Label y-axis on plot
title('Figure 3: Magnitude of Eigenvalues of Image')        % Give the plot a title
grid on                                                     % Turn on the grid
%% Problem 2 - Part d
[maxEV,maxLinIndex]=max(abs(D),[],'all','linear');          % Find the largest eigenvalue
[maxRow,maxCol]=ind2sub(size(D),maxLinIndex);               % Translate linear index into row and column indices
D1=zeros(size(D));                                          % Create new, empty eigenvalue matrix
D1(maxRow,maxCol)=D(maxRow,maxCol);                         % Copy largest eigenvalue from original D matrix
I1=M*D1*inv(M);                                             % Re-synthesize image matrix using D matrix with only the largest eigenvalue
figure(4)                                                   % Create new figure window
imshow(uint8(I1))                                           % Display re-synthesized image
title('Figure 4: Re-synthesized Image Using First Eigenvalue')  % Give the plot a title
error=sum(abs(I1)-abs(double(I)),'all')                     % Elementwise-subtract the absolute values of each matrix, and sum the differences
%% Problem 2 - Part e
newD=zeros(size(D));                                        % Create new, empty eigenvalue matrix
error=zeros(1,length(D));                                   % Create array to track calculated absolute error as eigenvalues are added
for i=1:length(D)                                           % For each eigenvalue,
    [maxEV,maxLinIndex]=max(abs(D),[],'all','linear');      % Find the largest eigenvalue remaining in D matrix
    [maxRow,maxCol]=ind2sub(size(D),maxLinIndex);           % Translate linear index into row and column indices
    newD(maxRow,maxCol)=D(maxRow,maxCol);                   % Copy largest eigenvalue from original D matrix
    D(maxRow,maxCol)=0;                                     % Remove largest eigenvalue from original D matrix, allowing us to find the next-largest eigenvalue upon each loop iteration
    newI=M*newD*inv(M);                                     % Re-synthesize image matrix using D matrix with i largest eigenvalues
    error(i)=sum(abs(newI)-abs(double(I)),'all');           % Elementwise-subtract the absolute values of each matrix, and sum the differences
    switch i                                                % Use switch cases to extract only select re-synthesized images
        case 1                                              % If only the largest eigenvalue was used
            I1=uint8(newI);                                 % Convert the image values and store them before they are overwritten
        case 5                                              % If the largest five eigenvalues were used
            I5=uint8(newI);                                 % Convert the image values and store them before they are overwritten
        case 50                                             % If the largest fifty eigenvalues were used
            I50=uint8(newI);                                % Convert the image values and store them before they are overwritten
        case 100                                            % If the largest 100 eigenvalues were used
            I100=uint8(newI);                               % Convert the image values and store them before they are overwritten
        case 200                                            % If the largest 200 eigenvalues were used
            I200=uint8(newI);                               % Convert the image values and store them before they are overwritten
        case length(D)                                      % If all of the eigenvalues were used
            Ifull=uint8(newI);                              % Convert the image values and store them before they are overwritten
    end
end
%% Problem 2 - Part f
figure(5)                                                   % Create new figure window
imshow(I5)                                                  % Display re-synthesized image
title('Figure 5: Re-synthesized Image Using First Five Eigenvalues')    % Give the plot a title
figure(6)                                                   % Create new figure window
imshow(I50)                                                 % Display re-synthesized image
title('Figure 6: Re-synthesized Image Using First Fifty Eigenvalues')   % Give the plot a title
figure(7)                                                   % Create new figure window
imshow(I100)                                                % Display re-synthesized image
title('Figure 7: Re-synthesized Image Using First 100 Eigenvalues')     % Give the plot a title
figure(8)                                                   % Create new figure window
imshow(I200)                                                % Display re-synthesized image
title('Figure 8: Re-synthesized Image Using First 200 Eigenvalues')     % Give the plot a title
figure(9)                                                   % Create new figure window
imshow(Ifull)                                               % Display re-synthesized image
title('Figure 9: Re-synthesized Image Using All Eigenvalues')           % Give the plot a title
%% Problem 2 - Part g
numvalues=1:length(D);                                      % Create array of integers from 1 to the total number of eigenvalues
figure(10)                                                  % Create new figure window
plot(numvalues,error)                                       % Plot the absolute error as a function of the number of eigenvalues used
xlabel('Number of Eigenvalues Used')                        % Label x-axis on plot
ylabel('Absolute Error')                                    % Label y-axis on plot
title('Figure 10: Re-synthesis Absolute Error vs Number of Eigenvalues Used')   % Give the plot a title
grid on                                                     % Turn on the grid