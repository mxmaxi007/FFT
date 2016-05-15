function X=myfft(x)
%实现FFT算法，其中x为时域信号，X为频域信号

N=length(x);%时域信号的长度
M=log2(N);%运算的级数
x_reverse=zeros(1, N);%存储码位逆序后的时域信号
for i=1:N
    index=bitreverse(i-1, M);
    x_reverse(i)=x(index+1);
end

REX=x_reverse;%存储当前阶段的实部值
IMX=zeros(1, N);%存储当前阶段的虚部值
for i=0:M-1%运算的级数
    start_pos=1;
    for j=0:2^(M-(i+1))-1%每一级运算中所分割的群数
        for k=0:2^i-1%每一个群中蝶形运算的数量
            R1=REX(start_pos+2^i)*cos(2*pi*k*2^(M-(i+1))/N);
            R2=IMX(start_pos+2^i)*sin(2*pi*k*2^(M-(i+1))/N);
            I1=REX(start_pos+2^i)*(-sin(2*pi*k*2^(M-(i+1))/N));
            I2=IMX(start_pos+2^i)*cos(2*pi*k*2^(M-(i+1))/N);
            
            REX(start_pos+2^i)=REX(start_pos)-(R1+R2);
            IMX(start_pos+2^i)=IMX(start_pos)-(I1+I2);
            REX(start_pos)=REX(start_pos)+(R1+R2);
            IMX(start_pos)=IMX(start_pos)+(I1+I2);      
            
            start_pos=start_pos+1;
        end
        start_pos=start_pos+2^i;
    end
end
X={REX, IMX};