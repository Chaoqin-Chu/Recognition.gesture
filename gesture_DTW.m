function R = gesture_DTW(FSD2,FSD,n)
N=0;
for k = 1:19
    dtwdist(k) = dtw(FSD2{n},FSD{k});
end

[d_sort,B] = sort(dtwdist');

C=['һ','��','��','��','��','��','��','��','��','ʮ','��','��','¹','��','��','��','С','Բ','��'];

disp(['�� ', num2str(n), ' ��ʶ�����ǣ�']);
R = C(B(1));
disp(R);
end