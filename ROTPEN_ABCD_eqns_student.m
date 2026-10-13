% State Space Representation
a = Jr + Mp*Lr^2;
b = 0.5*Mp*Lp*Lr;
c = Jp + 0.25*Mp*Lp^2;
d = 0.5*Mp*Lp*g;

Delta = a*c - b^2;

A = [ 0,          0,              1,                0;
      0,          0,              0,                1;
      0,      b*d/Delta,     -c*Dr/Delta,     -b*Dp/Delta;
      0,      a*d/Delta,     -b*Dr/Delta,     -a*Dp/Delta ]

B = [ 0;
      0;
      c/Delta;
      b/Delta ]

C = eye(2,4)
D = zeros(2,1)

% Add actuator dynamics
A(3,3) = A(3,3) - Kg^2*kt*km/Rm * B(3);
A(4,3) = A(4,3) - Kg^2*kt*km/Rm * B(4);
B = Kg*kt*B/Rm;

system = ss(A,B,C,D);

%poles du système en boucle ouverte
poles_OL = pole(system);
disp('Poles en boucle ouverte =')
disp(poles_OL)


% Determination de la matrice de controllabilite
Co = ctrb(A,B);

disp('Matrice de controllabilite =')
disp(Co)

% Rang de la matrice de controllabilite
r = rank(Co);

disp('Rang de la matrice de controllabilite =')
disp(r)

% Conclusion sur la controllabilite
n = size(A,1);

if r == n
    disp('Le systeme est completement controllable.')
else
    disp('Le systeme n est pas completement controllable.')
end