function X_am=fre_am(x, win, frame_num)
%����Ƶ��ķ�����

X_am=[];
for i=1:frame_num
    temp=myfft(x((i-1)*win+1:i*win));%���㵱ǰ֡�źŵ�FFT
    Am=sqrt(abs(temp{1}.*temp{1}) + abs(temp{2}.*temp{2}));
    X_am=[X_am, Am];
end


