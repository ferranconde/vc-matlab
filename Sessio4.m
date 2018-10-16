%% Sessió 4 - Ferran Conde i Sergi Ibànyez

% Imatge base:
I = imread('arros.tif');
figure;
imshow(I, []);

%% Exercici 1
% Binarització

J = exercici1(I, 0.4);
imshow(J, []);

%% Exercici 2
% Generem histograma acumulat. Fem servir la funció find per trobar el
% primer punt de l'histograma on obtenim l'àrea A.
% Accedim al llindar de l'histograma corresponent i l'apliquem a la imatge.

J = exercici2(I, 18000);
imshow(J, []);

%% Exercici 3
% k = 5, [3 3] ; k = 10, [9, 1] ; k = 5, [1, 9]
I = imread('enters.jpg');
I = rgb2gray(I);
J = exercici3(I, 5, 3, 3);
figure;
imshow(J, []);
J = exercici3(I, 10, 9, 1);
figure;
imshow(J, []);
J = exercici3(I, 5, 1, 9);
figure;
imshow(J, []);

%% Funcions
function [imatge] = exercici1(I, alpha)
    minim = min(min(I));
    maxim = max(max(I));
    th = alpha*(maxim - minim) + minim;
    imatge = I < th;
end

function [imatge] = exercici2(I, a)
    [counts, bins] = histcounts(I);
    cdf = cumsum(counts);
    a = cdf(end) - a;
    k = find(cdf > a, 1);
    if k == 1
        k = 2;
    end
    th = bins(k-1);
    imatge = I > th;
end


function [imatge] = exercici3(I, k, n, m)
    auxiliar = colfilt(I, [n, m], 'sliding', @mean);
    [rows, cols] = size(auxiliar);
    imatge = I;
    for i = 1 : rows
        for j = 1 : cols
            if imatge(i,j) > auxiliar(i, j) + k
                imatge(i,j) = 255; 
            end
        end
    end
end