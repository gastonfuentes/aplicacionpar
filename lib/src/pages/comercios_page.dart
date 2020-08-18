

import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/pages/comercios/comercios_sintacc_page.dart';
import 'package:formvalidation/src/pages/comercios/comercios_todos_page.dart';


class ComerciosPage extends StatelessWidget {
  const ComerciosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final bloc = Provider.of(context);

    return DefaultTabController(
      length: 2,     
      child: Scaffold(
        appBar: AppBar(    
          centerTitle: true,
          title: Container(
            // height: 100,
            child: Column(                  
              children: <Widget>[
                Text('PAR'),
                // Divider(),
                Text('Bienvenido: ${bloc.email}'),
                // Text(bloc.password),
              ],
            ),
          ),                     
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.local_grocery_store),
              text: 'Comercios', 
            ),
            Tab(
              icon: Icon(Icons.local_dining),
              text: 'Sin Tacc',),
            // Tab(icon: Icon(Icons.directions_bike)),
          ]),
        ),
        body: TabBarView(children: [
                ComerciosTodosPage(),
                ComerciosSintaccPage(),
              ]
            
        ),
  
      )
  
    );


  }
}