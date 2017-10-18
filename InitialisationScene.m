function [table, filet, balle] = InitialisationScene(rbi, vbi, wbi)
loT = 2.74;
laT = 1.525;
table = Table(laT, loT, [0 0 0.76]);

laT = 1.83;
haT = 0.1525;
filet = Filet(haT, laT, [loT/2 -haT haT]); %lextra sur les cote est egale a la hauteur

rayonB = 0.0199;
masseB = 0.00274;
balle = Balle(rbi, rayonB, wbi, masseB, vbi);