function ITAE = optimfunc (x) 
global Kp1;
global Ki1;
global Kd1;
global lam1;
global mu1
global Kp2;
global Ki2;
global Kd2;
global lam2;
global mu2;

assignin('base','Kp1',x(1));  %将值 x(1) 赋予MATLAB 基础工作区中的变量 Kp
assignin('base','Ki1',x(2));
assignin('base','Kd1',x(3));
assignin('base','lam1',x(4));
assignin('base','mu1',x(5));  %将值 x(1) 赋予MATLAB 基础工作区中的变量 Kp
assignin('base','Kp2',x(6));  %将值 x(1) 赋予MATLAB 基础工作区中的变量 Kp
assignin('base','Ki2',x(7));
assignin('base','Kd2',x(8));
assignin('base','lam2',x(9));
assignin('base','mu2',x(10));
T1=5;
[t,y] = sim('twoLFCmodlenew',T1);
load cost;
ITAE=cost(end);
% ITAE = ans.cost(length(ans.cost));
% fprintf(' and Fitness Value =%7.5f',ITAE);
% fprintf(' [Cromosomes Value x(1)=%7.5f',x(1));
% fprintf(' x(2)=%7.5f]',x(2));
% fprintf(' x(3)=%7.5f]',x(3));
% fprintf(' x(4)=%7.5f]',x(4));
% fprintf(' x(5)=%7.5f]',x(5));
% fprintf(' x(6)=%7.5f]',x(6));
% fprintf(' x(7)=%7.5f]',x(7));
% fprintf(' x(8)=%7.5f]',x(8));
% fprintf(' x(9)=%7.5f]',x(9));
% fprintf(' x(10)=%7.5f]',x(10));
end