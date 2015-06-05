function [ centre ] = findcentre( testcentre,H )
%% 以选取的大概中心点为圆心，用circle函数画圆选取四个边界上的四个点
%% 交叉连线交点即为所求精确中心
% testcentre 为手动选取的中心点
% centre 为circle计算得到的精确中心
tic
[m,n] = size(testcentre);
centre = zeros(m,n);
for i= 1:m
    display(i);
    centre(i,:) = circle(testcentre(i,:),H);
end
toc
end

function [centrek] = circle(point,H)
%% point为H中某个黄叉的人工选取的中心点

i = point(1);
j = point(2);
radius = 30;
anglestep = 20;
circlepoint = zeros(4,2);
centrek = zeros(1,2);

for step = 1:4
    theta = (step-1)*pi/2;
    stop = 0;
    k = 0;
    while(stop == 0)
        angle = k/anglestep * pi/2;
        eita = theta + angle;
        circlex = j + radius * cos(eita);
        circley = i - radius * sin(eita);
%         if(floor(circley) <= 0 || floor(circlex) <= 0)
%             break
%         end
        if(H(floor(circley),floor(circlex)) ~= 0)
            circlepoint(step,1) = floor(circley);
            circlepoint(step,2) = floor(circlex);
            stop = 1;
        else
            stop = 0;
        end
        if(k == 20 && stop == 0)
             break
        end
        
        k=k+1;
    end
end

% circlepoint 为选取的四个点，交叉连线焦点为centrek即为该黄叉精确中心点
cp = circlepoint;
a1 = (cp(3,2)-cp(1,2))/(cp(3,1)-cp(1,1));
b1 = -a1 * cp(1,1) + cp(1,2);
a2 = (cp(4,2)-cp(2,2))/(cp(4,1)-cp(2,1));
b2 = -a2 * cp(2,1) + cp(2,2);
centrek(1) = (b2 - b1)/(a1 - a2);
centrek(2) = centrek(1) * a1 + b1;
end