


import 'dart:async';

import 'package:seccion8app/src/models/scan_model.dart';
import 'package:seccion8app/src/providers/db_providers.dart';

class ScansBloc {

  static final ScansBloc _singleton = new ScansBloc._interanl();

  factory ScansBloc() {
    return _singleton;
  }

ScansBloc._interanl() {
  // Obtener Scans de la base de datos
  }

final _scansController = StreamController <List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream;

  dispose() {
    _scansController.close();
  }

  obtenerScans() async{
    _scansController.sink.add( await DBProvider.db.getTodosScans() );
  }

  agregarScan( ScanModel scan ){
    DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScan( int id ) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScanTODOS() async {
    DBProvider.db.deleteAll();
    obtenerScans();
  }
}



