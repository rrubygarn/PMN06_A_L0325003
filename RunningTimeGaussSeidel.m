
clc;
clear;

A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];

b = [-1; 2; 6; 2; -1];

tol = 1e-6;
max_iter = 100;
n = length(b);

tic;

x = zeros(n,1);

for k = 1:max_iter
    xlama = x;

    for i = 1:n
        jumlah = A(i,1:i-1)*x(1:i-1) ...
               + A(i,i+1:n)*xlama(i+1:n);

        x(i) = (b(i)-jumlah)/A(i,i);
    end

    if norm(x-xlama,inf) <= tol
        break;
    end
end

waktu = toc;

disp('Metode Iterasi Gauss-Seidel');
fprintf('Jumlah iterasi = %d\n', k);
disp('Hasil solusi [p;q;r;s;t]:');
disp(x);
fprintf('Running time = %.8f detik\n', waktu);

