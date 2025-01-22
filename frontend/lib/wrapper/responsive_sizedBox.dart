import 'package:flutter/material.dart';

class ResponsiveSizedBox extends StatelessWidget {
  static const double baseWidth = 414.0;
  static const double baseHeight = 896.0;

  final double width;
  final double height;
  final Widget? child;

  const ResponsiveSizedBox({
    required this.width,
    required this.height,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final double scaledWidth = (width / baseWidth) * screenWidth;
    final double scaledHeight = (height / baseHeight) * screenHeight;

    return SizedBox(
      width: scaledWidth,
      height: scaledHeight,
      child: child,
    );
  }
}