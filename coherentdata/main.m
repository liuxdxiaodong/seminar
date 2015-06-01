close all
clear
clc
% 1.读取的多幅图像
% path = 'C:\Users\CGGI_006\Desktop\LXD\data\ORL';
% files = dir(path);
% data = cell(1,10);
%
% for i = 5:14
%     image_name = [path '\' files(i).name];
%     data{i-4} = imread(image_name);
%     D(:,i-4) = double(data{i-4}(:));
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YeBcluster experiment
% load YEBcluster
% E = fea(1:10,:)';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%条纹图像（一张图像只有几列是1，其余都是0）,加噪声
% D = zeros(100,200);
% for i = 5:20:200
%     D(:,i) = ones(100,1);
% end
% E = imnoise(D,'gaussian');
% D = zeros(100,200);
% for i = 5:10:100
%     D(i,:) = ones(1,200);
% end
% E = imnoise(D,'gaussian',0,0.2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path = 'C:\Users\Xiaodong\Desktop\ORL';
files = dir(path);
data = cell(1,6);
image_name = [path '\' files(10).name];
I = imread(image_name);
for i = 1:6
    
    I_blur = imnoise(I,'gaussian',0,0.002*i);
    data{i} = I_blur;
    E(:,i) = double(data{i}(:));
end


[L_star,L_check] = LRDP(E);
S_star = E - L_star;

% figure
% subplot(1,3,1),imshow(E)
% title('input')
% subplot(1,3,2),imshow(L_star)
% title('algorithm 1')
% subplot(1,3,3),imshow(L_check)
% title('RPCA')
% figure,
% imshow(S_star)
figure,
subplot(1,3,1),Database(E',112,92,6,1);
title('input')
subplot(1,3,2),Database(L_star',112,92,6,1);
title('algorithm 1')
subplot(1,3,3),Database(L_check',112,92,6,1);
title('RPCA')
figure,
Database(S_star',112,92,6,1)
% for j = 1:20
%     colL = L_star(:,j);
%     matL = reshape(colL,112,92);
%     subplot(5,4,j),imshow(matL);
% end
%A = uint8(A);
%A1 = reshape(A,112,92);
