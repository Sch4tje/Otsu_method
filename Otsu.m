
Im=imread('C:\Users\sro-c\Desktop\ketcap.png');
GrayIm=im2gray(Im);
imshow(GrayIm)
h=imhist(GrayIm);
imhist(GrayIm);

ToplamPiksel= sum(h);
Olasilik= h/ToplamPiksel ;
Maksimum_varyans=0;
Sigma=zeros(1,256);

for z= 2:256
    Wb= sum(Olasilik(1:z));
    Wf= sum(Olasilik(z+1:256));
    Ub= dot(0:z-1,Olasilik(1:z))/ Wb;
    Uf= dot(z:255,Olasilik(z+1:256))/ Wf;
    Sigma(z)= Wb*Wf*((Ub-Uf)^2);
end

Maksimum_varyans = max(Sigma);
L = find(Sigma==Maksimum_varyans);
Threshold = L-1;


imshow(GrayIm>Threshold)
subplot(2,2,1);imshow(GrayIm)
title('\fontsize{20} Gri-ton görüntü')
subplot(2,2,2);imhist(GrayIm)
title('\fontsize{20} Gri-ton görüntünün histogramı')
subplot(2,2,4);imhist(GrayIm)
title({'\fontsize{20} Otsu metod uygulanmış görüntünün histogramı';'T=175'})
subplot(2,2,3);imshow(GrayIm>Threshold)
title('\fontsize{20} Otsu metodu uygulanmış görüntü')










    
    
    










