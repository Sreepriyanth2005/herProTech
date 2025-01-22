import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double baseScreenWidth;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const ResponsiveText(
    this.text, {
    super.key,
    required this.style,
    this.baseScreenWidth = 414,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  double _calculateResponsiveFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaleFactor = screenWidth / baseScreenWidth;
    return (style.fontSize ?? 14) * scaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        fontSize: _calculateResponsiveFontSize(context),
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}