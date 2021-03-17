import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final opciones = ['Uno','Dos','Tres'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comp'),
      ),
      body: ListView(
    // children: _crearItems()
      children: _crearItemsCorta()
    ),
    );
  }

  List<Widget> _crearItems() {

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {

      final tempWidget = ListTile(
        title: Text( opt ),
      );
      lista..add(tempWidget);
      lista..add( Divider());

    }

    return lista;
  }

  List<Widget> _crearItemsCorta(){

    return opciones.map( (item){

      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('etc'),
            leading: Icon(Icons.account_balance_wallet ),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){ },
          ),
          Divider()
        ],
      );

    }).toList();

  }

}
