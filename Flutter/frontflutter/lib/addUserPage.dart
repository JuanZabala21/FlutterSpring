import 'package:flutter/material.dart';
import 'package:frontflutter/databasehelper.dart';


import 'databasehelper.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {

  DataBaseHelper databasehelper = DataBaseHelper();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(padding: const EdgeInsets.only(
                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
        children: [
          Container(
            height: 50,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'name',
                hintText: 'name',
                icon: new Icon(Icons.person),
              ),
            ),
          ),
          Container(
            height: 50,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email',
                hintText: 'email',
                icon: new Icon(Icons.email),
              )
            )
          ),
            Container(
            height: 50,
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'address',
                hintText: 'address',
                icon: new Icon(Icons.place),
              ),
             ),
            ),
            Padding(
              padding: new EdgeInsets.only(top: 44.0),
            ),
            Container(
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  databasehelper.addUser
                    (
                      nameController.text.trim(),
                      emailController.text.trim(),
                      addressController.text.trim()
                    );
                  Navigator.pop(context, true);
                    },
                  color: Colors.blue,
                  child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white, backgroundColor: Colors.blue),
                    ),
                   ),
                  ),
               ],
             ),
           ),
         );
       }
     }
