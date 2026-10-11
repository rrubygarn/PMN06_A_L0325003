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

for k = 1:n-1
    for i = k+1:n
        m = Aug(i,k)/Aug(k,k);
        Aug(i,k:n+1) = Aug(i,k:n+1) ...
                     - m*Aug(k,k:n+1);
    end
end

x = zeros(n,1);
x(n) = Aug(n,n+1)/Aug(n,n);

for i = n-1:-1:1
    x(i) = (Aug(i,n+1) ...
          - Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
end

waktu = toc;

disp('Metode Eliminasi Gauss');
disp('Hasil solusi [p;q;r;s;t]:');
disp(x);
fprintf('Running time = %.8f detik\n', waktu);

