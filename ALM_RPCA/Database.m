function Database(fea,a,b,c,d)
%a,b��ͼ��Ĵ�С�������32*28����a=32,b=28.c,d������ʾ����ͼ��Ķ����ж�����,feaΪͼ������
imagesizea = a; 
imagesizeb = b; 
row = c; 
column = d; 
Y = zeros(imagesizea*row,imagesizeb*column); 
for i=0:row-1 
   for j=0:column-1 
     Y(i*imagesizea+1:(i+1)*imagesizea,j*imagesizeb+1:(j+1)*imagesizeb) = reshape(fea(i*column+j+1,:),[imagesizea,imagesizeb]); 
   end 
end 
imagesc(Y);colormap(gray);
axis off
axis image
