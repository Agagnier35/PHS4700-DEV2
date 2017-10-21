classdef Balle < Objet & handle
    properties
        rayon
        vangulaire
        vitesse
        acceleration
        accAngulaire
        masse
        sommeForce
    end
    properties (Constant)
        vMax = 35 %m/s
        wMax = 940 %rad/s
    end
    methods
        function obj = Balle(p, r, vang, m, v)
            obj = obj@Objet(p);
            obj.vangulaire = vang;
            obj.rayon = r;
            obj.masse = m;
            obj.vitesse = v;
            obj.acceleration = [0 0 0];
            obj.accAngulaire = [0 0 0];
        end
        
        function v = getNormeVitesse(b)
            v = norm(b.vitesse);
            if( v > b.vMax)
              v = b.vMax;
            end
        end
        function vang = getNormeVitesseAngulaire(b)
            vang = norm(b.vitesse);
            if( vang > b.wMax)
              vang = b.wMax;
            end
        end
    end
end