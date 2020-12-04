import 'dart:convert';

import 'package:http/http.dart' as http;

import 'base_url.dart';

class ApiAuth {
  static Future<http.Response> register(body) async {
    final response = await http.post('${URLS.BASE_URL}/user/register',
        body: jsonEncode(body), headers: {"Content-type": "application/json"});
    /*if (response.statusCode == 201) {
      print(response.body);
      return true;
    } else {
      print(response.statusCode);
      print(response.body);*/
    return response;
  }

  static Future<http.Response> login(body) async {
    final response = await http.post('${URLS.BASE_URL}/user/login',
        body: jsonEncode(body), headers: {"Content-type": "application/json"});
    /*if (response.statusCode == 201) {
      print(response.body);
      return true;
    } else {
      print(response.statusCode);
      print(response.body);*/
    return response;
  }
}
