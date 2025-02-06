import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color color;
  final bool isBold;
  final TextAlign align;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.weight = FontWeight.normal,
    this.color = Colors.black,
    this.isBold = false,
    this.align = TextAlign.left,
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
      textAlign: align,
    );
  }
}
