import 'package:flutter/material.dart';
import 'package:herprotech/pages/login.dart';
import 'package:herprotech/pages/reqister.dart';

class MyRoute {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  // Define your route names here
}

Map<String, WidgetBuilder> routes = {
  // MyRoute.home: (context) => MyWidget(),
  MyRoute.login: (context) => LoginPage(),
  MyRoute.register: (context) => RegisterPage(),
};


