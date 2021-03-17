import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'show rootBundle;
import 'dart:convert';

class _MenuProvider {
  
  List<dynamic> opciones = [];
  
  _MenuProvider()  {
    //cargarData();
  }

   Future <List<dynamic>> cargarData() async {

    final resp = await rootBundle.loadString('data/info.json');

    Map dataMap = json.decode( resp );
    print( dataMap['rutas'] );
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();