import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class SosButtonWidget extends StatelessWidget {
  const SosButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          print('SOS Button Pressed');
        },
        child: Center(
          child: ResponsiveText(
            'SOS',
            style: StyleConstants.customStyle(
              50,
              Color.fromRGBO(4, 6, 49, 1),
              FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
