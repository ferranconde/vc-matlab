%% Sessió 3 - Ferran Conde i Sergi Ibànyez
% Imatge base:
I = imread('rubik.png');
I = rgb2gray(I);
figure;
imshow(I, []);

%% Exercici 1
% Simulem un filtre de mitjana minimitzant les operacions:

A = repmat(0.1111, 1, 3);

J = imfilter(I, A');
L = imfilter(J, A);

imshow(L, []);

%% Exercici 2
% Fem servir colfilt: si píxel es blanc, fem la mitjana dels veïns. Negre,
% igual. Si no, el deixem.

K = imnoise(I, 'salt & pepper', 0.1);
J = colfilt(K, [3 3], 'sliding', @exercici2);
figure;
imshow(K, []);
figure;
imshow(J, []);


%% Exercici 3
% Apliquem els filtres d'abans per ressaltar
% i els sumem a la imatge original

H = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
Gx = imfilter(I, H);
Gy = imfilter(I, H');

Sobel = abs(Gx) + abs(Gy);
ressaltat = I + Sobel;
imshow(ressaltat, []);

%% Exercici 4
% Agafem una matriu H i simulem un moviment a la dreta 
% (0 graus). Amb imrotate rotem l'angle indicat.

G = esborrona(I, 45);
figure;
imshow(G, []);


%% Exercici 5
% Assumim que coneixem l'angle original. Fem servir filtre de Wiener:

fix = desesborrona(G, 45);
figure;
imshow(fix, []);

%% Funcions

function [y] = exercici2(x)
    [f, c] = size(x);
    y = zeros(1, c);
    for i = 1 : c
        if x(round(f/2), i) == 255 || x(round(f/2), i) == 0
           y(i) = mean(x(1:end, i));
        else
            y(i) = x(round(f/2), i);
        end
    end
end

function [imatge] = esborrona(I, angle)
    H = [repmat(0.01, 1, 30);repmat(0.01, 1, 30)];
    H = imrotate(H, angle);
    imatge = imfilter(I, H);
end

function [imatge] = desesborrona(G, angle)
    H = [repmat(0.01, 1, 30);repmat(0.01, 1, 30)];
    H = imrotate(H, angle);
    J = im2double(G);
    % Per tractar el possible soroll
    estimated_nsr = 0.0001 / var(J(:));
    imatge = deconvwnr(J, H, estimated_nsr);
end