function appliquerGravite(balle)
forceG = balle.masse * [0 0 -9.8];
balle.sommeForce = balle.sommeForce + forceG;