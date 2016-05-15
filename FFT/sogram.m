function sogram(Sg, Fs, Winsiz, Shift, Base, Mode, Gray)
%画出语谱图

n=floor((length(Sg)-Winsiz)/Shift)+1;%计算窗口移动的步数
A=zeros(Winsiz/2+1,n);
for i=1:n
    n1=(i-1)*Shift+1;
    n2=n1+(Winsiz-1);
    s=Sg(n1:n2);
    s=s.*hanning(Winsiz)';%使用汉明窗截取时域信号
    z=fft(s);
    z=z(1:(Winsiz/2)+1);
    z=z.*conj(z);
    z=10*log10(z);
    A(:,i)=z;
end
L0=(A>Base);
L1=(A<Base);
B=A.*L0+Base*L1;%低于最低基准值的点都赋为0
L=(B-Base)./(max(max(B))-Base);
y=[0:Winsiz/2]*Fs/Winsiz;
x=[0:n-1]*Shift/Fs;
if Mode==1
    colormap('default');
else
    mymode=gray;
    mymode=mymode(Gray:-1:1,:);
    colormap(mymode);
end
imagesc(x, y, L);
axis xy;
colorbar;
xlabel('Time/s');
ylabel('Frequency/Hz');
