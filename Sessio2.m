%% Sessi� 2 - Ferran Conde i Sergi Ib�nyez

%% Exercici 1
% Llegim l'imatge i li restem la mateixa imatge per� despla�ada una unitat.
I = imread('1.jpg');
I = rgb2gray(I);
J = imtranslate(I, [-1, 0]);
Diff = J - I;

%%
% Obtenim el m�xim i llur �ndex (de columna). Aix� trobem l'�ndex de fila.
[maxcol, indcol] = max(max(Diff));
[maxrow, indrow] = max(Diff(:, indcol));
maxcoords = [indrow, indcol]

%%
% Encerclem el p�xel desitjat i mostrem la imatge amb la marca.
figure;
imshow(I);

MarkedImage = insertMarker(I, maxcoords, 'o', 'color', 'red', 'size', 10);
imshow(MarkedImage);


%% Exercici 2
% Mostrem el gr�fic de barres:
% Veure la funci� al final de l'arxiu (requeriment del MATLAB)
h = creaHistograma(I, 50);
bar(h)

%% Exercici 3

% Efectuem els c�lculs de l'enunciat:

I = imread('1.jpg');
I = rgb2gray(I);
Pn = mean2(I);
J = imresize(I, double(3/7));
J = imresize(J, double(7/3));

%%
% Adaptem les mides de la imatge en cas d'arrodoniments inexactes.
% Sabem que les dimensions de J s�n m�s grans o iguals que I.
[ir, ic] = size(I);
[jr, jc] = size(J);

J = J(1:end-(jr-ir),1:end-(jc-ic));
K = I - J;
Ps = std2(K);
SNR = 10 * log10(Ps / Pn)



%% Funci� de l'exercici 2

function [particions] = creaHistograma(imatge, bins)
%histograma Mostra l'histograma de la funci� en _bins_ particions
%   Itera la imatge i compta les aparicions dels valors dels grisos per bin
    particions = zeros(1, bins);

    for i = 1 : numel(imatge)
        bin = floor((double(imatge(i))/256.0)*bins) + 1;
        particions(bin) = particions(bin) + 1;
    end
end