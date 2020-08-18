
import 'dart:convert';

import 'package:formvalidation/src/models/fechas_model.dart';
import 'package:http/http.dart' as http;



class FechasProvider {
  
  // ingresamos la url del servidor api
  final String _url = 'https://pure-springs-70195.herokuapp.com';


   Future<List<dynamic>> mostrarFechas() async{

    final url = '$_url/fecha/mesActual';
    final resp = await http.post(url);


    final decodeData = json.decode(resp.body);
    
    // print(decodeData);

    if (decodeData == null) {
      return [];
    }

    final fechaslista = new Fechas.fromJsonList(decodeData['data']);
    
    print('desde fechas listas');
    print(fechaslista.items[0].mes);


    return fechaslista.items;

  }



}


