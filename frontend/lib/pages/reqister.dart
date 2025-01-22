import 'package:flutter/material.dart';
import 'package:herprotech/layouts/register_container.dart';
import 'package:herprotech/widgets/company_name.dart';
import 'package:herprotech/widgets/page_name.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_sizedBox.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 62, 138, 1),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: ResponsiveContainer(
              width: 366,
              height: 50,
              child: CompanyName(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PageNameWidget(name: 'Register Page'),
                ResponsiveSizedBox(width: 0, height: 10),
                RegisterContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
