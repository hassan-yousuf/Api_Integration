import 'dart:convert';

import 'package:apiintegration/Models/user_model.dart';
import 'package:http/http.dart' as http;

getUser() async {
  var response =
      await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));
  var jsonData = jsonDecode(response.body);
  List<UserModel> userhttp = [];
  for (var i in jsonData) {
    UserModel user = UserModel(id: i['id'], name: i['name'], email: i['email']);
    userhttp.add(user);
  }
  return userhttp;
}
