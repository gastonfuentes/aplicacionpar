import 'package:flutter/material.dart';
// import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/pages/bienvenido_page.dart';
import 'package:formvalidation/src/pages/comercios_page.dart';
import 'package:formvalidation/src/pages/productos_page.dart';
// import 'package:formvalidation/src/pages/saldo_page.dart';
// import 'package:formvalidation/src/pages/vencimientos_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {


    // final bloc = Provider.of(context);   
    
    return Scaffold(
      body: _cargarPage( currentIndex ),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );

  }

   Widget _crearBottomNavigationBar(){

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },      
      items: const <BottomNavigationBarItem>[                  
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('Productos'),                    
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          title: Text('Comercios'),
        ),
      ],
    
    );
  }

  Widget _cargarPage( int paginaActual ){

    switch ( paginaActual ){

      case 0: return BienvenidoPage();
      case 1: return ProductosPage();
      case 2: return ComerciosPage();

      default: return BienvenidoPage();

    }

  }
}