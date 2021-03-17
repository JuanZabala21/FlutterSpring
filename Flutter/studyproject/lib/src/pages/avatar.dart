import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.person_add_alt_1_rounded),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}
