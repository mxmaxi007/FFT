function new_num=bitreverse(num, M)
%ʵ�ֶ�������λ����

bin_num=dec2bin(num);
while length(bin_num)<M %����С�ڹ涨λ���Ķ�����ǰ����
    bin_num=['0', bin_num];
end
temp=bin_num(end:-1:1);%��λ����
new_num=bin2dec(temp);
