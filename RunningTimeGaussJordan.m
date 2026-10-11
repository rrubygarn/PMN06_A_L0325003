
clc;
clear;

A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];

b = [-1; 2; 6; 2; -1];
n = length(b);

tic;

Aug = [A b];

for k = 1:n
    Aug(k,:) = Aug(k,:)/Aug(k,k);

    for i = 1:n
        if i ~= k
            m = Aug(i,k);
            Aug(i,:) = Aug(i,:) - m*Aug(k,:);
        end
    end
end

x = Aug(:,n+1);
waktu = toc;

disp('Metode Gauss-Jordan');
disp('Hasil solusi [p;q;r;s;t]:');
disp(x);
fprintf('Running time = %.8f detik\n', waktu);

