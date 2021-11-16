clear
clc
%MSE-----------------

im=imread('C:\Users\90543\Desktop\proje\ddb1_groundtruth\diaretdb0_v_1_1\resources\images\diaretdb0_fundus_images\image036.png');
im=im2double(im);
h1=1/9*ones(3,3);
imf1=imfilter(im,h1,'replicate');
h2=1/25*ones(5,5);
imf2=imfilter(im,h2,'replicate');
MSE1=mean(mean((im-imf1).^2));
MSE2=mean(mean((im-imf2).^2));
MaxI=1;


PSNR1=10*log10((MaxI^2)/MSE1);
PSNR2=10*log10((MaxI^2)/MSE2);