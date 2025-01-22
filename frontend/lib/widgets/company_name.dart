import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class CompanyName extends StatelessWidget {
  const CompanyName({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveText(
        'HerProTech',
        style: StyleConstants.customStyle(
          32,
          Color.fromRGBO(255, 249, 215, 1),
          FontWeight.w600,
        ),
      ),
    );
  }
}
