clc;

%% Extraction des donnees
t_alpha = data_alpha(:,1);     % temps
alpha = data_alpha(:,2);       % angle du pendule
Vm = data_Vm(:,2);             % tension moteur

%% Conversion de alpha en degres si necessaire
alpha_deg = alpha * 180/pi;

%% Valeurs maximales absolues
alpha_max = max(abs(alpha_deg));
Vm_max = max(abs(Vm));

%% Affichage des resultats
fprintf('Deviation maximale du pendule = %.4f deg\n', alpha_max);
fprintf('Tension maximale utilisee = %.4f V\n', Vm_max);

figure;
plot(t_alpha, alpha_deg, 'LineWidth', 1.5);
grid on;
xlabel('Temps (s)');
ylabel('Angle du pendule (deg)');
title('Deviation du pendule');

figure;
plot(t_alpha, Vm, 'LineWidth', 1.5);
grid on;
xlabel('Temps (s)');
ylabel('Tension moteur (V)');
title('Tension utilisee');