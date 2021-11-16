function mygraythresh
global H Index;
img=imread('C:\Users\90543\Desktop\proje\ddb1_groundtruth\diaretdb0_v_1_1\resources\images\diaretdb0_fundus_images\image013.png');
imshow(img);

load traindata traindatahist
a = cl_classify(traindatahist, img, 0.05);
a = bwareaopen(a,10);
a = imfill(a,'holes');
%imshow(a);
%subplot(1,3,2); image(repmat(result,[1 1 3]).*(double(img)/255));

gray=rgb2gray(img);
%adaptif histogram eþitleme filtresi
I = gray;
A = adapthisteq(I,'clipLimit',0.02,'Distribution','rayleigh');
%medyan filtre
I2=A 
no=imnoise(I2,'salt & pepper',0.02);
B=medfilt2(no); 


V=reshape(B,[],1);%MEDYAN FÝLTRE SONUCU ÇIKAN GÖRÜNTÜYÜ VERDÝK
G=hist(V,0:255);

H=reshape(G,[],1);
Ind=0:255;
Index=reshape(Ind,[],1);
result=zeros(size([1 256]));
 
 for i=0:255
    [wbk,varbk]=calculate(1,i);
    [wfg,varfg]=calculate(i+1,255);
    result(i+1)=(wbk*varbk)+(wfg*varfg);
end
                 
 [threshold_value,val]=min(result);
 tval=(val-1)/256;
 bin_im=im2bw(a,tval);
%figure,imshow(bin_im);

   function [weight,var]=calculate(m,n)

     weight=sum(H(m:n))/sum(H);
     value=H(m:n).*Index(m:n);
     total=sum(value);
     mean=total/sum(H(m:n));

     if(isnan(mean)==1)
       mean=0;
     end

 value2=(Index(m:n)-mean).^2;
 numer=sum(value2.*H(m:n));
 var=numer/sum(H(m:n));

    if(isnan(var)==1)
      var=0;
    end

   end
%mra ve ýcm 

I=double(bin_im);
class_number=3;
potential=0.5;
maxIter=30;
seg=ICM(I,class_number,potential,maxIter);
figure;
imshow(I);
end 
