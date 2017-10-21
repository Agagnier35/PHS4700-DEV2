function [coup, tf, rbf, vbf] = Devoir2(option, rbi, vbi, wbi)
[table, filet, balle] = InitialisationScene(rbi, vbi, wbi);

%----------Variation de temps a chaque iteration-----
deltaTemps = 0.005;
tf = 0;

%----------Initialisation du graphique---------------
clf;
tableX = [table.position(1) table.position(1) + table.longueur table.position(1) + table.longueur table.position(1) ]';
tableY = [table.position(2) table.position(2) table.position(2) + table.largeur table.position(2) + table.largeur]';
tableZ = [table.position(3) table.position(3) table.position(3) table.position(3)]';
patch(tableX, tableY, tableZ, 'g');
hold on

filetX = [filet.position(1) filet.position(1)  filet.position(1) filet.position(1) ]';
filetY = [filet.position(2) filet.position(2) filet.position(2) + filet.largeur filet.position(2) + filet.largeur]';
filetZ = [filet.position(3) filet.position(3)+ filet.hauteur filet.position(3)+ filet.hauteur filet.position(3)]';
patch(filetX, filetY, filetZ, 'y');
hold on

%--------------Iterations de la simulation-----------
coup = -1;
while(coup == -1)
    balle.sommeForce = [0 0 0];
    tf = tf + deltaTemps;
    appliquerGravite(balle);
    if(option > 1)
        appliquerVisqueux(balle);
        if(option > 2)
            appliquerMagnus(balle);
        end
    end
    calculerNouvelleAcceleration(balle);
    calculerNouvellesVitesses(balle, deltaTemps);
    calculerNouvellePosition(balle, deltaTemps);
    
    %----Dessiner la balle----
    [x,y,z] = sphere;
    s = surf(x*balle.rayon+balle.position(1),y*balle.rayon+balle.position(2), z*balle.rayon+balle.position(3));
    s.EdgeColor= '[1 0 0]';
    s.FaceColor= '[1 0 0]';
    hold on
    
    coup = simulationNonTermine(table, filet, balle, rbi);
end
grid on
axis([-0.5 3 -1 2.5 0 3.5]);
rbf = balle.position;
vbf = balle.vitesse;


%-------------Affichage des resultats-------------------
switch coup
    case 0
        fprintf("Coup reussi!\n");
    case 1 
        fprintf("Coup rate, coup sur le cote du joueur\n");
    case 2 
        fprintf("Coup rate, coup a frappe le filet\n");
    case 3 
        fprintf("Coup rate, coup a lexterieur de la table\n");
    otherwise
        fprintf("?????\n");
end
fprintf("Temps final de la simulation: ");
    fprintf(num2str(tf));fprintf(" ;\n");
fprintf("Position selon le centre de masse de la balle: ");
    fprintf(num2str(rbf(1)));fprintf(", ");
    fprintf(num2str(rbf(2)));fprintf(", ");
    fprintf(num2str(rbf(3)));fprintf(" ;\n");
fprintf("Vitesse finale du centre de masse de la balle: ");
    fprintf(num2str(vbf(1)));fprintf(", ");
    fprintf(num2str(vbf(2)));fprintf(", ");
    fprintf(num2str(vbf(3)));fprintf(" ;\n");
end