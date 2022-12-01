function isPrime = isPrime (n)
%isPrime 此处显示有关此函数的摘要
%可以验证某个正整数是否为素数的函数
%   此处显示详细说明
if (n == 1)
    isPrime = 0;
    return ;
else
    for k = 2 : n - 1
        if (mod (n, k) == 0)
            isPrime = 0;
            return ;
        end
    end
end
isPrime = 1;
end