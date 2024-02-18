function R = gesture_DTW(FSD2,FSD,n)
N=0;
for k = 1:19
    dtwdist(k) = dtw(FSD2{n},FSD{k});
end

[d_sort,B] = sort(dtwdist');

C=['一','二','三','四','五','六','七','八','九','十','狗','家','鹿','你','他','我','小','圆','零'];

disp(['第 ', num2str(n), ' 个识别结果是：']);
R = C(B(1));
disp(R);
end