import 'package:flutter/material.dart';
import 'package:point_calculator/components/text.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String? bodyText;
  final void Function() onTap;

  const CustomCard({
    super.key,
    required this.title,
    this.bodyText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: double.infinity,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(text: title, fontSize: 24, isBold: true),
                if (bodyText != null) ...[
                  const SizedBox(height: 8),
                  CustomText(text: "メンバー：${bodyText!}", fontSize: 16, isBold: false, color: Colors.grey),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
