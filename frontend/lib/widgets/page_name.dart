import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class PageNameWidget extends StatelessWidget {
  final String name;
  const PageNameWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 366,
      height: 64,
      child: Center(
        child: ResponsiveText(
          name,
          style: StyleConstants.customStyle(
            24,
            Colors.white,
            FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
