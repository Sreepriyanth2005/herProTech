import 'package:flutter/material.dart';

class StyleConstants {
    static const TextStyle profileLabelTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: Color.fromRGBO(164, 164, 164, 1),
    height: 1.21,
  );
    static const TextStyle profileTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: Color.fromRGBO(211, 229, 255, 1),
    height: 1.428,
  );
    static const TextStyle formHintTextStyle = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    fontFamily: 'Inter',
  );

  static const TextStyle formValueTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    fontFamily: 'Inter',
  );

   static TextStyle customStyle(
      double fontSize, Color? color, FontWeight? fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamily: 'Inter',
      color: color ?? Colors.white,
      height: 1.2,
    );
  }
    static const TextStyle formButtonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: Color.fromRGBO(53, 50, 43, 1),
    height: 1.25,
  );
}