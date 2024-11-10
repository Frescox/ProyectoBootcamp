import Map "mo:map/Map";
import { nhash } "mo:map/Map";
import Nat "mo:base/Nat";
import Bool "mo:base/Bool";

actor QuejasSistema {
    // Definir la estructura para almacenar la información de una queja
    type Queja = {
        id: Nat;
        descripcion: Text;
        resuelta: Bool;
    };

    // Crear el mapa de quejas usando `Map.new`
    let quejas = Map.new<Nat, Queja>();

    // Inicialización de quejas predeterminadas
    func inicializarQuejas() {
        let queja1 : Queja = {
            id = 1;
            descripcion = "La comida estaba fría al llegar a la mesa";
            resuelta = false;
        };
        let queja2 : Queja = {
            id = 2;
            descripcion = "El servicio fue muy lento";
            resuelta = false;
        };
        Map.set(quejas, nhash, queja1.id, queja1);
        Map.set(quejas, nhash, queja2.id, queja2);
    };

    inicializarQuejas();

    // Crear una nueva queja
    public func crearQueja(descripcion: Text) : async Text {
        let id = (Map.size(quejas) + 1);  // Generar un ID único basado en el tamaño del mapa
        let nuevaQueja : Queja = {  // Especifica que es de tipo Queja
            id = id;
            descripcion = descripcion;
            resuelta = false;
        };
        Map.set(quejas, nhash, id, nuevaQueja);  // Insertar la queja en el mapa
        return "Queja creada con éxito";
    };

  public func mostrarQuejas() : async Text {
      var listaQuejas: Text = "Quejas registradas:\n"; // Inicia un string con un encabezado
      for ((_, queja) in Map.entries(quejas)) {
          listaQuejas := listaQuejas # "ID: " # Nat.toText(queja.id) # "\n" # 
              "Descripción: " # queja.descripcion # "\n" # 
              "Resuelta: " # Bool.toText(queja.resuelta) # "\n\n";
      };
      return listaQuejas;  // Devuelve todas las quejas formateadas como una cadena de texto
  };


    // Actualizar el estado de una queja (resuelta o no)
    public func actualizarQueja(id: Nat, resuelta: Bool) : async Text {
        switch (Map.get(quejas, nhash, id)) {
            case (?queja) {
                let nuevaQueja : Queja = {  // Especifica que es de tipo Queja
                    id = queja.id;
                    descripcion = queja.descripcion;
                    resuelta = resuelta;
                };
                Map.set(quejas, nhash, id, nuevaQueja);  // Actualizar la queja en el mapa
                return "Queja actualizada con éxito";
            };
            case (_) {
                return "Queja no encontrada";
            };
        };
    };

    // Eliminar una queja
    public func eliminarQueja(id: Nat) : async Text {
        switch (Map.get(quejas, nhash, id)) {
            case (?_) {
                Map.delete(quejas, nhash, id);  // Eliminar la queja del mapa
                return "Queja eliminada con éxito";
            };
            case (_) {
                return "Queja no encontrada";
            };
        };
    };
};
