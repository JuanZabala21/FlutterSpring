import 'package:flutter/material.dart';
import 'package:frontflutter/listuser.dart';

import 'databasehelper.dart';

class Detail extends StatefulWidget {
 List list; 
 int index; 
 Detail(this.index,this.list);
  @override
  _DetailState createState() => _DetailState();
}
class _DetailState extends State<Detail> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialpageRoute(builder: (context) => ListUsers()),
    );

    if(result) {
      setState(() {

      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
