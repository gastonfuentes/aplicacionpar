class Comercios{

  List<Comercio> items = List();

//  constructor vacio
  Comercios();

  // creamos otro constructor.. que esperamos recibir toda la lista q viene de la api
  Comercios.fromJsonList( List<dynamic> comercioList ){

// si la lista viene vacion retornamos
    if (comercioList == null) return;
// si la lista viene con algo realizamos un for
    for (var item in comercioList) {
      // pasamos cada item de la lista a la funcion fromJsonMap y los vamos asignando a la lista items
      final comercio = new Comercio.fromJsonMap(item);
      
      // MODELAMOS
      // if ( comercio.mes.contains('August') ) {
        // comercio.mes = 'Agosto';
      // }

      // print(comercio.mes); //mostramos los datos ya modelados


      items.add(comercio);

    }

  }

}

class Comercio {
  int id;
  int usuarioId;
  int localidadId;
  int rubroComercioId;
  int tipoVentaId;
  String nombre;
  String direccion;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

// constructor
  Comercio({
    this.id,
    this.usuarioId,
    this.localidadId,
    this.rubroComercioId,
    this.tipoVentaId,
    this.nombre,
    this.direccion,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  

//funcion que sirve para generar una instancia de una fecha que viene en un mapa con formato json. recibime un mapa que viene con strin y dynamic

  Comercio.fromJsonMap( Map<String, dynamic> json ){

    id              = json['id'];
    usuarioId       = json['usuarioId'];      
    localidadId     = json['localidadId']; 
    rubroComercioId = json['rubroComercioId']; 
    tipoVentaId     = json['tipoVentaId'];
    nombre          = json['nombre']; 
    direccion       = json['direccion']; 
    createdAt       = json['createdAt']; 
    updatedAt       = json['updatedAt']; 
    deletedAt       = json['deletedAt']; 

  }
}


