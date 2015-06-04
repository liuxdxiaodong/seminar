close all
clear
clc

I = imread('IMG_4598.JPG');
figure,imshow(I)
hsv_image = rgb2hsv(I);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
H = hsv_image(:,:,1)*255;
S = hsv_image(:,:,2)*255;
V = hsv_image(:,:,3)*255;

[x,y,z] = size(I);
for i = 1:x
    for j = 1:y
        if(((H(i,j)>40)&&(H(i,j)<70 ))&&(V(i,j)>20)&&(S(i,j)>40))
            H(i,j) = H(i,j);
            S(i,j) = S(i,j);
            V(i,j) = V(i,j);
        else
            H(i,j) = 0;
            S(i,j) = 0;
            V(i,j) = 0;
        end
    end
end

hsv_dst(:,:,1) = H/255;
hsv_dst(:,:,2) = V/255;
hsv_dst(:,:,3) = S/255;
dst = hsv2rgb(hsv_dst);
figure, imshow(dst)
%centre = findcentre(R,G,B,H);