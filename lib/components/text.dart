import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color color;
  final bool isBold;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.weight = FontWeight.normal,
    this.color = Colors.black,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: isBold ? FontWeight.bold : weight,
        fontSize: fontSize,
      ),
    );
  }
}
