classdef Filet < Objet & handle
    properties
        hauteur
        largeur
    end
    methods
        function obj = Filet(h, l, p)
            obj = obj@Objet(p);
            obj.hauteur = h;
            obj.largeur = l;
        end
    end
end