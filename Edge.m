+clear all;
close all;

%Load the image 'eleph2.jpg'

I=imread('eleph2.jpg');


%Plot the original image

figure,imagesc(I); title("Original");

%Convert from RGB to gray scale and the to double

I=rgb2gray(I);
I=double(I);

%Plot the Black and White image

figure, imagesc(I);
colormap('gray');
title("BW");

%Define the window dimension, first try with window size 3x3, after change
%window size and see what will happen if we increase sliding window
%in this step we just define dimension of the sliding window

sz=3;



%Define the matrix containg the result, creating matrix of zeros with
%original image size

Output=zeros(size(I));

%Zero padding

mn=floor(sz/2);
I=padarray(I, [mn mn]);

%Compute local variance of the image and save results in matrix defined to
%cointain results

for i=1:size(I,1)-mn*2 
    
    for j=1:size(I,2)-mn*2 
        
        tmp = I(i:i+(sz-1),j:j+(sz-1));
        mu = mean(tmp(:));
        
        tmp2 = mean(tmp(:).^2);
        Output(i,j)=tmp2 - mu.^2;
        
    end
end




%Plot resulting matrix which cointains local variance

figure, imagesc(Output);colormap('gray');

%Define a Threshold
treshold=mean(Output(:));

%reshape matrix into column vector

%Set the pixel values based on threshold
Edges=zeros(size(Output));

Edges(Output<treshold)=1;
Edges(Output>=treshold)=0;


%Plot detected edges

figure,imagesc(Edges), colormap('gray');
