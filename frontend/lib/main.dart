import 'package:flutter/material.dart';
import 'package:herprotech/pages/home_page.dart';
import 'package:herprotech/pages/login.dart';
import 'package:herprotech/pages/reqister.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        '/register': (context) => const RegisterPage(),
        '/home' : (context) => const HomePage(),
      },
    );
  }
}
