function X=myfft(x)
%ʵ��FFT�㷨������xΪʱ���źţ�XΪƵ���ź�

N=length(x);%ʱ���źŵĳ���
M=log2(N);%����ļ���
x_reverse=zeros(1, N);%�洢��λ������ʱ���ź�
for i=1:N
    index=bitreverse(i-1, M);
    x_reverse(i)=x(index+1);
end

REX=x_reverse;%�洢��ǰ�׶ε�ʵ��ֵ
IMX=zeros(1, N);%�洢��ǰ�׶ε��鲿ֵ
for i=0:M-1%����ļ���
    start_pos=1;
    for j=0:2^(M-(i+1))-1%ÿһ�����������ָ��Ⱥ��
        for k=0:2^i-1%ÿһ��Ⱥ�е������������
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