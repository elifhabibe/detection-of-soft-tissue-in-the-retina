load traindata traindatahist
img = imread('C:\Users\90543\Desktop\diaretdb1_toolkit_v_1_1\images\ddb1_fundusimages\image019.png');
result = cl_classify(traindatahist, img, 0.05);
result = bwareaopen(result,10);
result = imfill(result,'holes');
imshow(result);
%subplot(1,3,2); image(repmat(result,[1 1 3]).*(double(img)/255));

