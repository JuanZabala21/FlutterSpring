import 'package:flutter/material.dart';
import 'package:frontflutter/databasehelper.dart';
import 'package:frontflutter/listuser.dart';

class EditUserPage extends StatefulWidget {
  final List list;
  final int index;

  const EditUserPage(this.list, this.index);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {

  DataBaseHelper databasehelper = DataBaseHelper();

  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerAddress;
  TextEditingController controllerId;

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListUsers()),
  );

    if (result) {
      setState(() {
      });
  }
}

@override
void initState(){
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
    return Scaffold(
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            Column(children: [
              ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: new TextFormField(
                controller: controllerId,
                decoration: new InputDecoration(
                  hintText: "Id",
                  labelText: "Id",
                 ),
               ),
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                title: new TextFormField(
                  controller: controllerName,
                  validator: (value) {
                    if (value.isEmpty) 
                      return "name"; 
                  },
                  decoration: new InputDecoration(
                    hintText: "name",
                    labelText: "name",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                title: new TextFormField(
                  controller: controllerEmail,
                  validator: (value) {
                    if (value.isEmpty)
                      return "email";
                  },
                  decoration: new InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                title: new TextFormField(
                  controller: controllerAddress,
                  validator: (value) {
                    if (value.isEmpty)
                      return "address";
                  },
                  decoration: new InputDecoration(
                    hintText: "Address",
                    labelText: "Address",
                  ),
                ),
              ),
              const Divider(
                height: 1.0,
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0)
              ),
              RaisedButton(
                child: new Text("Edit"),
                color: Colors.blueAccent,
                onPressed: () {
                   databasehelper.editUser
                     (
                       idController.text.trim(),
                       nameController.text.trim(),
                       emailController.text.trim(),
                       addressController.text.trim()
                     );
                  _navigateList(context);
                },
               )
             ],
            )
          ],
        ),
      ),
    );
  }
}
