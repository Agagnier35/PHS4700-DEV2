function calculerNouvellesVitesses(balle, deltaT)
balle.vitesse = balle.vitesse + balle.acceleration * deltaT;
if(norm(balle.vitesse) > balle.vMax)
    vitUnit = balle.vitesse/norm(balle.vitesse);
    balle.vitesse = ball.vMax * vitUnit;
end