class Fechas{

  List<Fecha> items = List();

//  constructor vacio
  Fechas();

  // creamos otro constructor.. que esperamos recibir toda la lista q viene de la api
  Fechas.fromJsonList( List<dynamic> fechaList ){

// si la lista viene vacion retornamos
    if (fechaList == null) return;
// si la lista viene con algo realizamos un for
    for (var item in fechaList) {
      // pasamos cada item de la lista a la funcion fromJsonMap y los vamos asignando a la lista items
      final fecha = new Fecha.fromJsonMap(item);
      
      // MODELAMOS
      if ( fecha.mes.contains('August') ) {
        fecha.mes = 'Agosto';
      }

      print(fecha.mes); //mostramos los datos ya modelados


      items.add(fecha);

    }

  }

}

class Fecha {
  int id;
  int usuarioId;
  int tipoFechaId;
  String fecha;
  String mes;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

// constructor
  Fecha({
    this.usuarioId,
    this.id,
    this.tipoFechaId,
    this.fecha,
    this.mes,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  

//funcion que sirve para generar una instancia de una fecha que viene en un mapa con formato json. recibime un mapa que viene con strin y dynamic

  Fecha.fromJsonMap( Map<String, dynamic> json ){

    usuarioId   = json['usuario_id'];      
    id          = json['id'];
    tipoFechaId = json['tipo_fecha_id']; 
    fecha       = json['fecha']; 
    mes         = json['mes'];
    createdAt   = json['created_at']; 
    updatedAt   = json['updated_at']; 
    deletedAt   = json['deleted_at']; 

  }
}


