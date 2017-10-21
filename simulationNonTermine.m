function coup = simulationNonTermine(table, filet, balle, rbi)
coup = -1;
if(balle.position(3) + balle.rayon < 0 )%touche le sol
    coup = 3;
end

if( balle.position(1) < filet.position(1) + balle.rayon && balle.position(1) > filet.position(1) - balle.rayon)%collison X avec le filet
    if(balle.position(2) < filet.position(2) + balle.rayon + filet.largeur && balle.position(2) > filet.position(2) - balle.rayon)% collision Y
        if(balle.position(3) < filet.position(3) + balle.rayon + filet.hauteur && balle.position(3) > filet.position(3) - balle.rayon)%collison Z
            %collision sur tous les axes => collison avec le filet
            coup = 2;
        end
    end
end

if(balle.position(2) < table.position(2) + balle.rayon + table.largeur&& balle.position(2) > table.position(2) - balle.rayon)%collision Y
    if(balle.position(3) < table.position(3) + balle.rayon && balle.position(3) > table.position(3) - balle.rayon)%collision Z
        if(balle.position(1) < table.position(1)+table.longueur + balle.rayon && balle.position(1) > table.position(1) - balle.rayon)%collision X
            if(balle.position(1) < filet.position(1))
                if(rbi(1) < filet.position(1))
                    coup = 1;
                else
                    coup = 0;
                end
            else
                if(rbi(1) > filet.position(1))
                    coup = 1;
                else
                    coup = 0;
                end
            end
        end
    end
end