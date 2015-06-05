close all
clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% H.mat             ΪIMG_4598.JPGת����HSV��ɫ�ռ��H
% testcentre.mat    Ϊ�˹��ֶ�ѡȡ�ĻƲ����ĵ�
% centre.mat        Ϊ��ȷ��õĻƲ����ĵ�������
% IMG_cross.jpg     ΪHSV��ȡ�Ʋ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��ȡͼ���ҽ�RGBת��ΪHSV��ɫ�ռ�
I = imread('IMG_4598.JPG');
%figure,imshow(I)
hsv_image = rgb2hsv(I);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
H = hsv_image(:,:,1)*255;
S = hsv_image(:,:,2)*255;
V = hsv_image(:,:,3)*255;

% �б�H ��60����Ϊ��ɫ��H,S,V��Ϊԭֵ�����ඨλ0
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
% ת��ΪRGB���ͼ��
hsv_dst(:,:,1) = H/255;
hsv_dst(:,:,2) = V/255;
hsv_dst(:,:,3) = S/255;
dst = hsv2rgb(hsv_dst);
% imshow(dst)
%% ��ԭͼ�ֳ�16*8�飬���ѡȡ�Ʋ�����ĵ㣬���ø����ĵ���Ʋ���������������findcentre
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