function calculerNouvelleAcceleration(balle)
force = balle.sommeForce;

balle.acceleration = force / balle.masse;

