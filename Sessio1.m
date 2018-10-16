%% Sessió 1: Ferran Conde i Sergi Ibànyez

%% Exercici 1
% a)
A = [1;1;1] * [1,2,3,4,5]
% Alternativa amb repmat(vector, rows, columns):
Ar = repmat(1:5, 3, 1)

%%
% b)
B = [-1;0;1;2] * [1,1,1]
% Alternativa amb repmat(vector, rows, columns):
Br = repmat((-1:2)', 1, 3)

%% Exercici 2
% Creem vector X (29 salts per formar un total de 30 elements).
%%
% Assignem un valor de Y per cada element de X, truncant per sota del 0.
X = 0:(2*pi/29):2*pi;
Y = max(-cos(X), 0);
% Mostrem el gràfic
plot(X, Y);

%% Exercici 3
% Calculem el cosinus (truncat) de la distància euclidiana al punt (0,0) de
% la malla.
[X Y] = meshgrid(-15:1:15);
Z = max(cos(sqrt(X.^2 + Y.^2)/10), 0);
colormap(hot);
surf(X, Y, Z);

%% Exercici 4
% Fem servir la concatenació de matrius per replicar el gràfic anterior en
% una quadrícula.
[A B] = meshgrid(0:1:59);
[X Y] = meshgrid(-15:1:14);
Z = max(cos(sqrt(X.^2 + Y.^2)/10), 0);
Z = [Z Z; Z Z];
colormap(jet);
surf(A, B, Z);

%% Exercici 5
% Fem plot i mirem un mínim aproximat. L'introduirem a la funció següent.
%%
% Fem servir fminsearch per trobar un mínim local:
[x y] = meshgrid(-10:0.3:10);
Z = (x.^2 + y - 5)^2 + (x + y.^2 - 9)^2;
surf(x,y,Z);

fun = @(x) (x(1)^2 + x(2) - 5)^2 + (x(1) + x(2)^2 - 9)^2;
%%
% Fem servir el punt aproximat que hem trobat abans com _x0_
x0 = [0,0];
m = fminsearch(fun, x0)
