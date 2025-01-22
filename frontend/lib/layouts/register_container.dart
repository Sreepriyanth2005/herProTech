import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/widgets/text_field.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_sizedBox.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class RegisterContainer extends StatelessWidget {
  RegisterContainer({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  void _sumbit() {
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final repassword = repasswordController.text;
    final phoneNumber = phoneController.text;
    print(
        'Username: $username, Email: $email,PhoneNumber : $phoneNumber, Password: $password, Re-Password: $repassword');
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
                label: 'USERNAME',
                hintText: 'Enter your username',
                onChanged: (value) {},
              ),
              ResponsiveSizedBox(width: 0, height: 10),
              CustomTextField(
                controller: emailController,
                label: 'EMAIL',
                hintText: 'Enter your email',
                onChanged: (value) {},
              ),
              ResponsiveSizedBox(width: 0, height: 10),
              CustomTextField(
                controller: phoneController,
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
            child: ResponsiveContainer(
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
                  'If Already Have Account Login Here',
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
