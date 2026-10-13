% Tracé des réponses temporelles du système :
% - position du bras rotatif
% - déviation du pendule
% - tension appliquée au moteur

% Extraction du vecteur temps
t = data_theta(:,1);

% Données du bras rotatif :
% theta_des : position de consigne
% theta_mes : position mesurée
theta_des = data_theta(:,2);
theta_mes = data_theta(:,3);

% Données du pendule :
% alpha : angle de déviation du pendule
alpha = data_alpha(:,2);

% Données de la tension moteur :
% Vm : tension appliquée au moteur
Vm = data_Vm(:,2);

% === Calcul des indicateurs de performance ===

% 1. Déviation du pendule
alpha_max = max(abs(alpha));          % valeur maximale absolue (déviation maximale)
alpha_rms = sqrt(mean(alpha.^2));     % valeur efficace RMS (énergie moyenne de déviation)

% 2. Effort de commande (tension moteur)
Vm_max = max(abs(Vm));                % tension maximale appliquée
Vm_rms = sqrt(mean(Vm.^2));           % tension RMS (effort moyen du moteur)

%% Affichage des résultats dans la console
fprintf('Déviation max pendule = %.4f rad\n', alpha_max);
fprintf('Déviation RMS pendule = %.4f rad\n', alpha_rms);

fprintf('Tension max moteur = %.4f V\n', Vm_max);
fprintf('Tension RMS moteur = %.4f V\n', Vm_rms);

% === Tracé des courbes ===
figure;

% 1. Réponse du bras rotatif
subplot(3,1,1);
plot(t, theta_des, 'r--', 'LineWidth', 1.5); hold on;
plot(t, theta_mes, 'b', 'LineWidth', 1.5);
grid on;
title('Réponse du bras rotatif');
xlabel('Temps (s)');
ylabel('\theta (rad)');
legend('Consigne', 'Mesurée');

% 2. Déviation du pendule
subplot(3,1,2);
plot(t, alpha, 'k', 'LineWidth', 1.5); hold on;
yline(alpha_max, 'r--', 'Déviation max');
yline(-alpha_max, 'r--');
grid on;
title('Déviation angulaire du pendule');
xlabel('Temps (s)');
ylabel('\alpha (rad)');

% 3. Tension du moteur
subplot(3,1,3);
plot(t, Vm, 'm', 'LineWidth', 1.5); hold on;
yline(Vm_max, 'r--', 'Tension max');
yline(-Vm_max, 'r--');
grid on;
title('Tension appliquée au moteur');
xlabel('Temps (s)');
ylabel('V_m (V)');