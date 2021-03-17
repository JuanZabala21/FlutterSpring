import 'package:flutter/material.dart';
import 'file:///C:/Users/juan%20zabala/IdeaProjects/FlutterSpring/Flutter/seccion8app/lib/src/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRReader',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => Home()
        },
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
    );
  }
}
