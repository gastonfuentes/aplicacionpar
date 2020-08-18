import 'package:flutter/material.dart';
import 'package:formvalidation/src/providers/comercio_provider.dart';

class ComerciosSintaccPage extends StatelessWidget {
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
       future: comerciosProvider.mostrarComerciosSintacc(),
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

    print('---- comercios sin tacc --------');
    print(data.length);
    
    data.forEach((element) { 

      // if (element.nombre == "Miss Karina Ruecker Jr.")
      if (element.rubroComercioId == 2) 

      {  
            
      print('PASO EL IF');

      final widgetTemp = ListTile(
        title: Text(element.nombre),
        subtitle: Text(element.direccion),
      );

      opciones..add(widgetTemp)
              ..add( Divider() );

      }
    });

    return opciones;

  }



}
