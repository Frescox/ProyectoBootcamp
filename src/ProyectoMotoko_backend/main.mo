//López Galicia Luis Ángel

import Map "mo:map/Map";
import { nhash } "mo:map/Map";
import Nat "mo:base/Nat";
import Bool "mo:base/Bool";

actor QuejasSistema {
    type Queja = {
        id: Nat;
        descripcion: Text;
        resuelta: Bool;
    };

    let quejas = Map.new<Nat, Queja>();

    func inicializarQuejas() {
        let queja1 : Queja = {
            id = 1;
            descripcion = "Deben ser mas ordenados el ingresar";
            resuelta = false;
        };
        let queja2 : Queja = {
            id = 2;
            descripcion = "Fulanito causó problemas en el comedor";
            resuelta = false;
        };
        Map.set(quejas, nhash, queja1.id, queja1);
        Map.set(quejas, nhash, queja2.id, queja2);
    };

    inicializarQuejas();

    public func crearQueja(descripcion: Text) : async Text {
        let idsExistentes = Map.keys(quejas);
        var nuevoId = 1;
        
        var encontrado = false;
        while (not encontrado) {
            encontrado := true;
            for (id in idsExistentes) {
                if (id == nuevoId) {
                    encontrado := false;
                    nuevoId += 1;
                };
            };
        };

        let nuevaQueja : Queja = {
            id = nuevoId;
            descripcion = descripcion;
            resuelta = false;
        };
        Map.set(quejas, nhash, nuevoId, nuevaQueja);
        return "Queja creada con éxito";
    };

    public func mostrarQuejas() : async Text {
        var listaQuejas: Text = "Quejas registradas:\n";
        for ((_, queja) in Map.entries(quejas)) {
            listaQuejas := listaQuejas # "ID: " # Nat.toText(queja.id) # "\n" # 
                "Descripción: " # queja.descripcion # "\n" # 
                "Resuelta: " # Bool.toText(queja.resuelta) # "\n\n";
        };
        return listaQuejas;
    };

    public func actualizarQueja(id: Nat, resuelta: Bool) : async Text {
        switch (Map.get(quejas, nhash, id)) {
            case (?queja) {
                let nuevaQueja : Queja = { 
                    id = queja.id;
                    descripcion = queja.descripcion;
                    resuelta = resuelta;
                };
                Map.set(quejas, nhash, id, nuevaQueja);
                return "Queja actualizada con éxito";
            };
            case (_) {
                return "Queja no encontrada";
            };
        };
    };

    public func quejasPorEstado(resueltas: Bool) : async Text {
        var listaQuejas: Text = "Quejas " # (if resueltas "resueltas:\n" else "pendientes:\n");
        for ((_, queja) in Map.entries(quejas)) {
            if (queja.resuelta == resueltas) {
                listaQuejas := listaQuejas # "ID: " # Nat.toText(queja.id) # "\n" # 
                    "Descripción: " # queja.descripcion # "\n\n";
            };
        };
        return listaQuejas;
    };

    public func eliminarQueja(id: Nat) : async Text {
        let resultado = Map.get(quejas, nhash, id);
        
        switch (resultado) {
            case (?queja) {
                if (queja.resuelta) {
                    Map.delete(quejas, nhash, id);
                    return "Queja eliminada con éxito";
                } else {
                    return "No se puede eliminar una queja pendiente";
                };
            };
            case (_) {
                return "Queja no encontrada";
            };
        };
    };
}
