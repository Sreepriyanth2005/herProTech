import 'package:flutter/material.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  final String? errorText;
  final TextEditingController? controller;

  const CustomTextField({
    this.controller,
    super.key,
    required this.label,
    required this.hintText,
    this.keyboardType,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      width: 334,
      height: errorText != null ? 70 : 54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveContainer(
            width: 334,
            height: 15,
            child: ResponsiveText(
              label,
              style: StyleConstants.profileLabelTextStyle,
            ),
          ),
          ResponsiveContainer(
            width: 350,
            height: 38,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: StyleConstants.formHintTextStyle,
                errorText: errorText,
                border: const UnderlineInputBorder(),
              ),
              style: StyleConstants.formValueTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
