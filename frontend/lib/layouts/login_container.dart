import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/widgets/text_field.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_sizedBox.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class LoginContainer extends StatelessWidget {
  LoginContainer({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    final username = usernameController.text;
    final password = passwordController.text;
    print('Username: $username, Password: $password');
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
              ResponsiveSizedBox(width: 0, height: 10),
              CustomTextField(
                controller: passwordController,
                label: 'PASSWORD',
                hintText: 'Enter your password',
                onChanged: (value) {},
              ),
              ResponsiveSizedBox(width: 0, height: 20),
            ],
          ),
        ),
        ResponsiveSizedBox(width: 0, height: 20),
        ResponsiveContainer(
          width: 366,
          height: 40,
          child: Center(
            child: ResponsiveContainer(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 203, 69, 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                onTap: _login,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: ResponsiveText(
                      'Login',
                      style: StyleConstants.formButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        ResponsiveSizedBox(width: 0, height: 20),
        ResponsiveContainer(
          width: 366,
          height: 40,
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: ResponsiveContainer(
                width: 260,
                height: 20,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color.fromRGBO(6, 4, 42, 1),
                    ),
                  ),
                ),
                child: ResponsiveText(
                  'If doesn\'t have an account, register here',
                  style: StyleConstants.customStyle(
                      16, Color.fromRGBO(6, 4, 42, 1), FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
