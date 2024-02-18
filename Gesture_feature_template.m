function FSD = Gesture_feature_template()
addpath(genpath('.\DTW\Gesture feature template library'));
for i=1:19
    file=sprintf('%d.jpg',i);
    a=imread(file);
    I1=imbinarize(a,graythresh(a));
    d = hand_outline(I1);
    [m n] = size(d);
    FD = fsd(d,30,m,4);
    Harmonics = 15;
    for j=1:4
        FD(j,:) = abs(FD(j,:))/sum(abs(FD(j,:)));%傅里叶归一化
    end
    FSD{i} = reshape(FD,1,120);
end
end