function appliquerVisqueux(balle)
rho = 1.2;
cv = 0.5;
A = pi * balle.rayon ^ 2;
vb = balle.vitesse;

forceV = -(rho * cv * A / 2) * balle.getNormeVitesse * vb;
balle.sommeForce = balle.sommeForce + forceV;
