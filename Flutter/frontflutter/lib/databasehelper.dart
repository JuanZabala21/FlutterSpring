import 'dart:convert';
import 'package:http/http.dart' as http;

class DataBaseHelper {
  //Funcion para agregar un usuario a la BD
  Future<http.Response> addUser(String nameController,
      String emailController, String addressController) async {
    var url = 'http://10.1.209.95/addUser';

    Map data = {
      'name': '$nameController',
      'email': '$emailController',
      'address': '$addressController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //function for update or put
  Future<http.Response> editUser(String id, String nameController,
      String emailController, String addressController) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://10.1.209.95/update';

    Map data = {
      'id': '$a',
      'name': '$nameController',
      'email': '$emailController',
      'address': '$addressController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
  // void editarUser(
  //     String _id, String name, String price, String stock) async {

  //   String myUrl = "http://192.168.1.56:3000/editUser/$_id";
  //   http.put(myUrl, body: {
  //     "name": "$name",
  //     "price": "$price",
  //     "stock": "$stock"
  //   }).then((response) {
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }

  Future<http.Response> removeRegister(String id) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://10.1.209.95/delete/$a';

    var response =
    await http.delete(url, headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }
}
