function appliquerMagnus(balle)
cm = 0.29;
rho = 1.2;

forceM = 4 * pi * cm * rho * balle.rayon ^ 3 * cross(balle.vangulaire, balle.vitesse);
balle.sommeForce = balle.sommeForce + forceM;