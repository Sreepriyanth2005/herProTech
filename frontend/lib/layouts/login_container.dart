import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/config/config.dart';
import 'package:herprotech/widgets/text_field.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_sizedBox.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void _login() async {
    final username = usernameController.text;
    final password = passwordController.text;
    print('Username: $username, Password: $password');

    setState(() {
      isLoading = true;
    });

    await login(username, password);
  }

  Future login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${Config.baseUrl}/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'identifier': username,
          'password': password,
        }),
      );

      setState(() {
        isLoading = false;
      });

      print('Response Status Code: ${response.statusCode}');

      final responseData = jsonDecode(response.body);
      final message = responseData['message'];

      if (message == 'Login') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacementNamed(context, '/home');
      } else if (message == 'Invalid') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid password'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (message == 'New') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User not found'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResponsiveContainer(
          width: 366,
          height: 170,
          padding: [20, 20, 20, 10],
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: usernameController,
                label: 'USERNAME/EMAIL',
                hintText: 'Enter username or email',
                onChanged: (value) {},
              ),
              const ResponsiveSizedBox(width: 0, height: 10),
              CustomTextField(
                controller: passwordController,
                label: 'PASSWORD',
                hintText: 'Enter your password',
                onChanged: (value) {},
              ),
              const ResponsiveSizedBox(width: 0, height: 20),
            ],
          ),
        ),
        const ResponsiveSizedBox(width: 0, height: 20),
        ResponsiveContainer(
          width: 366,
          height: 40,
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : ResponsiveContainer(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 203, 69, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GestureDetector(
                      onTap: _login,
                      child: Center(
                        child: ResponsiveText(
                          'Login',
                          style: StyleConstants.formButtonTextStyle,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        const ResponsiveSizedBox(width: 0, height: 20),
        ResponsiveContainer(
          width: 366,
          height: 40,
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: ResponsiveText(
                'If you don\'t have an account, register here',
                style: StyleConstants.customStyle(
                    16, const Color.fromRGBO(6, 4, 42, 1), FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
