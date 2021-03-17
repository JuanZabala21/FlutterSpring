import 'package:flutter/material.dart';
import 'package:frontflutter/listuser.dart';
import 'package:hexcolor/hexcolor.dart';

import 'databasehelper.dart';

class EditUsers extends StatefulWidget {
  final List list;
  final int index;

  EditUsers({this.list, this.index});

  @override
  _EditUsers createState() => _EditUsers();
}

class _EditUsers extends State<EditUsers> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  TextEditingController controllerId;
  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerAddress;

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListUsers()),
    );

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    controllerId = new TextEditingController(
        text: widget.list[widget.index]['id'].toString());
    controllerName = new TextEditingController(
        text: widget.list[widget.index]['name'].toString());
    controllerEmail = new TextEditingController(
        text: widget.list[widget.index]['email'].toString());
    controllerAddress = new TextEditingController(
        text: widget.list[widget.index]['address'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerId,
                    decoration: new InputDecoration(
                      hintText: "Id",
                      labelText: "Id",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerName,
                    validator: (value) {
                      if (value.isEmpty) return "name";
                    },
                    decoration: new InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                    ),
                  ),
                ),

                new ListTile(
                  leading: const Icon(Icons.settings_input_component,
                      color: Colors.black),
                  title: new TextFormField(
                    controller: controllerEmail,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa email";
                    },
                    decoration: new InputDecoration(
                      hintText: "email",
                      labelText: "email",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerAddress,
                    validator: (value) {
                      if (value.isEmpty) return "address";
                    },
                    decoration: new InputDecoration(
                      hintText: "address",
                      labelText: "address",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit"),
                  color: HexColor("#3EBED0"),
                  onPressed: () {
                    databaseHelper.editUser(
                        controllerId.text.trim(),
                        controllerName.text.trim(),
                        controllerEmail.text.trim(),
                        controllerAddress.text.trim());
                    _navigateList(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
