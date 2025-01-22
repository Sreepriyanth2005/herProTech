// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:herprotech/widgets/phone_field.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/config/config.dart';
import 'package:herprotech/widgets/text_field.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_sizedBox.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class RegisterContainer extends StatefulWidget {
  const RegisterContainer({super.key});

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  bool isLoading = false;

  void _sumbit() async {
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final repassword = repasswordController.text;
    final phoneNumber = phoneController.text;
    print(
        'Username: $username, Email: $email,PhoneNumber : $phoneNumber, Password: $password, Re-Password: $repassword');
    setState(() {
      isLoading = true;
    });
    if (password != repassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password and Re-Password are not same'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    register(username, email, phoneNumber, password, repassword);
  }

  void register(String username, String email, String phoneNumber,
      String password, String repassword) async {
    try {
      final uri = Uri.parse('${Config.baseUrl}/register');
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'userName': username,
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password,
        }),
      );

      setState(() {
        isLoading = false;
      });
      final responseData = jsonDecode(response.body);
      final message = responseData['message'];

      if (message == 'registered') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration successful'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushNamed(context, '/');
      } else if (message == 'required') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('All fields are required'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (message == 'exists') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email/Phone already exists'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        final errorMessage = responseData['message'];
        print('Error Message: $errorMessage');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResponsiveContainer(
          width: 366,
          height: 350,
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
                keyboardType: TextInputType.text,
                label: 'USERNAME',
                hintText: 'Enter your username',
                onChanged: (value) {},
              ),
              ResponsiveSizedBox(width: 0, height: 10),
              CustomTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                label: 'EMAIL',
                hintText: 'Enter your email',
                onChanged: (value) {},
              ),
              ResponsiveSizedBox(width: 0, height: 10),
              CustomePhoneField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                label: 'PHONE NUMBER',
                hintText: 'Enter your phone Number',
                onChanged: (value) {},
              ),
              ResponsiveSizedBox(width: 0, height: 10),
              CustomTextField(
                controller: passwordController,
                label: 'PASSWORD',
                hintText: 'Enter your password',
                onChanged: (value) {},
              ),
              ResponsiveSizedBox(width: 0, height: 10),
              CustomTextField(
                controller: repasswordController,
                keyboardType: TextInputType.text,
                label: 'RE-ENTER PASSWORD',
                hintText: 'Enter your reset password',
                onChanged: (value) {},
              ),
              ResponsiveSizedBox(width: 0, height: 10),
            ],
          ),
        ),
        ResponsiveSizedBox(width: 0, height: 20),
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
                      color: Color.fromRGBO(255, 203, 69, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GestureDetector(
                      onTap: _sumbit,
                      child: Center(
                        child: ResponsiveText(
                          'Sumbit',
                          style: StyleConstants.formButtonTextStyle,
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
                Navigator.pushNamed(context, '/');
              },
              child: ResponsiveText(
                'If Already Have Account Login Here',
                style: StyleConstants.customStyle(
                    16, Color.fromRGBO(6, 4, 42, 1), FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
