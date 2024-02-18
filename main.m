clc;
clear;
addpath(genpath('.\DTW\2'));
for i=1:54
    file=sprintf('2 (%d).jpg',i);
    a=imread(file);
    I1=imbinarize(a,graythresh(a));
    d = hand_outline(I1);
    [m n] = size(d);
    FD = fsd(d,30,m,4);
    Harmonics = 15;
    outline_FFSD = ffsd(FD,Harmonics,m);
    draw_outline(outline_FFSD);
    for j=1:4
        FD(j,:) = abs(FD(j,:))/sum(abs(FD(j,:)));%傅里叶归一化
    end
    FSD2{i} = reshape(FD,1,120);
end
FSD = Gesture_feature_template();
% Gesture recognition
N = 54; % sample
k=0;
for s =1:N
    R = gesture_DTW(FSD2,FSD,s);  
    if R == '二'
        k = k+1;
    end
end
acc = k/N; % Gesture recognition accuracy based on DTW
fprintf('手势"二"的识别精度为：%f\n', acc);