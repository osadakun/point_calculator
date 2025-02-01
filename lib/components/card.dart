import 'package:flutter/material.dart';
import 'package:point_calculator/components/text.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const CustomCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: CustomText(text: title, fontSize: 24, isBold: true),
          ),
        ),
      ),
    );
  }
}
