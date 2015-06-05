close all
clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% H.mat             为IMG_4598.JPG转化成HSV颜色空间的H
% testcentre.mat    为人工手动选取的黄叉中心点
% centre.mat        为精确求得的黄叉中心点亚像素
% IMG_cross.jpg     为HSV提取黄叉结果
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 读取图像并且将RGB转化为HSV颜色空间
I = imread('IMG_4598.JPG');
%figure,imshow(I)
hsv_image = rgb2hsv(I);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
H = hsv_image(:,:,1)*255;
S = hsv_image(:,:,2)*255;
V = hsv_image(:,:,3)*255;

% 判别H 中60左右为黄色，H,S,V附为原值，其余定位0
[x,y,z] = size(I);
for i = 1:x
    for j = 1:y
        if(((H(i,j)>30)&&(H(i,j)<70 ))&&(V(i,j)>60)&&(S(i,j)>20))
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
% 转化为RGB输出图像
hsv_dst(:,:,1) = H/255;
hsv_dst(:,:,2) = V/255;
hsv_dst(:,:,3) = S/255;
dst = hsv2rgb(hsv_dst);
% imshow(dst)
%% 将原图分成16*8块，大概选取黄叉的中心点，利用该中心点求黄叉中心亚像素坐标findcentre
[row,col] = size(R);
hight = row / 8;
weight = col / 16;
m = 1;
for k = 1:16
    for s = 1:8
        figure, imshow(I(((s-1)*hight+1):(s*hight),((k-1)*weight+1):(k*weight),:))
        [x,y] = ginput;
        t = length(x);
        if t == 0
            continue
        else
            testcentre(m:(m+t-1),:) = [y+(s-1)*hight,x+(k-1)*weight];
        end
        m = m + t;
    end
end

centre = findcentre(testcentre,H);