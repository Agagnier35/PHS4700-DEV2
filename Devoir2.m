function [coup, tf, rbf, vbf] = Devoir2(option, rbi, vbi, wbi)
[table, filet, balle] = InitialisationScene(rbi, vbi, wbi);

%----------Variation de temps a chaque iteration-----
deltaTemps = 0.1;
tf = 0;

%--------------Iterations de la simulation-----------
while(simluationNonTermine(table, filet, balle))%TODO
    balle.sommeForce = [0 0 0];
    tf = tf + deltaTemps;
    appliquerGravite(balle);
    if(option > 1)
        appliquerVisqueux(balle);
        if(option > 2)
            appliquerMagnus(balle);%TODO
        end
    end
    calculerNouvelleAcceleration(balle);%TODO
    calculerNouvellesVitesses(balle);%TODO
    calculerNouvellePosition(balle);%TODO

end

rbf = balle.position;
vbf = balle.vitesse;


%-------------Affichage des resultats-------------------
switch coup
    case 0
        printf("Coup reussi!");
    case 1 
        printf("Coup rate, coup sur le cote du joueur");
    case 2 
        printf("Coup rate, coup a frappe le filet");
    case 3 
        printf("Coup rate, coup a lexterieur de la table");
    otherwise
        print("?????");
end
printf("Temps final de la simulation: %s", tf);
printf("Position selon le centre de masse de la balle: %s", rbf);
printf("Vitesse finale du centre de masse de la balle: %s", vbf);