
clc;
clear;

A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];

b = [-1; 2; 6; 2; -1];

tic;

[L,U] = lu(A);
y = L\b;
x = U\y;

waktu = toc;

disp('Metode Dekomposisi LU');
disp('Hasil solusi [p;q;r;s;t]:');
disp(x);
fprintf('Running time = %.8f detik\n', waktu);

