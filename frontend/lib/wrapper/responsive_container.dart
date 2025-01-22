import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  static const double baseWidth = 414.0;
  static const double baseHeight = 896.0;

  final double width;
  final double height;
  final List<double> padding;
  final Color? color;
  final Widget child;
  final BoxDecoration? decoration;

  const ResponsiveContainer({
    required this.width,
    required this.height,
    this.color,
    this.padding = const [0, 0, 0, 0],
    required this.child,
    this.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final double scaledWidth = (width / baseWidth) * screenWidth;
    final double scaledHeight = (height / baseHeight) * screenHeight;

    final double pLeft = padding[0];
    final double pTop = padding[1];
    final double pRight = padding[2];
    final double pBottom = padding[3];
    final double scaledPaddingLeft = (pLeft / baseWidth) * screenWidth;
    final double scaledPaddingTop = (pTop / baseHeight) * screenHeight;
    final double scaledPaddingRight = (pRight / baseWidth) * screenWidth;
    final double scaledPaddingBottom = (pBottom / baseHeight) * screenHeight;

    return Container(
      width: scaledWidth,
      height: scaledHeight,
      padding: EdgeInsets.fromLTRB(
        scaledPaddingLeft,
        scaledPaddingTop,
        scaledPaddingRight,
        scaledPaddingBottom,
      ),
      color: color,
      decoration: decoration,
      child: child,
    );
  }
}