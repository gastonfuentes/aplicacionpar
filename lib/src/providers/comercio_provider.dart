
import 'dart:convert';

import 'package:formvalidation/src/models/comercios_model.dart';
import 'package:http/http.dart' as http;



class ComerciosProvider {
  
  // ingresamos la url del servidor api
  final String _url = 'https://pure-springs-70195.herokuapp.com';


   Future<List<dynamic>> mostrarComercios() async{

    final url = '$_url/comercio';
    final resp = await http.get(url);


    final decodeData = json.decode(resp.body);
    
    // print(decodeData);

    if (decodeData == null) {
      return [];
    }

    final comercioslista = new Comercios.fromJsonList(decodeData['data']);
    
    print('desde comercios listas');
    // print(comercioslista.items[0]);
    print(comercioslista);

    return comercioslista.items;

  }


  Future<List<dynamic>> mostrarComerciosSintacc() async{

    final url = '$_url/comercio';
    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);
    
    print(decodeData);

    if (decodeData == null) {
      return [];
    }

    final comerciosSintacclista = new Comercios.fromJsonList(decodeData['data']);
    
    print('desde comercios sin tacc listas');
    // print(comerciosSintacclista.items[1].rubroComercioId);
    // print(comercioslista);


    comerciosSintacclista.items.forEach((element) { 
      print("imprimimos element");
      print(element.rubroComercioId);
      // print(element.direccion);
    });

    return comerciosSintacclista.items;

  }

}

