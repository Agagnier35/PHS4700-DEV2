classdef Table < Objet & handle
    properties
        longueur
        largeur
    end
    methods
        function obj = Table(la, lo, p)
            obj = obj@Objet(p);
            obj.longueur = lo;
            obj.largeur = la;
        end
    end
end