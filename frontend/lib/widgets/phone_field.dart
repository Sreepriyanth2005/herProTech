import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:herprotech/assets/style_constants.dart';
import 'package:herprotech/wrapper/responsive_container.dart';
import 'package:herprotech/wrapper/responsive_sizedBox.dart';
import 'package:herprotech/wrapper/responsive_text.dart';

class CustomePhoneField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  final String? errorText;
  final TextEditingController? controller;

  const CustomePhoneField(
      {super.key,
      required this.label,
      required this.hintText,
      this.keyboardType,
      required this.onChanged,
      this.errorText,
      this.controller});

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
            width: 334,
            height: 38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ResponsiveContainer(
                  width: 35,
                  height: 38,
                  child: Center(
                    child: ResponsiveText('+91',
                        style: StyleConstants.formValueTextStyle),
                  ),
                ),
                const ResponsiveSizedBox(width: 4, height: 0),
                ResponsiveContainer(
                  width: 285,
                  height: 38,
                  child: TextFormField(
                    controller: controller,
                    keyboardType: keyboardType,
                    inputFormatters: keyboardType == TextInputType.phone
                        ? [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ]
                        : null,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: StyleConstants.formHintTextStyle,
                      errorText: errorText != null
                          ? errorText!.contains('required')
                              ? null
                              : errorText
                          : null,
                      border: const UnderlineInputBorder(),
                    ),
                    style: StyleConstants.formValueTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}