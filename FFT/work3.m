clear;
%[M, fs, nbits]=wavread('G:\�½��ļ���\�����źŴ���\homework\459707069_4_��ҵ2��3����wav�ļ�\connected.wav');
[M, fs, nbits]=wavread('G:\�½��ļ���\�����źŴ���\homework\459707069_4_��ҵ2��3����wav�ļ�\isolated.wav');
M=M';
len=length(M);%�ܹ��Ĳ�������

stage=floor(log2(len));
win=2^stage;%һ֡�Ĵ��ڳ���
frame_num=floor(len/win);%֡��

X1_am=fre_am(M, win, frame_num);%ʹ���Լ�ʵ�ֵ�fft�㷨����Ƶ�׷���
X2_am=abs(fft(M(1:win)));%ʹ��matlab��fft�㷨����Ƶ�׷���


freq=1:win/2;%Ƶ������
freq=freq*fs/win;

t=1:len;%ʱ������
t=t/fs;

figure(1);
subplot(3,1,1);
plot(t, M);
grid on
xlabel('Time/s');
ylabel('Amplitude');
title('Original Waveform');

subplot(3,1,2);
plot(freq, X1_am(1:win/2));
grid on
xlabel('Frequency/Hz');
ylabel('Amplitude');
title('My FFT');

subplot(3,1,3);
plot(freq, X2_am(1:win/2));
grid on
xlabel('Frequency/Hz');
ylabel('Amplitude');
title('MATLAB FFT');

%�����������ͼ
win=256;%һ֡�Ĵ��ڳ���
shift=32;%����
base=0;%��һ����ͻ�׼ֵ
mode=1;%��ʾģʽ��0�Ҷ�ͼ/1��ɫͼ��
gray=64;%����ͼ�ĻҶȼ���

figure(2);
sogram(M, fs, win, shift, base, mode, gray);
title('Broad Band Spectrum(dB)');

%����խ������ͼ
win=2048;%һ֡�Ĵ��ڳ���
shift=128;%����
base=0;%��һ����ͻ�׼ֵ
mode=1;%��ʾģʽ��0�Ҷ�ͼ/1��ɫͼ��
gray=64;%����ͼ�ĻҶȼ���

figure(3);
sogram(M, fs, win, shift, base, mode, gray);
title('Narrow Band Spectrum(dB)');