import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

saveTokenSharedPref(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String> getTokenSharedPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.getString('token');
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

bool validatePhone(String value) {
  Pattern pattern = r'^(2|3|4|5|7|8|9)[0-9]{7}';
  RegExp regex = new RegExp(pattern);
  if (value.length == 8) {
    return (!regex.hasMatch(value)) ? false : true;
  } else {
    return false;
  }
}
