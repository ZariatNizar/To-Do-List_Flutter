import 'package:flutter/material.dart';

import 'screens/homepage.dart';
import 'screens/login.dart';
import 'screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => login(),
      '/register': (context) => registerpage(),
      '/home': (context) => HomePage(),
    });
  }
}
