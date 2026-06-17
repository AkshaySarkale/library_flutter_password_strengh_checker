import 'package:flutter/material.dart';

class Passwordmeter extends StatelessWidget {
  final Color strengthColor;
  final double strength;
  final double minHight;
  final BorderRadius? borderRadius;
  final Color backgroundColors;

  const Passwordmeter({
    super.key,
    required this.strengthColor,
    required this.strength,
    required this.backgroundColors,
    this.minHight=18,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: strength,
      minHeight: minHight,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      color: strengthColor,
      backgroundColor: backgroundColors,
    );
  }
}
