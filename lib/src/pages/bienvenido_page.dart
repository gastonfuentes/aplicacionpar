
import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/pages/saldo_page.dart';
import 'package:formvalidation/src/pages/vencimientos_page.dart';


class BienvenidoPage extends StatelessWidget {
  const BienvenidoPage({Key key}) : super(key: key);

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
              icon: Icon(Icons.monetization_on),
              text: 'Saldo', 
            ),
            Tab(
              icon: Icon(Icons.date_range),
              text: 'Vencimientos',),
            // Tab(icon: Icon(Icons.directions_bike)),
          ]),
        ),
        body: TabBarView(children: [
                SaldoPage(),
                VencimientosPage(),
              ]
            
        ),
  
      )
  
    );
  }
}