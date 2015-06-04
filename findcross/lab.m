close all
clear
clc

I = imread('IMG_4598.JPG');
figure,imshow(I)
hsv_image = srgb2Lab(I);
L = hsv_image(:,:,1);
a = hsv_image(:,:,2);
b = hsv_image(:,:,3);

[x,y,z] = size(I);
for i = 1:x
    for j = 1:y
        if(((b(i,j)>40)&&(b(i,j)<70 ))&&(a(i,j)==0))
            L(i,j) = L(i,j);
            a(i,j) = a(i,j);
            b(i,j) = b(i,j);
        else
            L(i,j) = 0;
            a(i,j) = 0;
            b(i,j) = 0;
        end
    end
end
hsv_dst(:,:,1) = H;
hsv_dst(:,:,2) = V;
hsv_dst(:,:,3) = S;
dst = hsv2rgb(hsv_dst);
figure, imshow(dst)