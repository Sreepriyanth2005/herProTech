import 'package:flutter/material.dart';
import 'package:herprotech/model/user_model.dart';
import 'package:herprotech/pages/home_page.dart';
import 'package:herprotech/pages/login.dart';
import 'package:herprotech/pages/reqister.dart';
import 'package:herprotech/storage/store_values.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = StoreService.getEmployeeData() as UserModel;
    Widget initialRoute;

    if (user.userName == null) {
      initialRoute = LoginPage();
    } else {
      initialRoute = HomePage();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => initialRoute,
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
