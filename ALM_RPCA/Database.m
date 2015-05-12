function Database(fea,a,b,c,d)
%a,b是图像的大小，如果是32*28，则a=32,b=28.c,d是想显示库中图像的多少行多少列,fea为图像数据
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
