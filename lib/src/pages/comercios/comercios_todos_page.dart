import 'package:flutter/material.dart';
import 'package:formvalidation/src/providers/comercio_provider.dart';

class ComerciosTodosPage extends StatelessWidget {
  // const ComerciosTodosPage({Key key}) : super(key: key);

  final comerciosProvider = new ComerciosProvider();

  @override
  Widget build(BuildContext context) {


    return Container(

      child: _crearComercios(),

    );



  }

   Widget _crearComercios() {

     return FutureBuilder(
       future: comerciosProvider.mostrarComercios(),
      //  initialData: InitialData,
       builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {

         if (snapshot.hasData) {
           
         return ListView(
           children: _mostrarComercios( snapshot.data ),
         );

         }
         else{
          return Center(child: CircularProgressIndicator(),);
         }

       },
     );

  }

  List<Widget> _mostrarComercios( List<dynamic> data ) {

    final List<Widget> opciones = [];

    print('----data---------');
    print(data.length);

    data.forEach((element) { 

      final widgetTemp = ListTile(
        title: Text(element.nombre),
        subtitle: Text(element.direccion),
      );

      opciones..add(widgetTemp)
              ..add( Divider() );

    });

    return opciones;

  }



}
