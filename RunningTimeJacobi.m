
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

D = diag(diag(A));
R = A-D;
x = zeros(n,1);

for k = 1:max_iter
    xbaru = D\(b-R*x);

    if norm(xbaru-x,inf) <= tol
        x = xbaru;
        break;
    end

    x = xbaru;
end

waktu = toc;

disp('Metode Iterasi Jacobi');
fprintf('Jumlah iterasi = %d\n', k);
disp('Hasil solusi [p;q;r;s;t]:');
disp(x);
fprintf('Running time = %.8f detik\n', waktu);

