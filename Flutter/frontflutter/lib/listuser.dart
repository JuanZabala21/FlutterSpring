import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  List data;

  Future<List> getData() async {
    final response = await http.get("http://10.1.209.95:8787/users");
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text('Lista de Usuarios'),
        actions: []),
        body: FutureBuilder<List>(
        future: getData() ,
        builder: (context, snapshot) {
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
          ? ItemList(
            list: snapshot.data,
          )
          : Center(
          child: CircularProgressIndicator(),
          );
        }),
      );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: List == null ? 0 : list.length,
      itemBuilder: (context, i){
        return Column(
          children: [
            new Container(
              padding:const EdgeInsets.all(10.0),
              child:new GestureDetector(
                onTap: (){},
                child: Container(
                  height: 100.3,
                  child:new Card(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       Padding(
                           padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                         Container(
                         child: Text(
                           list[i]['name'].toString(),
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black87,
                            ),
                           ),
                          ),
                          ],
                         ),
                       ),
                      ],
                    ),
                  ),
                ),
              )
            )
          ]
        );
      }
    );
  }
}






















