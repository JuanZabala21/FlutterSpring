import 'package:flutter/material.dart';
import 'package:seccion8app/src/models/scan_model.dart';
import 'package:seccion8app/src/providers/db_providers.dart';

class Mapa extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScanModel>>(
      future: DBProvider.db.getTodosScans(),
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {

        if ( !snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }

        final scans = snapshot.data;

        if (scans.length == 0){
          return Center(
            child: Text('No hay información'),
          );
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, i) => Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direction) => DBProvider.db.deleteScan( scans[i].id ),
            child:   ListTile(
              leading: Icon( Icons.cloud_queue, color: Theme.of(context).primaryColor),
              title: Text(scans[i].valor),
              subtitle: Text('ID; ${ scans[i].id }'),
              trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey),
            ),
          )
        );



      },
    );
  }
}