function [ centre ] = findcentre( R,G,B,H )
k = 1;
centre = [];
for i = 1:3744
    for j = 1:5616
        if(R(i,j)==255 && G(i,j)==0 && B(i,j)==0)
            centre(k,:) = circle(i,j,H);
            k = k+1;
        end
        
    end
end
end

function [centrek] = circle(i,j,H)
radius = 15;
anglestep = 20;
circlepoint = zeros(4,2);
centrek = zeros(1,2);
for step = 1:4
    theta = (step-1)*pi/2;
    for angle = 1:anglestep
        eita = theta + angle / anglestep *pi/2;
        circlex = i + radius * cos(eita);
        circley = j + radius * sin(eita);
        if(H(floor(x),floor(y)) ~= 0)
            circlepoint(step,1) = floor(circlex);
            circlepoint(step,2) = floor(circley);
            continue
        end
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