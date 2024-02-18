%%Function for draw outline of object; Q.K., 2008.4.29
%%Deaprtment of Automation, Tsinghua Univ. Beijing 100084, China.
function draw_outline(outline)
B = cell(1);
outline(:,1) = outline(:,1)*(-1); 
B{1,1} = outline;
for k = 1:length(B) 
    boundary = B{k}; 
    plot(boundary(:,2), boundary(:,1), 'b', 'LineWidth', 2) 
end