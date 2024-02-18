function [outline]=hand_outline(I)

[junk threshold] = edge(I, 'sobel');
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor);

se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);
BWsdil = imdilate(BWs, [se90 se0]);

bw = bwareaopen(BWsdil,30); % % fill a gap in the pen's cap
[B,L] = bwboundaries(bw,'noholes');
outline = B{1};