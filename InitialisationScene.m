function [table, filet, balle] = InitialisationScene(rbi, vbi, wbi)
loT = 2.74;
laT = 1.525;
table = Table(laT, loT, [0 0 0.76]);

laF = 1.83;
haF = 0.1525;
filet = Filet(haF, laF, [loT/2 -haF 0.76]); %lextra sur les cote est egale a la hauteur

rayonB = 0.0199;
masseB = 0.00274;
balle = Balle(rbi, rayonB, wbi, masseB, vbi);