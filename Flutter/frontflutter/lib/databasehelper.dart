import 'package:http/http.dart' as http;
import 'dart:convert';

class DataBaseHelper {

  Future<http.Response> addUser (String nameController, String emailController, String addressController, void pop) async {
  var url = "http://10.1.209.95:8787/addUser";
  Map data = {
    'name': '$nameController',
    'email': '$emailController',
    'address': '$addressController'
  };

  var body = json.encode(data);
  var response = await http.post(url,
  headers: {"Content-Type": "application/json"}, body: body);
  print("${response.statusCode}");
  print("${response.body}");
  return response;
   }

   //Update
  Future<http.Response> editUser (String id, String nameController, String emailController, String addressController, void pop) async {
    int a = int.parse(id);
    print(a);
    var url = "http://10.1.209.95:8787/update";

    Map data = {
      'name': '$nameController',
      'email': '$emailController',
      'address': '$addressController'
    };

    var body = json.encode(data);

    var response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
  Future<http.Response> removeRegister (String id) async {
    int a = int.parse(id);
    print(a);
    var url = "http://10.1.209.95:8787/delete/$a";

    var response =
    await http.delete(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    return response;
  }
}