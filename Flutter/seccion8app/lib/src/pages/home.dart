import 'package:flutter/material.dart';
import 'package:seccion8app/src/providers/db_providers.dart';
import 'direcciones.dart';
import 'mapas.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:seccion8app/src/models/scan_model.dart';
export 'package:seccion8app/src/models/scan_model.dart';



class Home extends StatefulWidget{

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('QR Scanner'),
       actions: <Widget>[
         IconButton(
           icon: Icon(Icons.delete_forever),
           onPressed: () {},
         ),
       ],
      ),

    body: _callPage(0),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR() async {

    String futureString = 'https://fernando-herrera.com';

  //  try {
    //  futureString = await BarcodeScanner.scan();
    //} catch( e ) {
     // futureString = e.toString();
    //}


    if(futureString != null) {

      final scan = ScanModel( valor: futureString );
      DBProvider.db.nuevoScan(scan);

    }

  }


  Widget _callPage ( int paginaActual ){

    switch( paginaActual ) {

      case 0: return Mapa();
      case 1: return Direcciones();

      default:
        return Mapa();
   }
  }

  Widget _crearBottomNavigationBar() {

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
       },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones')
        ),
      ],
    );
  }
}
