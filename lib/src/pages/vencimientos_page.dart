import 'package:flutter/material.dart';

// import 'package:formvalidation/src/models/fechas_model.dart';
import 'package:formvalidation/src/providers/fecha_provider.dart';


class VencimientosPage extends StatelessWidget {

  // const VencimientosPage({Key key}) : super(key: key);

    final fechasProvider = new FechasProvider();


  @override
  Widget build(BuildContext context) {

    return Container(
      child: _crearFechas(),
    );
  }


  Widget _crearFechas() {

    return FutureBuilder(
      future: fechasProvider.mostrarFechas(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {        
   

        if ( snapshot.hasData ) {

          print('-------- solo uno -------');
          print(snapshot.data[0].mes);
          return ListView(
            children: _listaFechas( snapshot.data),
          );
        }
        else{
          return Center(child: CircularProgressIndicator(),);

        }
      },
    );

  }

  List<Widget> _listaFechas( List<dynamic> data ) {

    final List<Widget> opciones = [];

    print('----data---------');
    print(data.length);

    data.forEach((element) { 

      final widgetTemp = ListTile(
        title: Text(element.mes),
        subtitle: Text(element.fecha),
      );

      opciones..add(widgetTemp)
              ..add( Divider() );

    });

    return opciones;

  }
}