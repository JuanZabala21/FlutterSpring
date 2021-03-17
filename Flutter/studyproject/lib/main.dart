import 'package:flutter/material.dart';

import 'package:studyproject/src/pages/home.dart';
import 'package:studyproject/src/pages/alert.dart';
import 'package:studyproject/src/pages/avatar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components',
      debugShowCheckedModeBanner: false,
        home: Avatar(),
      //initialRoute: '/' ,
      //routes: <String, WidgetBuilder>{
       // '/'       : ( BuildContext context ) => Homepage()
      //},

    );
  }
}
