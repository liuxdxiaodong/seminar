%addpath I:\back-up\LXD\important\math\post\low-dimension\code\data\dataset_603573\603573\ORL
%files = dir('orl00*.bmp');
close all
clear
clc

path = 'C:\Users\CGGI_006\Desktop\LXD\data\ORL';
files = dir(path);
data = cell(1,20);

for i = 5:24
    image_name = [path '\' files(i).name];
    data{i-4} = imread(image_name);
    D(:,i-4) = double(data{i-4}(:));
end
% D = zeros(100,100);
% for i = 5:10:100
%     D(:,i) = ones(100,1);
% end
% E = imnoise(D,'gaussian');
L_star = LRDP(D);
figure,
for j = 1:20
    colL = L_star(:,j);
    matL = reshape(colL,112,92);
    subplot(5,4,j),imshow(matL);
end
%A = uint8(A);
%A1 = reshape(A,112,92);
