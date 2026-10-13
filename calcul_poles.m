clc; clear;

% Matrice A
A = [ 0         0         1         0;
      0         0         0         1;
      0     81.4033  -45.8259  -0.9319;
      0    122.0545  -44.0966  -1.3972 ];

B = [0; 0; 83.465903095961707; 80.316246375359370;];

% calcule du gain avec la méthode directe
s = eig(A);
disp('Valeurs de s (poles du systeme) =')
disp(s)

% Calcule du gain en utilisant commande de placement de pole
K_com = place(A,B,s)