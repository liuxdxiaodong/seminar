function [ centre ] = findcentre( testcentre,H )
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
        if(floor(circley) <= 0 || floor(circlex) <= 0)
            break
        end
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
cp = circlepoint;
a1 = (cp(3,2)-cp(1,2))/(cp(3,1)-cp(1,1));
b1 = -a1 * cp(1,1) + cp(2,2);
a2 = (cp(4,2)-cp(2,2))/(cp(4,1)-cp(2,1));
b2 = -a2 * cp(2,1) + cp(2,2);
centrek(1) = (b2 - b1)/(a1 - a2);
centrek(2) = centrek(1) * a1 + b1;
end