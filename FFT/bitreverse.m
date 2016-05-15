function new_num=bitreverse(num, M)
%实现二进制码位倒序

bin_num=dec2bin(num);
while length(bin_num)<M %对于小于规定位数的二进制前补零
    bin_num=['0', bin_num];
end
temp=bin_num(end:-1:1);%码位逆序
new_num=bin2dec(temp);
