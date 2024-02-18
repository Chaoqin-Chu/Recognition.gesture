%%Function for extracting outline of object; Q.K., 2008.4.29
%%Deaprtment of Automation, Tsinghua Univ. Beijing 100084, China.

function [outline]=outline(I)


[junk threshold] = edge(I, 'sobel');
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor);

%Step 3: Dilate the image
se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);
BWsdil = imdilate(BWs, [se90 se0]);

%Step 4: Fill interior gaps
BWdfill = imfill(BWsdil, 'holes');

%Step 5: Remove connected objects on border
BWnobord = imclearborder(BWdfill, 4);

%Step 6: Smoothen the object
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
bw = bwareaopen(BWfinal,30); % % fill a gap in the pen's cap
[B,L] = bwboundaries(bw,'noholes');
outline = B{1};








